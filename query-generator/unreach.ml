open Ast 
open Common 

(** unreach.ml **)
(* Unreach's outermost structure is a series of conjunctions *) 
(* Thus, all conjuncts need to be defined for each pair of participants and for each state *)
(* Unlike prodreach, one cannot do the case analysis on the states inside each conjunct *)

(* This file defines two versions of unreach: (1) unreach_pq, where the state is an argument to the predicate, 
                                              (2) unreach_pq_s, where the state is curried into the function *)

(* First conjunction enumerates transitions where: 
  - s is the pre-state 
  - the participant signature is p->q *)

(* There is no simreach-based optimization that can be applied to this definition *)
let filter_transitions_unreach_conjunct_one (ls: symbolic_transition list) (p: participant) (q: participant) (s: state) =
  List.filter (fun tr -> tr.pre = s && tr.sender = p && tr.receiver = q) ls  

(* Defining first conjuncts for a given transition, for unreach for a pair of participants and a state *)
let first_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) : string = 
  let phi = substitute tr.predicate tr.comm_var "x" in 
  "(" ^ 
  quantify_over_poststate_registers prot "forall" ^ 
  string_of_formula phi ^ 
  " => false) \n"

(* Defining the first conjunct altogether, for unreach for a pair of participants and a state *)
let first_conjunct_for_participant_pair_and_state (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string =
  let transitions = filter_transitions_unreach_conjunct_one prot.transitions p q s in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ first_conjunct_from_transition prot x) "true" transitions 

(* Second conjunct enumerates transitions where: 
  - s is the pre-state 
  - participant p is uninvolved *)
let filter_transitions_unreach_conjunct_two (ls: symbolic_transition list) (p: participant) (s: state) =
  List.filter (fun tr -> tr.pre = s && participant_uninvolved tr p) ls  

(* Defining second conjuncts for a given transition, for unreach for a pair of participants and a state *)
(* Note to self: muCLP checker allows for empty quantification *)
let second_conjunct_from_transition (prot: symbolic_protocol) (p: participant) (q: participant) (tr: symbolic_transition) : string = 
  "(" ^ 
  "forall (" ^ tr.comm_var ^ ":int). " ^ 
  "(" ^
  quantify_over_poststate_registers prot "forall" ^ 
  (* List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "': int")) "" prot.registers ^  *)
  string_of_formula tr.predicate ^ 
  " => " ^ 
  "unreach_" ^ p ^ q ^ " " ^
  string_of_int tr.post ^ " " ^
  List.fold_left (fun acc x -> acc ^ x ^ "' ") "" prot.registers ^ 
  "x)) \n" 

(* This version of the function is used for version (2) *)
(* The only change is space -> underscore *)
let second_conjunct_from_transition_curried (prot: symbolic_protocol) (p: participant) (q: participant) (tr: symbolic_transition) : string = 
  "(" ^ 
  "forall (" ^ tr.comm_var ^ ":int). " ^ 
  "(" ^
  quantify_over_poststate_registers prot "forall" ^ 
  (* List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "': int")) "" prot.registers ^  *)
  string_of_formula tr.predicate ^ 
  " => " ^ 
  "unreach_" ^ p ^ q ^ "_" ^
  string_of_int tr.post ^ " " ^
  List.fold_left (fun acc x -> acc ^ x ^ "' ") "" prot.registers ^ 
  "x)) \n" 

(* Defining the second conjunct altogether, for unreach for a pair of participants and a state *)
let second_conjunct_for_participant_pair_and_state (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  let transitions = filter_transitions_unreach_conjunct_two prot.transitions p s in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ second_conjunct_from_transition prot p q x) "" transitions 

let second_conjunct_for_participant_pair_and_state_curried (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  let transitions = filter_transitions_unreach_conjunct_two prot.transitions p s in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ second_conjunct_from_transition_curried prot p q x) "" transitions 

(* Defining the entire conjunct for a state, for unreach for a pair of participants *)
(* This version is the body of the version (1) that includes all disjuncts together *)
let unreach_for_participant_pair_and_state_body (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  "(\n" ^ 
  "s = " ^ string_of_int s ^ " " ^
  first_conjunct_for_participant_pair_and_state prot p q s ^ 
  second_conjunct_for_participant_pair_and_state prot p q s ^
  ")"

(** Version (1) of unreach_pq (s: int) for a list of states, with one disjunct per state **)
let generate_unreach_for_participant_pair (prot: symbolic_protocol) (p: participant) (q: participant) (ls: state list) : string = 
  "unreach_" ^ p ^ q ^ " (s:int) " ^ all_registers prot ^ "(x:int): bool =nu\n" ^
  List.fold_left (fun acc x -> acc ^ " \\/ " ^ unreach_for_participant_pair_and_state_body prot p q x) "false" ls ^ 
  ";"

(** Version (2) of unreach_pq_s, with one query per state **)
let unreach_for_participant_pair_and_state (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  "unreach_" ^ p ^ q ^ "_" ^ string_of_int s ^ all_registers prot ^ "(x:int): bool =nu\n" ^
  "(" ^ 
  first_conjunct_for_participant_pair_and_state prot p q s ^ 
  second_conjunct_for_participant_pair_and_state_curried prot p q s ^
  ");\n"

let generate_unreach_for_participant_pair_and_state (prot: symbolic_protocol) (p: participant) (q: participant) (ls: state list) : string = 
  List.fold_left (fun acc s -> acc ^ unreach_for_participant_pair_and_state prot p q s) "" ls










