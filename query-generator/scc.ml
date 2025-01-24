open Ast 
open Common 
open Prodreach 
open Unreach 

(* This file defines 3*2 versions of SCC: 
	 (1) One muCLP query per participant, containing a disjunction enumerating all (transition, state) pairs, 
	 (2) One muCLP query per transition, containing a disjunction enumerating all states, 
	 (3) One muCLP query per (transition, state) 
	 Within each version, the primed version eliminates equality predicates constraining 
	 the values of the states, and instead rewrites them literally into the clauses. 
	 Each version can choose between 2 versions of unreach generation: 
	 a. One unreach predicate altogether, containing a disjunction for each state,
	 b. One unreach predicate for each state argument, i.e. curried unreach *) 

(* Optimizations present in all versions: 
	- Pre-filter for simultaneously reachable states according to participant projection of transition labels, 
	- Eliminate state equality predicates and directly instantiate values in inductive predicates,
*) 

(* None of the versions currently eliminate redundant unreach definitions *)

(* The SCC preamble of a first line doing existential quantification, followed by four conjuncts: 
	- First conjunct constrains s1, s'1, s2
	- Second conjunct calls prodreach on s1 and s2 
	- Third conjunct is the transition predicate for S1
	- Fourth conjunct calls unreach on s2, and depends on the choice of unreach  *)
(* Followed by generation of prodreach and unreach predicates *)

(* First line *)
(* Quantifies over s1, s'1 and s2 even though some versions do not use these variables, 
	 but this introduces negligible overhead *)
let first_line (prot: symbolic_protocol) = 
	"exists " ^ 
	"(s1: int) (s'1: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	"(s2: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int)" ^ 
	". \n" 

(* First conjunct *) 
(* let first_conjunct_for_transition_and_s2 (tr: symbolic_transition) (s2: state) =  *)
	(* "(s1 = " ^ string_of_int tr.pre ^ " /\\ s'1 = " ^ string_of_int tr.post ^ " /\\ s2 = " ^ string_of_int s2 ^ ")" *)

(* First conjunct for version (2) enumerates all states for a given transition *)
(* let first_conjunct_for_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	List.fold_left (fun acc s -> acc ^ " \\/ " ^ first_conjunct_for_transition_and_s2 tr s) "false" prot.states ^ 
	")\n"
 *)
