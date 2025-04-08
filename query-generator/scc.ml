open Ast 
open Common 
open Prodreach 
open Unreach 

(* This file defines 3*2 versions of SCC: 
   (1) One muCLP query per participant, containing a disjunction enumerating all (transition, state) pairs, 
   (2) One muCLP query per transition, containing a disjunction enumerating all states, 
   (3) One muCLP query per (transition, state) 
   Each version can choose between 2 versions of unreach generation: 
   a. One unreach predicate altogether, containing a disjunction for each state,
   b. One unreach predicate for each state argument, i.e. curried unreach *) 

(* Optimizations present in all versions: 
	- Pre-filter for simultaneously reachable states according to participant projection of transition labels, 
	- Eliminate state equality predicates and directly instantiate values in inductive predicates by rewriting *) 

(* None of the versions currently eliminate redundant unreach definitions *)

(* The SCC preamble of a first line doing existential quantification, followed by four conjuncts: 
	- First conjunct constrains s1, s'1, s2
	- Second conjunct calls prodreach on s1 and s2 
	- Third conjunct is the transition predicate for S1
	- Fourth conjunct calls unreach on s2, and depends on the choice of unreach  *)
(* Followed by generation of prodreach and unreach predicates *)

(* Definitions that are shared by all versions *)

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
(* First conjunct becomes obsolete once we instantiate with concrete values *)

(* Second conjunct for a pair of states *)
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

(* Fourth conjunct variations *)
(* Version a. of the fourth conjunct uses version a. of unreach which takes s2 as an argument *)
let fourth_conjunct_for_transition_and_s2_va (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	" " ^ 
	string_of_int s2 ^ " " ^
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

(* Version b. of the fourth conjunct uses version b. of unreach which curries s2 into the name of the unreach predicate *)
let fourth_conjunct_for_transition_and_s2_vb (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ 
	"_" ^ 
	string_of_int s2 ^ " " ^
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

(* The fifth conjunct is an additional optimizing conjunct for version (3) SCC queries, of the form p_scc_xy_x.hes *)
(* This conjunct states that the registers in S1 and S2 are not equal *)
let fifth_conjunct_for_transition_and_s2 (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) = 
	if tr.pre <> s2 then "true" else 
	"(" ^ 
	List.fold_left (fun acc r -> acc ^ " \\/ " ^ r ^ "1 != " ^ r ^ "2") "false" prot.registers ^
	")"

let scc_body_for_transition_and_s2_va (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^
	(* First conjunct consisting of equalities constraining s1, s'1 and s2 disappears *)  
	second_conjunct_for_s1_s2 prot tr.pre s2 p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_and_s2_va prot tr s2 p ^
	" /\\ \n" ^
	fifth_conjunct_for_transition_and_s2 prot tr s2 ^
	")"

let scc_body_for_transition_and_s2_vb (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	"(" ^
	(* First conjunct consisting of equalities constraining s1, s'1 and s2 disappears *)  
	second_conjunct_for_s1_s2 prot tr.pre s2 p ^ 
	" /\\ \n" ^
	third_conjunct_for_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_for_transition_and_s2_vb prot tr s2 p ^
	" /\\ \n" ^
	fifth_conjunct_for_transition_and_s2 prot tr s2 ^
	")"

(** Defining versions (1), (2) and (3) of SCC generation **)


(** Version (1) of SCC generation: one muCLP query per participant **)

(* Version 1a of SCC generation, one muCLP query per participant using version a unreach *)
let generate_scc_v1a (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_by_sender prot.transitions p in 
	first_line prot ^
  	List.fold_left (fun acc tr -> 
  								acc ^ "\n\\/\n" ^
  								List.fold_left (fun acc s2 -> 
  																acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_va prot tr s2 p) 
  																"false" 
  																(simultaneously_reachable_as_for prot tr.pre p))
  								"false"
  								transitions ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	List.fold_left (fun acc q -> acc ^ "\n" ^ generate_unreach_va prot p q prot.states) "" (get_participants prot)

let generate_scc_queries_v1a (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> write_to_file (Filename.concat dir (p ^ "_scc.hes")) (generate_scc_v1a prot p)) participants 

(* Version 1b of SCC generation, one muCLP query per participant using version b unreach *)
(* When generating version b. of unreach, now we only want to generate the predicates that are relevant *)
(* But we need to define them upfront so we can unduplicate them *)
let generate_scc_v1b (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_by_sender prot.transitions p in 
	first_line prot ^
  List.fold_left (fun acc tr -> 
  								acc ^ "\n\\/\n" ^
  								List.fold_left (fun acc s2 -> 
  																acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_vb prot tr s2 p) 
  																"false" 
  																(simultaneously_reachable_as_for prot tr.pre p))
  								"false"
  								transitions ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	List.fold_left (fun acc q -> acc ^ "\n" ^ generate_unreach_vb prot p q prot.states) "" (get_participants prot)

let generate_scc_queries_v1b (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
	List.iter (fun p -> write_to_file (Filename.concat dir (p ^ "_scc.hes")) (generate_scc_v1b prot p)) participants 

(** Version (2) of SCC generation: one muCLP query per transition **)

(* Version 2a of SCC generation, one muCLP query per participant per transition using version a unreach *)
let generate_scc_v2a (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	first_line prot ^
  List.fold_left (fun acc s2 -> acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_va prot tr s2 p) 
  							  "false" 
  								(simultaneously_reachable_as_for prot tr.pre p) ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_va prot p tr.receiver prot.states

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

(* Version 2b of SCC generation, one muCLP query per participant per transition using version b unreach *)
let generate_scc_v2b (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	first_line prot ^
	List.fold_left (fun acc s2 -> acc ^ "\n\\/\n" ^ scc_body_for_transition_and_s2_vb prot tr s2 p) 
  							  "false" 
  								(simultaneously_reachable_as_for prot tr.pre p) ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_vb prot p tr.receiver prot.states 

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


(** Version (3) of SCC generation: one muCLP query per transition per state **) 
(* Note that unreach cannot be filtered upfront because unreach calls itself *)

(* Version 3a of SCC generation: one muCLP query per participant per (transition, state) using version a unreach *)
let generate_scc_v3a (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	first_line prot ^
	scc_body_for_transition_and_s2_va prot tr s2 p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_va prot p tr.receiver prot.states 

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

(* Version 3b of SCC generation: one muCLP query per participant per (transition, state) using version b unreach *)
let generate_scc_v3b (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) = 
	first_line prot ^
	scc_body_for_transition_and_s2_vb prot tr s2 p ^ 
	"\ns.t.\n" ^
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_vb prot p tr.receiver prot.states

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

(* Version 3bb of SCC generation: one muCLP query per participant per (transition,state), using version b unreach and version b prodreach *) 
(* This is the most optimized version *)
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
	fourth_conjunct_for_transition_and_s2_vb prot tr s2 p ^
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


(* Renaming for clarity *)
let generate_scc_queries_naive (prot: symbolic_protocol) (dir: string) = 
  generate_scc_queries_v1a prot dir 

let generate_scc_queries_opt (prot: symbolic_protocol) (dir: string) = 
  generate_scc_queries_v3bb prot dir 