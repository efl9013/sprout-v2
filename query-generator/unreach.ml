open Ast 
open Common 

(** unreach.ml **)

(* Unreach's outermost structure is a series of conjunctions *) 
(* Thus, all conjuncts need to be defined for each pair of participants and for each state *)
(* Unlike prodreach, one cannot do the case analysis on the states inside each conjunct *)

(* This file defines two versions of unreach: 
  a. unreach_pq, where the state is an argument to the predicate,     
  b. unreach_pq_s, where the state is curried into the function *)

(* Unreach cannot be optimized using simultaneous reachability *)

(* First conjunction enumerates transitions where: 
  - s is the pre-state 
  - the participant signature is p->q *)

(* Defining first conjuncts for a given transition, for unreach for a pair of participants and a state *)
let first_conjunct_for_transition (prot: symbolic_protocol) (tr: symbolic_transition) : string = 
  let phi = substitute tr.predicate tr.comm_var "x" in 
  "(" ^ 
  quantify_over_poststate_registers prot "forall" ^ 
  string_of_formula phi ^ 
  " => false) \n"

(* Version a of the first conjunct: altogether, for unreach for a pair of participants and a state *)
let first_conjunct_va (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string =
  let transitions = List.filter (fun tr -> tr.pre = s && tr.sender = p && tr.receiver = q) prot.transitions in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ first_conjunct_for_transition prot x) "" transitions 

let first_conjunct_vb (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string =
  let transitions = List.filter (fun tr -> tr.pre = s && tr.sender = p && tr.receiver = q) prot.transitions in 
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ first_conjunct_for_transition prot x) "true" transitions 

(* Second conjunct enumerates transitions where: 
  - s is the pre-state 
  - participant p is uninvolved *)
let filter_transitions_unreach_conjunct_two (ls: symbolic_transition list) (p: participant) (s: state) =
  List.filter (fun tr -> tr.pre = s && participant_uninvolved tr p) ls  

(* Version a of the second conjunct *)
(* Note to self: MuVal allows for empty quantification *)
let second_conjunct_for_transition_va (prot: symbolic_protocol) (p: participant) (q: participant) (tr: symbolic_transition) : string = 
  "(" ^ 
  "forall (" ^ tr.comm_var ^ ":int). " ^ 
  "(" ^
  quantify_over_poststate_registers prot "forall" ^ 
  (* List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "': int")) "" prot.registers ^  *)
  string_of_formula tr.predicate ^ 
  " => " ^ 
  "unreach_" ^ p ^ q ^ 
  " " ^
  string_of_int tr.post ^ " " ^
  List.fold_left (fun acc x -> acc ^ x ^ "' ") "" prot.registers ^ 
  "x)) \n" 

(* Version b of the second conjunct: the only change is space -> underscore to curry the state into the unreach predicate *)
let second_conjunct_for_transition_vb (prot: symbolic_protocol) (p: participant) (q: participant) (tr: symbolic_transition) : string = 
  "(" ^ 
  "forall (" ^ tr.comm_var ^ ":int). " ^ 
  "(" ^
  quantify_over_poststate_registers prot "forall" ^ 
  (* List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "': int")) "" prot.registers ^  *)
  string_of_formula tr.predicate ^ 
  " => " ^ 
  "unreach_" ^ p ^ q ^ 
  "_" ^
  string_of_int tr.post ^ " " ^
  List.fold_left (fun acc x -> acc ^ x ^ "' ") "" prot.registers ^ 
  "x)) \n" 

(* Defining the second conjunct altogether, for unreach for a pair of participants and a state *)
let second_conjunct_va (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  let transitions = List.filter (fun tr -> tr.pre = s && participant_uninvolved tr p) prot.transitions in
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ second_conjunct_for_transition_va prot p q x) "" transitions 

let second_conjunct_vb (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  let transitions = List.filter (fun tr -> tr.pre = s && participant_uninvolved tr p) prot.transitions in
  List.fold_left (fun acc x -> acc ^ "/\\ " ^ second_conjunct_for_transition_vb prot p q x) "" transitions 

(* Defining the conjunct body of version a for a given state, for unreach for a pair of participants *)
(* Version a consists of disjuncts of one conjunct per state *) 
let unreach_body_va (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  "(\n" ^ 
  "s = " ^ string_of_int s ^ " " ^
  first_conjunct_va prot p q s ^ 
  second_conjunct_va prot p q s ^
  ")"

(** Version a of unreach_pq (s: int) for a list of states, containing one disjunct per state **)
let generate_unreach_va (prot: symbolic_protocol) (p: participant) (q: participant) (ls: state list) : string = 
  "unreach_" ^ p ^ q ^ " (s:int) " ^ all_registers prot ^ "(x:int): bool =nu\n" ^
  List.fold_left (fun acc x -> acc ^ " \\/ " ^ unreach_body_va prot p q x) "false" ls ^ 
  ";"

(** Version b of unreach_pq_s, with one separate unreach_pq_s predicate per state **)
let unreach_body_vb (prot: symbolic_protocol) (p: participant) (q: participant) (s: state) : string = 
  "unreach_" ^ p ^ q ^ "_" ^ string_of_int s ^ all_registers prot ^ "(x:int): bool =nu\n" ^
  "(" ^ 
  first_conjunct_vb prot p q s ^ 
  second_conjunct_vb prot p q s ^
  ");\n"

let generate_unreach_vb (prot: symbolic_protocol) (p: participant) (q: participant) (ls: state list) : string = 
  List.fold_left (fun acc s -> acc ^ unreach_body_vb prot p q s) "" ls
