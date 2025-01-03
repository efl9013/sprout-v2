open Ast 
open Common 
open Prodreach 
open Avail 

(* RCC is first split into a set of queries for each participant p, 
   then it enumerates pairs of transitions in which p is the receiver in both 
   and the senders are not the same *)

let filter_transitions_rcc_participant (ls: (symbolic_transition * symbolic_transition) list) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.receiver = p && tr2.receiver = p && tr1.sender <> tr2.sender) ls

(* For each pair of transitions, generate five conjuncts *)
(* The first four conjuncts are all identical to and borrowed from NMC *)

(* First conjunct specifies the prestates of the transitions under consideration *)
(* i.e. the values of s1 and s2 in the existential quantification of NMC *) 
let first_conjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	"(s1 = " ^ string_of_int tr1.pre ^ " /\\ " ^ 
	"s2 = " ^ string_of_int tr2.pre ^ " )\n" 

(* Second conjunct calls prodreach_p on the prestates and prestate registers of each copy *)
let second_conjunct_from_pair (prot: symbolic_protocol) (p: participant) : string = 
	"(prodreach_" ^ p ^ " " ^
	"s1 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

(* Third conjunct is the first transition predicate with x1 as communication variable *)
let third_conjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	let tr1 = fst pair in 
	let phi1 = substitute (append1 tr1.predicate) (tr1.comm_var ^ "1") "x1" in 
	"(" ^ 
	string_of_formula phi1 ^ 
	")\n" 

(* Fourth conjunct is the second transition predicate with x2 as communication variable *)
let fourth_conjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
  let tr2 = snd pair in 
  let phi2 = substitute (append2 tr2.predicate) (tr2.comm_var ^ "2") "x2" in 
	"(" ^ 
	string_of_formula phi2 ^ 
	")\n" 

(* Fifth conjunct calls avail on the sender of tr1, the receiver p, the blocked set {p} *)
let fifth_conjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	let tr1 = fst pair in 
	"(avail_" ^ tr1.sender ^ p ^ "_" ^ p ^ " " ^
	"x1 " ^ 
	"s'2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "'2 ") "" prot.registers ^ 
	")\n"

let generate_rcc_preamble_from_pair_for_participant (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	"exists " ^ 
	"(s1: int) (s'1: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	"(s2: int) (s'2: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int) (x2: int)" ^ 
	". \n" ^
	first_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	second_conjunct_from_pair prot p ^ 
	" /\\ \n" ^
	third_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fifth_conjunct_from_pair prot pair p ^ 
	"\n" ^ 
	"s.t.\n"

let generate_all_avail (prot: symbolic_protocol) : string = 
	let all_distinct_pairs = all_distinct_participant_pairs prot in 
	List.fold_left (fun acc (p,q) -> acc ^ "\n" ^ generate_avail_for_participant_pair prot p q) "" all_distinct_pairs

let generate_rcc_from_pair_for_participant (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	generate_rcc_preamble_from_pair_for_participant prot pair p ^ 
	"\n" ^
	generate_prodreach_for_participant prot p ^ 
	"\n" ^ 
	generate_all_avail prot

let generate_rcc_filename_from_pair_for_participant (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	p ^ "_rcc_" ^ 
	string_of_int tr1.pre ^ string_of_int tr1.post ^ "_" ^ 
	string_of_int tr2.pre ^ string_of_int tr2.post ^
	".hes"

let generate_rcc_queries_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) = 
  let transition_pairs = filter_transitions_rcc_participant (all_transition_pairs prot.transitions) p in 
  List.iter (fun pair -> write_to_file  
                          (Filename.concat dir (generate_rcc_filename_from_pair_for_participant pair p))
                          (generate_rcc_from_pair_for_participant prot pair p))
            transition_pairs 

let generate_rcc_queries (prot: symbolic_protocol) (dir: string) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_rcc_queries_for_participant prot p dir) participants 

