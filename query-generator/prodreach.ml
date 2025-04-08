open Ast 
open Common 

(** prodreach.ml **)

(* This file defines two versions of prodreach: 
  a. prodreach_p, where states s'1 and s'2 (and registers) are arguments to the predicate,     
  b. prodreach_p_s1_s2, where the states are curried into the function *)

(* The implementation of prodreach reuses the exact definition in the paper, 
  where arguments are post-states post-register variables, thus all arguments are primed *)

(* Because prodreach is a series of disjuncts, we can fold the case analysis on state for va into the relevant disjuncts *)

(* Important naming conventions: first prime, then 1/2 *)
let first_disjunct_states (prot: symbolic_protocol) : string = 
  let s0 = prot.initial_state in 
  "s'1 = " ^ string_of_int s0 ^ " /\\ s'2 = " ^ string_of_int s0 

(* Variables for the inductive predicates are defined by appending 1/2 to the register variable names *)
let first_disjunct_registers (prot: symbolic_protocol) : string = 
  List.fold_left (fun acc (r,v_r) -> acc ^ " /\\ " ^ r ^ "'1" ^ " = " ^ string_of_int v_r) "true" prot.initial_register_assignment 
  ^ " /\\ " ^ 
  List.fold_left (fun acc (r,v_r) -> acc ^ " /\\ " ^ r ^ "'2" ^ " = " ^ string_of_int v_r) "true" prot.initial_register_assignment 

let first_disjunct_va (prot: symbolic_protocol) : string = 
  let states_initial = first_disjunct_states prot in 
  let registers_initial = first_disjunct_registers prot in 
  parenthesize (states_initial ^ " /\\ " ^ registers_initial) ^ "\n"

let first_disjunct_vb (prot: symbolic_protocol) (s1: state) (s2: state) : string = 
  if s1 = prot.initial_state && s2 = prot.initial_state 
  then parenthesize (first_disjunct_registers prot) ^ "\n"
  else "false"

let second_disjunct_for_transition_pair_va (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) : string = 
  let tr1 = fst pair in 
  let tr2 = snd pair in 
  let phi1 = substitute (append1 tr1.predicate) (tr1.comm_var ^ "1") "x1" in 
  let phi2 = substitute (append2 tr2.predicate) (tr2.comm_var ^ "2") "x2" in 
  "(" ^ 
  "s'1 = " ^ string_of_int tr1.post ^ 
  " /\\ " ^ 
  "s'2 = " ^ string_of_int tr2.post ^ 
  " /\\ " ^
  "(" ^
  "exists (x1:int) (x2:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "1: int") ^ parenthesize (x ^ "2: int")) "" prot.registers ^ 
  ". " ^ 
  "prodreach_" ^ p ^ " " ^ 
  string_of_int tr1.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "1 ") "" prot.registers ^ 
  string_of_int tr2.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "2 ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi1 ^ 
  " /\\ " ^ 
  string_of_formula phi2 ^ 
  " /\\ " ^
  "x1 = x2" ^ 
  ")) \n"

let second_disjunct_for_transition_pair_vb (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) : string = 
  let tr1 = fst pair in 
  let tr2 = snd pair in 
  let phi1 = substitute (append1 tr1.predicate) (tr1.comm_var ^ "1") "x1" in 
  let phi2 = substitute (append2 tr2.predicate) (tr2.comm_var ^ "2") "x2" in 
  "(" ^ 
  "(" ^
  "exists (x1:int) (x2:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "1: int") ^ parenthesize (x ^ "2: int")) "" prot.registers ^ 
  ". " ^ 
  "prodreach_" ^ p ^ "_" ^ 
  string_of_int tr1.pre ^ "_" ^ string_of_int tr2.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "1 ") "" prot.registers ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "2 ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi1 ^ 
  " /\\ " ^ 
  string_of_formula phi2 ^ 
  " /\\ " ^
  "x1 = x2" ^ 
  ")) \n"

let filter_transition_pairs_second_disjunct (ls: (symbolic_transition * symbolic_transition) list) (s1: state) (s2: state) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.post = s1 && 
                                 tr2.post = s2 && 
                                 tr1.sender = tr2.sender && 
                                 tr1.receiver = tr2.receiver && 
                                 participant_involved tr1 p && 
                                 participant_involved tr2 p)
                ls

let second_disjunct_for_s1_s2_va (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) : string = 
  let transition_pairs = filter_transition_pairs_second_disjunct (all_transition_pairs prot.transitions) s1 s2 p in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_for_transition_pair_va prot x p) "" transition_pairs 

let second_disjunct_for_s1_s2_vb (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) : string = 
  let transition_pairs = filter_transition_pairs_second_disjunct (all_transition_pairs prot.transitions) s1 s2 p in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_for_transition_pair_vb prot x p) "" transition_pairs 

let second_disjunct_va (prot: symbolic_protocol) (p: participant) : string = 
  List.fold_left (fun acc (s1,s2) -> acc ^ second_disjunct_for_s1_s2_va prot s1 s2 p) "" (all_state_pairs prot.states)

let filter_transitions_third_fourth_disjunct (ls: symbolic_transition list) (s: state) (p: participant) =
   List.filter (fun tr -> tr.post = s && participant_uninvolved tr p) ls  

(* In the transition tr, tr.post is s'1 in the original arguments of prodreach
   s1 which is tr.pre from this transition, along with s'2  which is reused, are the new arguments to the new prodreach call *)
let third_disjunct_for_transition_va (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) : string = 
  let phi1 = substitute (append1 tr.predicate) (tr.comm_var ^ "1") "x1" in 
  "(" ^ 
  "s'1 = " ^ string_of_int tr.post ^ 
  " /\\ " ^
  "(" ^
  "exists (x1:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "1: int")) "" prot.registers ^ 
  ". " ^ 
  "prodreach_" ^ p ^ " " ^ 
  string_of_int tr.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "1 ") "" prot.registers ^ 
  "s'2 " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "'2 ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi1 ^ 
  ")) \n"