(* Optimized version that only considers states simultaneously reachable as tr.pre *)
(* let first_conjunct_for_transition_simreach (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	let simreach_states = simultaneously_reachable_as_for prot tr.pre p in 
	"(" ^ 
	List.fold_left (fun acc s -> acc ^ " \\/ " ^ first_conjunct_for_transition_and_s2 tr s) "false" simreach_states ^ 
	")\n" *)

(* Second conjunct *)
(* let second_conjunct (prot: symbolic_protocol) (p: participant) = 
	"(prodreach_" ^ p ^ " " ^
	"s1 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

let second_conjunct_for_s1 (prot: symbolic_protocol) (s1: state) (p: participant)  = 
	"(prodreach_" ^ p ^ " " ^
	string_of_int s1 ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"
 *)
let second_conjunct_for_s1_s2 (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) = 
	"(prodreach_" ^ p ^ " " ^
	string_of_int s1 ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	string_of_int s2 ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

(* Third conjunct is the same across all versions *)
let third_conjunct_for_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	let phi1 = substitute (append1 tr.predicate) (tr.comm_var ^ "1") "x1" in 
	"(" ^ 
	string_of_formula phi1 ^ 
	")\n"

(* Fourth conjunct *)
(* Version a. of unreach includes s2 as an argument *)
(* let fourth_conjunct_for_transition_a (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	" " ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"
 *)
let fourth_conjunct_for_transition_and_s2_a (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	" " ^ 
	string_of_int s2 ^ " " ^
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

(* Version b. of unreach includes s2 in the name of the unreach predicate called *)
(* let fourth_conjunct_for_transition_b (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	(* Note that whether space or underscore is used here depends on which version of unreach is used *)
	"_" ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n" *)

let fourth_conjunct_for_transition_and_s2_b (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	"_" ^ 
	string_of_int s2 ^ " " ^
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

(* let scc_body_for_transition_a (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^
	first_conjunct_for_transition_simreach prot tr p ^ 
	" /\\ \n" ^
	second_conjunct prot p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_a prot tr p ^
	")"
 *)
(* let scc_body_for_transition_b (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^
	first_conjunct_for_transition_simreach prot tr p ^ 
	" /\\ \n" ^
	second_conjunct prot p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_b prot tr p ^
	")" *)

(* Optimizing conjunct for SCC queries of the form p_scc_xy_x.hes *)
(* This conjunct states that the registers in S1 and S2 are not equal *)
let fifth_conjunct_for_transition_and_s2 (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) = 
	if tr.pre <> s2 then "true" else 
	"(" ^ 
	List.fold_left (fun acc r -> acc ^ " \\/ " ^ r ^ "1 != " ^ r ^ "2") "false" prot.registers ^
	")"

let scc_body_for_transition_and_s2_a (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^
	(* First conjunct consisting of equalities constraining s1, s'1 and s2 disappears *)  
	second_conjunct_for_s1_s2 prot tr.pre s2 p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_and_s2_a prot tr s2 p ^
	" /\\ \n" ^
	fifth_conjunct_for_transition_and_s2 prot tr s2 ^
	")"

let scc_body_for_transition_and_s2_b (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^
	(* First conjunct consisting of equalities constraining s1, s'1 and s2 disappears *)  
	second_conjunct_for_s1_s2 prot tr.pre s2 p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_and_s2_b prot tr s2 p ^
	" /\\ \n" ^
	fifth_conjunct_for_transition_and_s2 prot tr s2 ^
	")"

(** First style of SCC generation: one muCLP query per participant **)
(* The preamble is thus a disjunction of clauses, one for each transition and state pair *)
(* This version inherently cannot use version b because it lumps all the states together *)
(* let generate_scc_v1a (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_by_sender prot.transitions p in 
	(* Defined like so to avoid repetition *)
	let unreach_pairs = intersection (all_distinct_participant_pairs prot) (List.map (fun tr -> (p, tr.receiver)) transitions) in  
	first_line prot ^
  List.fold_left (fun acc tr -> acc ^ "\n\\/\n" ^ scc_body_for_transition_a prot tr p) "false" transitions ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	List.fold_left (fun acc (p,q) -> acc ^ "\n" ^ unreach_for_participant_pair prot p q prot.states) "" unreach_pairs 

let generate_scc_queries_v1a (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> write_to_file (Filename.concat dir (p ^ "_scc.hes")) (generate_scc_v1a prot p)) participants 
 *)
(** First' style of SCC generation: one muCLP query per participant **)
(* The difference is that the preamble is for each (s1->s'1, s2) pair, 
	 and thus the values of s1, s'1, s2 are propagated into each of the conjuncts literally *)

let generate_scc_v1a (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_by_sender prot.transitions p in 
	first_line prot ^
  	List.fold_left (fun acc tr -> 
  								acc ^ "\n\\/\n" ^
  								List.fold_left (fun acc s2 -> 
  																acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_a prot tr s2 p) 
  																"false" 
  																(simultaneously_reachable_as_for prot tr.pre p))
  								"false"
  								transitions ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	List.fold_left (fun acc q -> acc ^ "\n" ^ generate_unreach_va prot p q prot.states) "" (get_participants prot)

(* When generating version b. of unreach, now we only want to generate the predicates that are relevant *)
(* But we need to define them upfront so we can unduplicate them *)
let generate_scc_v1b (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_by_sender prot.transitions p in 
	first_line prot ^
  List.fold_left (fun acc tr -> 
  								acc ^ "\n\\/\n" ^
  								List.fold_left (fun acc s2 -> 
  																acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_b prot tr s2 p) 
  																"false" 
  																(simultaneously_reachable_as_for prot tr.pre p))
  								"false"
  								transitions ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	List.fold_left (fun acc q -> acc ^ "\n" ^ generate_unreach_vb prot p q prot.states) "" (get_participants prot)

let generate_scc_queries_v1a (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> write_to_file (Filename.concat dir (p ^ "_scc.hes")) (generate_scc_v1a prot p)) participants 

let generate_scc_queries_v1b (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> write_to_file (Filename.concat dir (p ^ "_scc.hes")) (generate_scc_v1b prot p)) participants 

(** Second style of SCC generation: one muCLP query per transition **)
(* The preamble is thus a disjunction of clauses, one for each state *)
(* Likewise this version does not support version b for unreach because it lumps all states together *)
(* let generate_scc_v2a (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	let unreach_states = simultaneously_reachable_as_for prot tr.pre p in 
	first_line prot ^
	scc_body_for_transition_a prot tr p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	unreach_for_participant_pair prot p tr.receiver unreach_states 

let generate_scc_v2b (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	let unreach_states = simultaneously_reachable_as_for prot tr.pre p in 
	first_line prot ^
	scc_body_for_transition_and_s2_b prot tr p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_for_participant_pair_and_state prot p tr.receiver unreach_states 

let generate_scc_queries_v2a (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* Generate a muCLP file for each transition it is sender in *)
											write_to_file 
                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ ".hes"))
                         (generate_scc_v2a prot tr p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants 

let generate_scc_queries_v2b (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* Generate a muCLP file for each transition it is sender in *)
											write_to_file 
                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ ".hes"))
                         (generate_scc_v2b prot tr p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants  *)

(** Second' style of SCC generation: one muCLP query per transition **)
(* The difference is again that the values of s1, s'1, s2 are propagated into each of the conjuncts literally *)
let generate_scc_v2a (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	first_line prot ^
  List.fold_left (fun acc s2 -> acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_a prot tr s2 p) 
  							  "false" 
  								(simultaneously_reachable_as_for prot tr.pre p) ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_va prot p tr.receiver prot.states

let generate_scc_v2b (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	first_line prot ^
	List.fold_left (fun acc s2 -> acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_b prot tr s2 p) 
  							  "false" 
  								(simultaneously_reachable_as_for prot tr.pre p) ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_vb prot p tr.receiver prot.states 

let generate_scc_queries_v2a (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* Generate a muCLP file for each transition it is sender in *)
											write_to_file 
                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ ".hes"))
                         (generate_scc_v2a prot tr p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants 

let generate_scc_queries_v2b (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* Generate a muCLP file for each transition it is sender in *)
											write_to_file 
                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ ".hes"))
                         (generate_scc_v2b prot tr p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants 



(** Third style of SCC generation: one muCLP query per transition per state **) 
(* Note that unreach cannot be filtered upfront because unreach calls itself *)
let generate_scc_v3a (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	first_line prot ^
	scc_body_for_transition_and_s2_a prot tr s2 p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_va prot p tr.receiver prot.states 

let generate_scc_v3b (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	first_line prot ^
	scc_body_for_transition_and_s2_b prot tr s2 p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_vb prot p tr.receiver prot.states

let generate_scc_queries_v3a (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* For each transition that it is sender in *)
											List.iter (fun s2 -> 
																(* For every state simultaneously reachable with the pre-state *)
																(* Generate a muCLP file for the transition and state *)
																write_to_file 
			                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ "_" ^ string_of_int s2 ^ ".hes"))
			                         (generate_scc_v3a prot tr s2 p))
											(simultaneously_reachable_as_for prot tr.pre p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants 

let generate_scc_queries_v3b (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* For each transition that it is sender in *)
											List.iter (fun s2 -> 
																(* For every state simultaneously reachable with the pre-state *)
																(* Generate a muCLP file for the transition and state *)
																write_to_file 
			                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ "_" ^ string_of_int s2 ^ ".hes"))
			                         (generate_scc_v3b prot tr s2 p))
											(simultaneously_reachable_as_for prot tr.pre p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants 

(** Fourth style of SCC generation: v3b, but with prodreach curried **) 
let second_conjunct_for_s1_s2_b (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) = 
	"(prodreach_" ^ p ^ "_" ^
	string_of_int s1 ^ "_" ^
	string_of_int s2 ^ " " ^
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

let generate_scc_v3bb (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	first_line prot ^
	"(" ^
	(* First conjunct consisting of equalities constraining s1, s'1 and s2 disappears *)  
	second_conjunct_for_s1_s2_b prot tr.pre s2 p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_and_s2_b prot tr s2 p ^
	" /\\ \n" ^
	fifth_conjunct_for_transition_and_s2 prot tr s2 ^
	")" ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_vb prot p ^ 
	"\n\n" ^ 
	generate_unreach_vb prot p tr.receiver prot.states

let generate_scc_queries_v3bb (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> 
						(* For each participant that is a sender in the protocol *)
						List.iter (fun tr -> 
											(* For each transition that it is sender in *)
											List.iter (fun s2 -> 
																(* For every state simultaneously reachable with the pre-state *)
																(* Generate a muCLP file for the transition and state *)
																write_to_file 
			                         (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ "_" ^ string_of_int s2 ^ ".hes"))
			                         (generate_scc_v3bb prot tr s2 p))
											(simultaneously_reachable_as_for prot tr.pre p))
											(List.filter (fun tr -> tr.sender = p) prot.transitions))
            participants 

let generate_scc_queries_for_participant_v3bb (prot: symbolic_protocol) (p: participant) (dir: string) = 
	(* For each participant that is a sender in the protocol *)
	List.iter (fun tr -> 
						(* For each transition that it is sender in *)
						List.iter (fun s2 -> 
											(* For every state simultaneously reachable with the pre-state *)
											(* Generate a muCLP file for the transition and state *)
											write_to_file 
	             (Filename.concat dir (p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ "_" ^ string_of_int s2 ^ ".hes"))
	             (generate_scc_v3bb prot tr s2 p))
						(simultaneously_reachable_as_for prot tr.pre p))
						(List.filter (fun tr -> tr.sender = p) prot.transitions)

(* These versions of the above functions are for generating queries with SCC factored into one query per (transition, state) *)
(* let first_conjunct_from_transition_and_state (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(s1 = " ^ string_of_int tr.pre ^ " /\\ s'1 = " ^ string_of_int tr.post ^ ")\n" 


let fourth_conjunct_from_transition_and_state (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	(* Note that whether space or underscore is used here depends on which version of unreach is used *)
	" " ^ 
	string_of_int s ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

let generate_scc_preamble_from_transition_and_state_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	"exists " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int)" ^ 
	". \n" ^
	first_conjunct_from_transition_and_state prot tr p ^ 
	" /\\ \n" ^
	second_conjunct_from_transition_and_state prot tr s p ^ 
	" /\\ \n" ^
	third_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_transition_and_state prot tr s p ^ 
	"s.t.\n"

let generate_scc_from_transition_and_state_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	generate_scc_preamble_from_transition_and_state_for_participant prot tr s p ^ 
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_for_participant_pair_and_state prot tr.sender tr.receiver prot.states

let generate_scc_filename_from_transition_and_state_for_participant (tr: symbolic_transition) (s: state) (p: participant) = 
	p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ "_" ^ string_of_int s ^ ".hes"

let generate_scc_queries_from_transition_and_state_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) = 
  let transitions = filter_transitions_scc_participant prot.transitions p in 
  List.iter (fun tr -> List.iter (fun s -> write_to_file 
                          										(Filename.concat dir (generate_scc_filename_from_transition_and_state_for_participant tr s p))
                          										(generate_scc_from_transition_and_state_for_participant prot tr s p))
            											prot.states)
  					transitions 

let generate_scc_queries_from_transition_and_state (prot: symbolic_protocol) (dir: string) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_scc_queries_from_transition_and_state_for_participant prot p dir) participants 


(** Optimization: one muCLP query per simultaneously reachable transition and state **)
(* Where simultaneous reachability is approximated using only participant labels *)
let generate_scc_queries_from_simreach_transition_and_state_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) = 
  let transitions = filter_transitions_scc_participant prot.transitions p in 
  List.iter (fun tr -> List.iter (fun s -> write_to_file 
                          										(Filename.concat dir (generate_scc_filename_from_transition_and_state_for_participant tr s p))
                          										(generate_scc_from_transition_and_state_for_participant prot tr s p))
  															 (* More optimization: toggle for removing queries of the shape _scc_xy_x.hes because they take abnormally long *)
  															 (simultaneously_reachable_as_for prot tr.pre p))
            										 (* (List.filter (fun x -> x <> tr.pre) (simultaneously_reachable_as_for prot tr.pre p))) *)
  					transitions 

let generate_scc_queries_from_simreach_transition_and_state (prot: symbolic_protocol) (dir: string) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_scc_queries_from_simreach_transition_and_state_for_participant prot p dir) participants 
   


 *)
(* 







(* Optimization: pre-filter the transitions further *)
let filter_participant_pairs_for_unreach (prot: symbolic_protocol) (p: participant) = 
	(* Defined like so to avoid repeats *)
	let all_pairs = all_distinct_participant_pairs prot in 
	let relevant_transitions = filter_transitions_scc_participant prot.transitions p in 
	let relevant_pairs = List.map (fun tr -> (tr.sender, tr.receiver)) relevant_transitions in 
	intersection all_pairs relevant_pairs 

let generate_scc_v1 (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_by_sender prot.transitions p in 
	let unreach_pairs = filter_participant_pairs_for_unreach prot p in 
	first_line prot p ^
  List.fold_left (fun acc tr -> acc ^ "\n\\/\n" ^ scc_body_v1 prot tr p) "false" transitions ^ 
	"\ns.t.\n" 
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	List.fold_left (fun acc (p,q) -> acc ^ "\n" ^ generate_unreach_for_participant_pair prot p q prot.states) "" pairs_list

let generate_scc_queries_v1 (prot: symbolic_protocol) (p: participant) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> write_to_file (Filename.concat dir (p ^ "_scc.hes")) (generate_scc_v1 prot p)) participants 







(* For each transition, pair it with each state in the protocol and generate four conjuncts *)
let first_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	List.fold_left (fun acc s -> acc ^ " \\/ " ^ "(s1 = " ^ string_of_int tr.pre ^ " /\\ s'1 = " ^ string_of_int tr.post ^ " /\\ s2 = " ^ string_of_int s ^ ")") "false" prot.states ^ 
	")\n"

let second_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(prodreach_" ^ p ^ " " ^
	"s1 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

let third_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	let phi1 = substitute (append1 tr.predicate) (tr.comm_var ^ "1") "x1" in 
	"(" ^ 
	string_of_formula phi1 ^ 
	")\n"

let fourth_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ " s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

 *)