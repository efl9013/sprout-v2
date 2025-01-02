open Printf

(* Define basic types *)
type state = int
type participant = string
type variable = string

(* Define formula type *)
type formula =
  | True
  | False
  | Eq of expr * expr
  | Lt of expr * expr
  | Gt of expr * expr
  | And of formula * formula
  | Or of formula * formula
  | Not of formula

and expr =
  | Const of int
  | Var of variable
  | VarPrime of variable 
  | Plus of expr * expr
  | Minus of expr * expr
  | Times of expr * expr
  | Div of expr * expr

(* Define symbolic transition *)
type symbolic_transition = {
  pre: state;
  sender: participant;
  receiver: participant;
  comm_var: variable;
  predicate: formula;
  post: state;
}

(* Define symbolic protocol *)
type symbolic_protocol = {
  states: state list;
  registers: variable list;
  transitions: symbolic_transition list;
  initial_state: state;
  initial_register_assignment: (variable * int) list;
  final_states: state list;
}

(* Printing functions *)
let rec string_of_expr = function
  | Const n -> string_of_int n
  | Var v -> v
  | VarPrime v -> v ^ "'"
  | Plus (e1, e2) -> "(" ^ string_of_expr e1 ^ " + " ^ string_of_expr e2 ^ ")"
  | Minus (e1, e2) -> "(" ^ string_of_expr e1 ^ " - " ^ string_of_expr e2 ^ ")"
  | Times (e1, e2) -> "(" ^ string_of_expr e1 ^ " * " ^ string_of_expr e2 ^ ")"
  | Div (e1, e2) -> "(" ^ string_of_expr e1 ^ " / " ^ string_of_expr e2 ^ ")"

let rec string_of_formula = function
  | True -> "true"
  | False -> "false"
  | Eq (e1, e2) -> "(" ^ string_of_expr e1 ^ " = " ^ string_of_expr e2 ^ ")"
  | Lt (e1, e2) -> "(" ^ string_of_expr e1 ^ " < " ^ string_of_expr e2 ^ ")"
  | Gt (e1, e2) -> "(" ^ string_of_expr e1 ^ " > " ^ string_of_expr e2 ^ ")"
  | And (f1, f2) -> "(" ^ string_of_formula f1 ^ " /\\ " ^ string_of_formula f2 ^ ")"
  | Or (f1, f2) -> "(" ^ string_of_formula f1 ^ " \\/ " ^ string_of_formula f2 ^ ")"
  | Not f -> "! (" ^ string_of_formula f ^ ")"

let print_formula formula =
  print_endline (string_of_formula formula)
 
let print_transition fmt t =
  fprintf fmt "(%i) %s->%s:%s{%s} (%i)"
    t.pre
    t.sender
    t.receiver
    t.comm_var
    (string_of_formula t.predicate)
    t.post

let print_transition_stdout t =
  printf "%a\n" print_transition t

let string_of_transition t =
  printf "%a" print_transition t