let third_disjunct_for_transition_vb (prot: symbolic_protocol) (tr: symbolic_transition) (s2: state) (p: participant) : string = 
  let phi1 = substitute (append1 tr.predicate) (tr.comm_var ^ "1") "x1" in 
  "(" ^ 
  "(" ^
  "exists (x1:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "1: int")) "" prot.registers ^ 
  ". " ^ 
  "prodreach_" ^ p ^ "_" ^ 
  string_of_int tr.pre ^ "_" ^ string_of_int s2 ^ " " ^
  List.fold_left (fun acc x -> acc ^ x ^ "1 ") "" prot.registers ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "'2 ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi1 ^ 
  ")) \n"

(* The s here is actually s'1 *)
let third_disjunct_for_s_va (prot: symbolic_protocol) (s: state) (p: participant) : string = 
  let transitions = filter_transitions_third_fourth_disjunct prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "\\/ \n" ^ third_disjunct_for_transition_va prot x p) "" transitions 

let third_disjunct_for_s_vb (prot: symbolic_protocol) (s: state) (s2: state) (p: participant) : string = 
  let transitions = filter_transitions_third_fourth_disjunct prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "\\/ \n" ^ third_disjunct_for_transition_vb prot x s2 p) "" transitions 

let third_disjunct_va (prot: symbolic_protocol) (p: participant) : string = 
  List.fold_left (fun acc s -> acc ^ third_disjunct_for_s_va prot s p) "" prot.states 

(* In the transition tr, tr.post is s'2 in the original arguments of prodreach
   s'1 which is reused, and tr.pre from this transition which is s2, are the new arguments to the new prodreach call *)
let fourth_disjunct_for_transition_va (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) : string = 
  let phi2 = substitute (append2 tr.predicate) (tr.comm_var ^ "2") "x2" in 
  "(" ^ 
  "s'2 = " ^ string_of_int tr.post ^ 
  " /\\ " ^
  "(" ^
  "exists (x2:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "2: int")) "" prot.registers ^ 
  ". " ^ 
  "prodreach_" ^ p ^ " " ^ 
  "s'1 " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "'1 ") "" prot.registers ^ 
  string_of_int tr.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "2 ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi2 ^ 
  ")) \n"

let fourth_disjunct_for_transition_vb (prot: symbolic_protocol) (tr: symbolic_transition) (s1: state) (p: participant) : string = 
  let phi2 = substitute (append2 tr.predicate) (tr.comm_var ^ "2") "x2" in 
  "(" ^ 
  "(" ^
  "exists (x2:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "2: int")) "" prot.registers ^ 
  ". " ^ 
  "prodreach_" ^ p ^ "_" ^ 
  string_of_int s1 ^ "_" ^ string_of_int tr.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "'1 ") "" prot.registers ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "2 ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi2 ^ 
  ")) \n"

(* The s here is actually s'2 *)
let fourth_disjunct_for_s_va (prot: symbolic_protocol) (s: state) (p: participant) : string = 
  let transitions = filter_transitions_third_fourth_disjunct prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "\\/ \n" ^ fourth_disjunct_for_transition_va prot x p) "" transitions  
  
let fourth_disjunct_for_s_vb (prot: symbolic_protocol) (s: state) (s1: state) (p: participant) : string = 
  let transitions = filter_transitions_third_fourth_disjunct prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "\\/ \n" ^ fourth_disjunct_for_transition_vb prot x s1 p) "" transitions  
  
let fourth_disjunct_va (prot: symbolic_protocol) (p: participant) : string = 
  List.fold_left (fun acc s -> acc ^ fourth_disjunct_for_s_va prot s p) "" prot.states 

let generate_prodreach_for_participant (prot: symbolic_protocol) (p: participant) : string = 
  "prodreach_" ^ p ^ " " ^ 
  "(s'1:int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'1: int) ") "" prot.registers ^
  "(s'2:int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'2: int) ") "" prot.registers ^
  ": bool =mu " ^ 
  "\n" ^
  first_disjunct_va prot ^ 
  second_disjunct_va prot p ^ 
  third_disjunct_va prot p ^
  fourth_disjunct_va prot p ^
  ";"

(* Version a. of prodreach which defines a monolithic predicate for each participant (naive) *)
let generate_prodreach_va (prot: symbolic_protocol) (p: participant) : string =
  generate_prodreach_for_participant prot p 

(* Version b. of prodreach which defines a separate predicate for each pair of s'1 and s'2 *)
let generate_prodreach_for_s1_s2 (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) : string = 
  "prodreach_" ^ p ^ "_" ^ 
  string_of_int s1 ^ "_" ^
  string_of_int s2 ^ " " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'1: int) ") "" prot.registers ^
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'2: int) ") "" prot.registers ^
  ": bool =mu " ^ 
  "\n" ^
  first_disjunct_vb prot s1 s2 ^ 
  second_disjunct_for_s1_s2_vb prot s1 s2 p ^ 
  third_disjunct_for_s_vb prot s1 s2 p ^
  fourth_disjunct_for_s_vb prot s2 s1 p ^
  ";"

let generate_prodreach_vb (prot: symbolic_protocol) (p: participant) : string =
  List.fold_left (fun acc (s1,s2) -> acc ^ "\n" ^ generate_prodreach_for_s1_s2 prot s1 s2 p) "" (all_state_pairs prot.states)

(** prodreach.ml **)
