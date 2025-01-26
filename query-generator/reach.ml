open Ast 
open Common 

(* This file defines two versions of the reachability predicate required to check GCLTS eligibility: 
  b. One reach predicate for each state argument, i.e. reach(s',r') decomposed, and 
  a. One reach predicate altogether, i.e. reach(r') monolithic *) 


(* The first disjunct is the base case, where s'=s0 and the registers are initial *)
let first_disjunct_registers (prot: symbolic_protocol) : string = 
  List.fold_left (fun acc (r,v_r) -> acc ^ " /\\ " ^ r ^ "'" ^ " = " ^ string_of_int v_r) "true" prot.initial_register_assignment 

let first_disjunct_vb (prot: symbolic_protocol) (s: state) : string = 
  if s = prot.initial_state 
  then parenthesize (first_disjunct_registers prot) ^ "\n"
  else "false"

let first_disjunct_va (prot: symbolic_protocol) : string = 
  let s0 = prot.initial_state in 
  "(" ^ 
  "s = " ^ string_of_int s0 ^
  " /\\ " ^
  first_disjunct_registers prot ^ 
  ")"

(* The second disjunct enumerates all states that reach s', 
  existentially quantifies over their communication variables and pre-state registers, 
  and calls reach(s,r) in each case *)
let second_disjunct_for_transition_vb (prot: symbolic_protocol) (tr: symbolic_transition) : string = 
  let phi = substitute tr.predicate (tr.comm_var) "x" in 
  "(" ^
  "exists (x:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  ". " ^ 
  "reach" ^ "_" ^ 
  string_of_int tr.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi ^ 
  ") \n"

let second_disjunct_for_transition_va (prot: symbolic_protocol) (tr: symbolic_transition) : string = 
  let phi = substitute tr.predicate (tr.comm_var) "x" in 
  "(" ^
  "exists (x:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  ". " ^ 
  "reach" ^ " " ^ 
  string_of_int tr.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
  " /\\ " ^ 
  string_of_formula phi ^ 
  ") \n"

let filter_transitions_second_disjunct (ls: symbolic_transition list) (s: state) =
   List.filter (fun tr -> tr.post = s) ls 

let second_disjunct_vb (prot: symbolic_protocol) (s: state) : string = 
  let transition_pairs = filter_transitions_second_disjunct prot.transitions s in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_for_transition_vb prot x) "" transition_pairs 

let second_disjunct_va (prot: symbolic_protocol) (s: state) : string = 
  let transition_pairs = filter_transitions_second_disjunct prot.transitions s in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_for_transition_va prot x) "false" transition_pairs 

let generate_reach_for_state_vb (prot: symbolic_protocol) (s: state) : string = 
  "reach_" ^ string_of_int s ^ " " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "': int) ") "" prot.registers ^
  ": bool =mu " ^ 
  "\n" ^
  first_disjunct_vb prot s ^ 
  second_disjunct_vb prot s ^ 
  ";"

(* Defining the entire disjunct for a state for reach *)
(* This version is the body of the version a. that includes all disjuncts together *)
let reach_body_va (prot: symbolic_protocol) (s: state) : string = 
  "(\n" ^ 
  "s = " ^ string_of_int s ^ " " ^
  " /\\ " ^
  "(" ^
  first_disjunct_va prot ^ 
  "\\/ " ^
  second_disjunct_va prot s ^
  "))"

(** Version a of reach (s: int) with one disjunct per state **)
let generate_reach_va (prot: symbolic_protocol) : string = 
  "reach (s: int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "': int) ") "" prot.registers ^
  ": bool =mu\n " ^ 
  List.fold_left (fun acc x -> acc ^ " \\/ " ^ reach_body_va prot x) "false" prot.states ^ 
  ";"

let generate_reach_vb (prot: symbolic_protocol) : string =
  List.fold_left (fun acc s -> acc ^ "\n" ^ generate_reach_for_state_vb prot s) "" prot.states

(* Defining streach, i.e. reachability from s1 to s2 *)
(* Either s1 has already reached s2, and the register values are the same *)
let first_disjunct_pairreach (prot: symbolic_protocol) (s1: state) (s2: state) : string = 
  "(" ^ 
  string_of_int s2 ^ " = " ^ string_of_int s1 ^ 
  " /\\ " ^ 
  List.fold_left (fun acc r -> acc ^ " /\\ " ^ r ^ "'1" ^ " = " ^ r ^ "'2") "true" prot.registers ^
  ")"

(* Or s1 can try to reach a state that is one step backwards from s2 *)
(* The s1 argument and registers don't change, only s2 and registers *)
(* And the transition predicate is required to hold on existentially quantified r2's and x *)
let second_disjunct_pairreach_for_transition (prot: symbolic_protocol) (tr: symbolic_transition) (s1: state) (s2: state) : string = 
  let phi = substitute (append2 tr.predicate) (tr.comm_var ^ "2") "x" in 
  "(" ^
  "exists (x:int) " ^ 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "2: int")) "" prot.registers ^ 
  ". " ^ 
  "streach" ^ " " ^ 
  string_of_int s1 ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "'1 ") "" prot.registers ^ 
  string_of_int tr.pre ^ " " ^ 
  List.fold_left (fun acc x -> acc ^ x ^ "2 ") "" prot.registers ^
  " /\\ " ^ 
  string_of_formula phi ^ 
  ") \n"

let filter_transitions_second_disjunct_pairreach (ls: symbolic_transition list) (s2: state) =
   List.filter (fun tr -> tr.post = s2) ls 

let second_disjunct_pairreach (prot: symbolic_protocol) (s1: state) (s2: state) : string = 
  let transition_pairs = filter_transitions_second_disjunct_pairreach prot.transitions s2 in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_pairreach_for_transition prot x s1 s2) "false" transition_pairs 

let pairreach_body (prot: symbolic_protocol) (s1: state) (s2: state) : string = 
  "(\n" ^ 
  "s1 = " ^ string_of_int s1 ^ " " ^
  " /\\ " ^
  "s2 = " ^ string_of_int s2 ^ " " ^
  " /\\ " ^
  "(" ^
  first_disjunct_pairreach prot s1 s2 ^ 
  "\\/ " ^
  second_disjunct_pairreach prot s1 s2 ^
  "))"

let generate_pairreach (prot: symbolic_protocol) : string = 
  "streach (s1: int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'1: int) ") "" prot.registers ^ 
  "(s2: int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'2: int) ") "" prot.registers ^ 
  ": bool =mu\n " ^ 
  List.fold_left (fun acc (s1, s2) -> acc ^ " \\/ " ^ pairreach_body prot s1 s2) "false" (all_state_pairs prot.states) ^ 
  ";"

