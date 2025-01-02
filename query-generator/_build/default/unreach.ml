open Ast 
open Common 

(** unreach.ml **)
(* Defining everything in one file for now to avoid having to mess with dune *)
(* Unreach needs to be defined for each pair of participants and for each state *)
(* Because unlike prodreach, one cannot fold the case analysis on the states into the disjuncts *)

(* First conjunction enumerates transitions where: 
  - s is the pre-state 
  - the participant signature is p->q *)

let filter_transitions_unreach_conjunct_one (ls: symbolic_transition list) (s: state) (p: participant) (q: participant) =
  List.filter (fun tr -> tr.pre = s && tr.sender = p && tr.receiver = q) ls  

(* Defining first conjuncts for a given transition, for unreach for a pair of participants and a state *)
let first_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) : string = 
  let phi = substitute tr.predicate tr.comm_var "x" in 
  "(" ^ 
  quantify_over_poststate_registers prot "forall" ^ 
  string_of_formula phi ^ 
  " => false) \n"

(* Defining the first conjunct altogether, for unreach for a pair of participants and a state *)
let first_conjunct_for_participant_pair_and_state (prot: symbolic_protocol) (s: state) (p: participant) (q: participant) : string =
  let transitions = filter_transitions_unreach_conjunct_one prot.transitions s p q in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ first_conjunct_from_transition prot x) "" transitions 

(* Second conjunct enumerates transitions where: 
  - s is the pre-state 
  - participant p is uninvolved *)
let filter_transitions_unreach_conjunct_two (ls: symbolic_transition list) (s: state) (p: participant) =
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

(* Defining the second conjunct altogether, for unreach for a pair of participants and a state *)
let second_conjunct_for_participant_pair_and_state (prot: symbolic_protocol) (s: state) (p: participant) (q: participant) : string = 
  let transitions = filter_transitions_unreach_conjunct_two prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ second_conjunct_from_transition prot p q x) "" transitions 

(* Defining the entire conjunct for a state, for unreach for a pair of participants *)
let unreach_for_participant_pair_and_state (prot: symbolic_protocol) (s: state) (p: participant) (q: participant) : string = 
  "(\n" ^ 
  "s = " ^ string_of_int s ^ " " ^
  first_conjunct_for_participant_pair_and_state prot s p q ^ 
  second_conjunct_for_participant_pair_and_state prot s p q ^
  ")"

(* Defining unreach for a pair of participants, with one disjunct for each state *)
let unreach_for_participant_pair (prot: symbolic_protocol) (p: participant) (q: participant) : string = 
  "unreach_" ^ p ^ q ^ " (s:int) " ^ all_registers prot ^ "(x:int): bool =nu\n" ^
  List.fold_left (fun acc x -> acc ^ " \\/ " ^ unreach_for_participant_pair_and_state prot x p q) "false" prot.states ^ 
  ";"

(* This function has been successfully tested and matched against rs_unreach.hes and run *)
(* This function has been successfully tested and matched against p_scc.hes *)
(** unreach.ml **)















