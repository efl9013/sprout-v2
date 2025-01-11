open Ast 
open Common 
open Prodreach 

(* NMC is first split into a set of queries for each participant p, 
   then it enumerates pairs of transitions in which p is the sender in one and the receiver in the other *)
let filter_transitions_nmc_participant (ls: (symbolic_transition * symbolic_transition) list) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.sender = p && tr2.receiver = p) ls

let filter_simreach_transitions_nmc_participant (prot: symbolic_protocol) (ls: (symbolic_transition * symbolic_transition) list) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.sender = p && tr2.receiver = p && simultaneously_reachable_for prot tr1.pre tr2.pre p) ls
(* For each pair of transitions, generate four conjuncts *)
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

let generate_nmc_first_line_for_participant (prot: symbolic_protocol) (p: participant) = 
	"exists " ^ 
	"(s1: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	"(s2: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int) (x2: int)" ^ 
	". \n" 

let generate_nmc_body_from_pair_for_participant (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) = 
	"(" ^
	first_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	second_conjunct_from_pair prot p ^ 
	" /\\ \n" ^
	third_conjunct_from_pair prot pair p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_pair prot pair p ^ 
	")"

let generate_nmc_preamble_for_participant (prot: symbolic_protocol) (p: participant) = 
	(* Toggle the following line to only generate simultaneously reachable transition pairs, or generate all pairs without optimization *)
	let transition_pairs = filter_simreach_transitions_nmc_participant prot (all_transition_pairs prot.transitions) p in 
	(* let transition_pairs = filter_transitions_nmc_participant (all_transition_pairs prot.transitions) p in  *)
	generate_nmc_first_line_for_participant prot p ^
  List.fold_left (fun acc pair -> acc ^ "\n\\/\n" ^ generate_nmc_body_from_pair_for_participant prot pair p) "false" transition_pairs ^ 
	"\ns.t.\n"

let generate_nmc_for_participant (prot: symbolic_protocol) (p: participant) = 
	generate_nmc_preamble_for_participant prot p ^ 
	"\n" ^ 
	generate_prodreach_for_participant prot p

let generate_nmc_filename_for_participant (p: participant) = 
	p ^ "_nmc.hes"

let generate_nmc_queries_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) = 
	let filename = generate_nmc_filename_for_participant p in 
	write_to_file (Filename.concat dir filename) (generate_nmc_for_participant prot p)

let generate_nmc_queries (prot: symbolic_protocol) (dir: string) = 
  let participants = intersection (get_senders prot) (get_receivers prot) in 
  List.iter (fun p -> generate_nmc_queries_for_participant prot p dir) participants 
