open Ast 
open Common 

(** prodreach.ml **)
(* Note the distinction between input variable names and input states, 
   which are used to filter the set of transitions to include etc. *)
(* Actually this distinction might be meaningless now *)

(* Also note that the arguments to prodreach are actually post-states and primed register variables *)
(* Something to be mindful of when defining substitutions *)

(* This version of prodreach reuses the exact definition in the paper, 
  where the arguments are all primed *)

(* Important naming conventions: first prime, then 1/2 *)
let first_disjunct_prodreach_states (prot: symbolic_protocol) : string = 
  let s0 = prot.initial_state in 
  "s'1 = " ^ string_of_int s0 ^ " /\\ s'2 = " ^ string_of_int s0 

(* Variables for the inductive predicates are defined by appending 1/2 to the register variable names *)
let first_disjunct_prodreach_registers (prot: symbolic_protocol) : string = 
  List.fold_left (fun acc (r,v_r) -> acc ^ " /\\ " ^ r ^ "'1" ^ " = " ^ string_of_int v_r) "true" prot.initial_register_assignment 
  ^ " /\\ " ^ 
  List.fold_left (fun acc (r,v_r) -> acc ^ " /\\ " ^ r ^ "'2" ^ " = " ^ string_of_int v_r) "true" prot.initial_register_assignment 

let first_disjunct_prodreach (prot: symbolic_protocol) : string = 
  let states_initial = first_disjunct_prodreach_states prot in 
  let registers_initial = first_disjunct_prodreach_registers prot in 
  parenthesize (states_initial ^ " /\\ " ^ registers_initial) ^ "\n"

let second_disjunct_from_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) (p: participant) : string = 
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

let filter_transition_pairs_prodreach_disjunct_two (ls: (symbolic_transition * symbolic_transition) list) (s1: state) (s2: state) (p: participant) =
   List.filter (fun (tr1,tr2) -> tr1.post = s1 && 
                                 tr2.post = s2 && 
                                 tr1.sender = tr2.sender && 
                                 tr1.receiver = tr2.receiver && 
                                 participant_involved tr1 p && 
                                 participant_involved tr2 p)
                ls

let second_disjunct_for_s1_s2 (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) : string = 
  let transition_pairs = filter_transition_pairs_prodreach_disjunct_two (all_transition_pairs prot.transitions) s1 s2 p in 
  List.fold_left (fun acc x -> acc ^ " \\/ \n" ^ second_disjunct_from_pair prot x p) "" transition_pairs 

let second_disjunct (prot: symbolic_protocol) (p: participant) : string = 
  List.fold_left (fun acc (s1,s2) -> acc ^ second_disjunct_for_s1_s2 prot s1 s2 p) "" (all_state_pairs prot.states)

let filter_transitions_prodreach_disjunct_three_four (ls: symbolic_transition list) (s: state) (p: participant) =
   List.filter (fun tr -> tr.post = s && participant_uninvolved tr p) ls  
       
let third_disjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) : string = 
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

let third_disjunct_for_s (prot: symbolic_protocol) (s: state) (p: participant) : string = 
  let transitions = filter_transitions_prodreach_disjunct_three_four prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "\\/ \n" ^ third_disjunct_from_transition prot x p) "" transitions 

let third_disjunct (prot: symbolic_protocol) (p: participant) : string = 
  List.fold_left (fun acc s -> acc ^ third_disjunct_for_s prot s p) "" prot.states 

let fourth_disjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) : string = 
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

let fourth_disjunct_for_s (prot: symbolic_protocol) (s: state) (p: participant) : string = 
  let transitions = filter_transitions_prodreach_disjunct_three_four prot.transitions s p in 
  List.fold_left (fun acc x -> acc ^ "\\/ \n" ^ fourth_disjunct_from_transition prot x p) "" transitions  
  
let fourth_disjunct (prot: symbolic_protocol) (p: participant) : string = 
  List.fold_left (fun acc s -> acc ^ fourth_disjunct_for_s prot s p) "" prot.states 

let generate_prodreach_for_participant (prot: symbolic_protocol) (p: participant) : string = 
  "prodreach_" ^ p ^ " " ^ 
  "(s'1:int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'1: int) ") "" prot.registers ^
  "(s'2:int) " ^ 
  List.fold_left (fun acc r -> acc ^ "(" ^ r ^ "'2: int) ") "" prot.registers ^
  ": bool =mu " ^ 
  "\n" ^
  first_disjunct_prodreach prot ^ 
  second_disjunct prot p ^ 
  third_disjunct prot p ^
  fourth_disjunct prot p ^
  ";"
(* This function has been successfully tested and matched against p_scc.hes *)

(** prodreach.ml **)
