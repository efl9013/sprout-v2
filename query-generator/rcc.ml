open Ast 
open Common 
open Prodreach 
open Avail 

(* This file defines 2 versions of RCC: 
	 Each version can choose between 2 versions of prodreach generation: 
	 a. One prodreach predicate altogether, containing a disjunction for each pair of states,
	 b. One prodreach predicate for each pair of states, i.e. curried prodreach *) 

(* Optimizations present in all versions: 
	- Pre-filter for simultaneously reachable states according to participant projection of transition labels, 
	- Eliminate state equality predicates and directly instantiate values in inductive predicates,
*) 

(* RCC is first split into a set of queries for each participant p, 
   then it enumerates pairs of transitions in which p is the receiver in both 
   and the senders are not the same *)

let filter_transitions_rcc_participant (ls: (symbolic_transition * symbolic_transition) list) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.receiver = p && tr2.receiver = p && tr1.sender <> tr2.sender) ls

let filter_simreach_transitions_rcc_participant (prot: symbolic_protocol) (ls: (symbolic_transition * symbolic_transition) list) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.receiver = p && tr2.receiver = p && tr1.sender <> tr2.sender && simultaneously_reachable_for prot tr1.pre tr2.pre p) ls
(* For each pair of transitions, generate five conjuncts *)
(* The first four conjuncts are all identical to and borrowed from NMC *)

(* First conjunct specifies the prestates of the transitions under consideration *)
(* i.e. the values of s1 and s2 in the existential quantification of NMC *) 
let first_conjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	"(s1 = " ^ string_of_int tr1.pre ^ " /\\ " ^ 
	"s'1 = " ^ string_of_int tr1.post ^ " /\\ " ^ 
	"s2 = " ^ string_of_int tr2.pre ^ " /\\ " ^ 
	"s'2 = " ^ string_of_int tr2.post ^ 
	")\n" 

(* Second conjunct calls prodreach_p on the prestates and prestate registers of each copy *)
let second_conjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) : string = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	"(prodreach_" ^ p ^ " " ^
	string_of_int tr1.pre ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	string_of_int tr2.pre ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

let second_conjunct_from_pair_vb (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) : string = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	"(prodreach_" ^ p ^ "_" ^
	string_of_int tr1.pre ^ "_" ^ 
	string_of_int tr2.pre ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
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
	let tr2 = snd pair in 
	"(avail_" ^ tr1.sender ^ p ^ "_" ^ p ^ " " ^
	"x1 " ^ 
	string_of_int tr2.post ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "'2 ") "" prot.registers ^ 
	")\n"

let generate_rcc_preamble_from_pair_for_participant (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	"exists " ^ 
	(* "(s1: int) (s'1: int) " ^  *)
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	(* "(s2: int) (s'2: int) " ^  *)
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int) (x2: int)" ^ 
	". \n" ^
	(* first_conjunct_from_pair prot pair p ^  *)
	(* " /\\ \n" ^ *)
	second_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	third_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fifth_conjunct_from_pair prot pair p ^ 
	"\n" ^ 
	"s.t.\n"

let generate_rcc_preamble_from_pair_for_participant_vb (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	"exists " ^ 
	(* "(s1: int) (s'1: int) " ^  *)
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	(* "(s2: int) (s'2: int) " ^  *)
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int) (x2: int)" ^ 
	". \n" ^
	(* first_conjunct_from_pair prot pair p ^  *)
	(* " /\\ \n" ^ *)
	second_conjunct_from_pair_vb prot pair p ^ 
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

let generate_rcc_first_line_for_participant (prot: symbolic_protocol) (p: participant) = 
	"exists " ^ 
	(* "(s1: int) (s'1: int) " ^  *)
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	(* "(s2: int) (s'2: int) " ^  *)
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int) (x2: int)" ^ 
	". \n" 

