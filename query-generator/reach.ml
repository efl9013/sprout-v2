open Ast 
open Common 

(* This file defines the reachability predicate reach(s',r') required to check GCLTS eligibility *) 

(* The first disjunct is the base case, where s'=s0 and the registers are initial *)
let first_disjunct_registers (prot: symbolic_protocol) : string = 
  List.fold_left (fun acc (r,v_r) -> acc ^ " /\\ " ^ r ^ "'" ^ " = " ^ string_of_int v_r) "true" prot.initial_register_assignment 

let first_disjunct (prot: symbolic_protocol) (s: state) : string = 
  if s = prot.initial_state 
  then parenthesize (first_disjunct_registers prot) ^ "\n"
  else "false"
(*   let s0 = prot.initial_state in 
  "(" ^ 
  string_of_int s1 ^ " = " ^ string_of_int s0 ^ " /\\ " ^ string_of_int s2 ^ " = " ^ string_of_int s0 ^
  " /\\ " ^
  first_disjunct_registers prot ^ 
  ")" *)

(* The second disjunct enumerates all states that reach s', 
  existentially quantifies over their communication variables and pre-state registers, 
  and calls reach(s,r) in each case *)
let second_disjunct_for_transition (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) : string = 
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

let filter_transitions_second_disjunct (ls: symbolic_transition list) (s: state) =
   List.filter (fun tr -> tr.post = s) ls 

let second_disjunct (prot: symbolic_protocol) (s: state) : string = 
  let transition_pairs = filter_transitions_second_disjunct prot.transitions s in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_for_transition prot x s) "" transition_pairs 

let generate_reach_for_state (prot: symbolic_protocol) (s: state) : string = 
  "reach_" ^ string_of_int s ^ " " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "': int) ") "" prot.registers ^
  ": bool =mu " ^ 
  "\n" ^
  first_disjunct prot s ^ 
  second_disjunct prot s ^ 
  ";"

let generate_reach (prot: symbolic_protocol) : string =
  List.fold_left (fun acc s -> acc ^ "\n" ^ generate_reach_for_state prot s) "" prot.states