let generate_rcc_body_from_pair_for_participant (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	"(" ^ 
	(* first_conjunct_from_pair prot pair p ^  *)
	(* " /\\ \n" ^ *)
	second_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	third_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fifth_conjunct_from_pair prot pair p ^ 
	")"

let generate_rcc_body_from_pair_for_participant_vb (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	"(" ^ 
	(* first_conjunct_from_pair prot pair p ^  *)
	(* " /\\ \n" ^ *)
	second_conjunct_from_pair_vb prot pair p ^ 
	" /\\ \n" ^
	third_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fifth_conjunct_from_pair prot pair p ^ 
	")"

let generate_rcc_preamble_for_participant (prot: symbolic_protocol) (p: participant) (ls : (symbolic_transition * symbolic_transition) list) = 
	generate_rcc_first_line_for_participant prot p ^ 
	List.fold_left (fun acc pair -> acc ^ "\n\\/\n" ^ generate_rcc_body_from_pair_for_participant prot pair p) "false" ls ^ 
	"\ns.t.\n"

let generate_rcc_preamble_for_participant_vb (prot: symbolic_protocol) (p: participant) (ls : (symbolic_transition * symbolic_transition) list) = 
	generate_rcc_first_line_for_participant prot p ^ 
	List.fold_left (fun acc pair -> acc ^ "\n\\/\n" ^ generate_rcc_body_from_pair_for_participant_vb prot pair p) "false" ls ^ 
	"\ns.t.\n"

let generate_rcc_for_participant (prot: symbolic_protocol) (p: participant) (ls : (symbolic_transition * symbolic_transition) list) = 
	generate_rcc_preamble_for_participant prot p ls ^ 
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n" ^ 
	generate_all_avail prot

let generate_rcc_for_participant_vb (prot: symbolic_protocol) (p: participant) (ls : (symbolic_transition * symbolic_transition) list) = 
	generate_rcc_preamble_for_participant_vb prot p ls ^ 
	"\n" ^ 
	generate_prodreach_vb prot p ^ 
	"\n" ^ 
	generate_all_avail prot

(* let generate_rcc_filename_from_pair_for_participant (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	p ^ "_rcc_" ^ 
	string_of_int tr1.pre ^ string_of_int tr1.post ^ "_" ^ 
	string_of_int tr2.pre ^ string_of_int tr2.post ^
	".hes" *)

let generate_rcc_queries_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) =
	(* Toggle the following line to only generate simultaneously reachable transition pairs, or generate all pairs without optimization *)
  	(* let transition_pairs = filter_transitions_rcc_participant (all_transition_pairs prot.transitions) p in  *)
	let transition_pairs = filter_simreach_transitions_rcc_participant prot (all_transition_pairs prot.transitions) p in 
	if transition_pairs <> [] 
	then (let filename = p ^ "_rcc.hes" in 
			write_to_file (Filename.concat dir filename) (generate_rcc_for_participant prot p transition_pairs))
	else ()

let generate_rcc_queries (prot: symbolic_protocol) (dir: string) = 
  let participants = get_receivers prot in 
  List.iter (fun p -> generate_rcc_queries_for_participant prot p dir) participants 

let generate_rcc_queries_vb (prot: symbolic_protocol) (dir: string) = 
  let participants = get_receivers prot in 
  List.iter (fun p -> let transition_pairs = filter_simreach_transitions_rcc_participant prot (all_transition_pairs prot.transitions) p in 
							if transition_pairs <> [] 
							then (let filename = p ^ "_rcc.hes" in 
									write_to_file (Filename.concat dir filename) (generate_rcc_for_participant_vb prot p transition_pairs))
							else ()) 
  				participants 


let generate_rcc_for_pair_v2b (prot: symbolic_protocol) (p: participant) (pair : symbolic_transition * symbolic_transition) = 
	let tr1 = fst pair in 
	let tr2 = snd pair in 
	generate_rcc_first_line_for_participant prot p ^ 
	generate_rcc_body_from_pair_for_participant_vb prot pair p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_vb prot p ^ 
	"\n" ^ 
	(* Since the query is for a particular pair of transitions, we only need to include avail predicates for the sender and receiver in the first transition *)
	generate_avail_for_participant_pair prot tr1.sender tr1.receiver 

let generate_rcc_queries_v2b (prot: symbolic_protocol) (dir: string) = 
  let participants = get_receivers prot in 
  List.iter (fun p -> let transition_pairs = filter_simreach_transitions_rcc_participant prot (all_transition_pairs prot.transitions) p in 
							if transition_pairs <> [] 
							then (List.iter (fun (tr1, tr2) -> write_to_file 
																						(Filename.concat dir (p ^ "_rcc_" ^ string_of_int tr1.pre ^ string_of_int tr1.post ^ "_" ^ string_of_int tr2.pre ^ string_of_int tr2.post ^ ".hes"))
																						(generate_rcc_for_pair_v2b prot p (tr1,tr2)))
										transition_pairs)
							else ()) 
  				participants 

