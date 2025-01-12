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
  | Neq of expr * expr 
  | Lt of expr * expr
  | Leq of expr * expr 
  | Gt of expr * expr
  | Geq of expr * expr 
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

(* Equality functions *)
let rec expr_eq e1 e2 =
  match (e1, e2) with
  | (Const n1, Const n2) -> n1 = n2
  | (Var v1, Var v2) -> v1 = v2
  | (VarPrime v1, VarPrime v2) -> v1 = v2
  | (Plus (a1, b1), Plus (a2, b2)) -> expr_eq a1 a2 && expr_eq b1 b2
  | (Minus (a1, b1), Minus (a2, b2)) -> expr_eq a1 a2 && expr_eq b1 b2
  | (Times (a1, b1), Times (a2, b2)) -> expr_eq a1 a2 && expr_eq b1 b2
  | (Div (a1, b1), Div (a2, b2)) -> expr_eq a1 a2 && expr_eq b1 b2
  | _ -> false

let rec formula_eq f1 f2 =
  match (f1, f2) with
  | (True, True) | (False, False) -> true
  | (Neq (e1, e2), Neq (e3, e4)) -> expr_eq e1 e3 && expr_eq e2 e4
  | (Eq (e1, e2), Eq (e3, e4)) -> expr_eq e1 e3 && expr_eq e2 e4
  | (Leq (e1, e2), Neq (e3, e4)) -> expr_eq e1 e3 && expr_eq e2 e4
  | (Geq (e1, e2), Neq (e3, e4)) -> expr_eq e1 e3 && expr_eq e2 e4
  | (Lt (e1, e2), Lt (e3, e4)) -> expr_eq e1 e3 && expr_eq e2 e4
  | (Gt (e1, e2), Gt (e3, e4)) -> expr_eq e1 e3 && expr_eq e2 e4
  | (And (a1, b1), And (a2, b2)) -> formula_eq a1 a2 && formula_eq b1 b2
  | (Or (a1, b1), Or (a2, b2)) -> formula_eq a1 a2 && formula_eq b1 b2
  | (Not f1, Not f2) -> formula_eq f1 f2
  | _ -> false

let symbolic_transition_eq t1 t2 =
  t1.pre = t2.pre &&
  t1.sender = t2.sender &&
  t1.receiver = t2.receiver &&
  t1.comm_var = t2.comm_var &&
  formula_eq t1.predicate t2.predicate &&
  t1.post = t2.post

(* Some ugliness to print primes before 1/2 in the case that the variable ends with 1/2 *)
let ends_with_one (s: string) : bool =
  let len = String.length s in
  if len = 0 then
    false  
  else
    s.[len - 1] = '1'  

let ends_with_two (s: string) : bool =
  let len = String.length s in
  if len = 0 then
    false  
  else
    s.[len - 1] = '2'  

let handle_varprime (e: expr) : string = 
  match e with 
  | VarPrime v -> let len = String.length v in 
                  if ends_with_one v then String.sub v 0 (len-1) ^ "'" ^ "1" 
                else if ends_with_two v then String.sub v 0 (len-1) ^ "'" ^ "2" 
              else v ^ "'"
  | _ -> ""
let rec string_of_expr = function
  | Const n -> string_of_int n
  | Var v -> v
  | VarPrime v -> handle_varprime (VarPrime v)
  | Plus (e1, e2) -> "(" ^ string_of_expr e1 ^ " + " ^ string_of_expr e2 ^ ")"
  | Minus (e1, e2) -> "(" ^ string_of_expr e1 ^ " - " ^ string_of_expr e2 ^ ")"
  | Times (e1, e2) -> "(" ^ string_of_expr e1 ^ " * " ^ string_of_expr e2 ^ ")"
  | Div (e1, e2) -> "(" ^ string_of_expr e1 ^ " / " ^ string_of_expr e2 ^ ")"

let rec string_of_formula = function
  | True -> "true"
  | False -> "false"
  | Eq (e1, e2) -> "(" ^ string_of_expr e1 ^ " = " ^ string_of_expr e2 ^ ")"
  | Neq (e1, e2) -> "(" ^ string_of_expr e1 ^ " != " ^ string_of_expr e2 ^ ")"
  | Geq (e1, e2) -> "(" ^ string_of_expr e1 ^ " >= " ^ string_of_expr e2 ^ ")"
  | Leq (e1, e2) -> "(" ^ string_of_expr e1 ^ " <= " ^ string_of_expr e2 ^ ")"
  | Lt (e1, e2) -> "(" ^ string_of_expr e1 ^ " < " ^ string_of_expr e2 ^ ")"
  | Gt (e1, e2) -> "(" ^ string_of_expr e1 ^ " > " ^ string_of_expr e2 ^ ")"
  | And (f1, f2) -> "(" ^ string_of_formula f1 ^ " /\\ " ^ string_of_formula f2 ^ ")"
  | Or (f1, f2) -> "(" ^ string_of_formula f1 ^ " \\/ " ^ string_of_formula f2 ^ ")"
  | Not f -> "! (" ^ string_of_formula f ^ ")"

(* let symbolic_protocol_eq p1 p2 =
  p1.states = p2.states &&
  p1.registers = p2.registers &&
  List.for_all2 symbolic_transition_eq p1.transitions p2.transitions &&
  p1.initial_state = p2.initial_state &&
  p1.initial_register_assignment = p2.initial_register_assignment &&
  p1.final_states = p2.final_states *)

let symbolic_protocol_eq p1 p2 =
  let print_diff name v1 v2 = 
    printf "Protocols differ in %s:\n  P1: %s\n  P2: %s\n" name v1 v2
  in
  let print_transition_diff t1 t2 =
    if t1.pre <> t2.pre then
      printf "  Pre-state differs: P1: %d, P2: %d\n" t1.pre t2.pre;
    if t1.post <> t2.post then
      printf "  Post-state differs: P1: %d, P2: %d\n" t1.post t2.post;
    if t1.sender <> t2.sender then
      printf "  Sender differs: P1: %s, P2: %s\n" t1.sender t2.sender;
    if t1.receiver <> t2.receiver then
      printf "  Receiver differs: P1: %s, P2: %s\n" t1.receiver t2.receiver;
    if t1.comm_var <> t2.comm_var then
      printf "  Communication variable differs: P1: %s, P2: %s\n" t1.comm_var t2.comm_var;
    if not (formula_eq t1.predicate t2.predicate) then
      printf "  Predicate differs: P1: %s, P2: %s\n" 
        (string_of_formula t1.predicate) (string_of_formula t2.predicate)
  in
  let rec compare_transitions t1 t2 index =
    match (t1, t2) with
    | [], [] -> true
    | [], _ -> 
        printf "Extra transition in P2 at index %d:\n" index;
        List.iteri (fun i t -> 
          printf "  Transition %d: %d->%d, sender: %s, receiver: %s, comm_var: %s, predicate: %s\n"
            (index + i) t.pre t.post t.sender t.receiver t.comm_var (string_of_formula t.predicate)
        ) t2;
        false
    | _, [] -> 
        printf "Extra transition in P1 at index %d:\n" index;
        List.iteri (fun i t -> 
          printf "  Transition %d: %d->%d, sender: %s, receiver: %s, comm_var: %s, predicate: %s\n"
            (index + i) t.pre t.post t.sender t.receiver t.comm_var (string_of_formula t.predicate)
        ) t1;
        false
    | h1::r1, h2::r2 ->
        if not (symbolic_transition_eq h1 h2) then
          (printf "Transition differs at index %d:\n" index;
           print_transition_diff h1 h2;
           false)
        else compare_transitions r1 r2 (index + 1)
  in
  if p1.states <> p2.states then
    (print_diff "states" (String.concat "," (List.map string_of_int p1.states))
                         (String.concat "," (List.map string_of_int p2.states));
     false)
  else if p1.registers <> p2.registers then
    (print_diff "registers" (String.concat "," p1.registers)
                            (String.concat "," p2.registers);
     false)
  else if not (compare_transitions p1.transitions p2.transitions 0) then
    false
  else if p1.initial_state <> p2.initial_state then
    (print_diff "initial_state" (string_of_int p1.initial_state)
                                (string_of_int p2.initial_state);
     false)
  else if p1.initial_register_assignment <> p2.initial_register_assignment then
    (print_diff "initial_register_assignment" 
       (String.concat "," (List.map (fun (v,n) -> sprintf "%s=%d" v n) p1.initial_register_assignment))
       (String.concat "," (List.map (fun (v,n) -> sprintf "%s=%d" v n) p2.initial_register_assignment));
     false)
  else if p1.final_states <> p2.final_states then
    (print_diff "final_states" (String.concat "," (List.map string_of_int p1.final_states))
                               (String.concat "," (List.map string_of_int p2.final_states));
     false)
  else
    true


(* let symbolic_protocol_eq p1 p2 =
  let print_diff name v1 v2 = 
    printf "Protocols differ in %s:\n  P1: %s\n  P2: %s\n" name v1 v2
  in
  let rec compare_transitions t1 t2 index =
    match (t1, t2) with
    | [], [] -> true
    | [], _ -> print_diff (sprintf "transitions (extra in P2 at index %d)" index) "" ""; false
    | _, [] -> print_diff (sprintf "transitions (extra in P1 at index %d)" index) "" ""; false
    | h1::r1, h2::r2 ->
        if not (symbolic_transition_eq h1 h2) then
          (print_diff (sprintf "transition at index %d" index) 
             (sprintf "%d->%d" h1.pre h1.post) 
             (sprintf "%d->%d" h2.pre h2.post);
           false)
        else compare_transitions r1 r2 (index + 1)
  in
  if p1.states <> p2.states then
    (print_diff "states" (String.concat "," (List.map string_of_int p1.states))
                         (String.concat "," (List.map string_of_int p2.states));
     false)
  else if p1.registers <> p2.registers then
    (print_diff "registers" (String.concat "," p1.registers)
                            (String.concat "," p2.registers);
     false)
  else if not (compare_transitions p1.transitions p2.transitions 0) then
    false
  else if p1.initial_state <> p2.initial_state then
    (print_diff "initial_state" (string_of_int p1.initial_state)
                                (string_of_int p2.initial_state);
     false)
  else if p1.initial_register_assignment <> p2.initial_register_assignment then
    (print_diff "initial_register_assignment" 
       (String.concat "," (List.map (fun (v,n) -> sprintf "%s=%d" v n) p1.initial_register_assignment))
       (String.concat "," (List.map (fun (v,n) -> sprintf "%s=%d" v n) p2.initial_register_assignment));
     false)
  else if p1.final_states <> p2.final_states then
    (print_diff "final_states" (String.concat "," (List.map string_of_int p1.final_states))
                               (String.concat "," (List.map string_of_int p2.final_states));
     false)
  else
    true
 *)
(* Print functions *)

let rec print_expr = function
  | Const n -> printf "Const(%d)" n
  | Var v -> printf "Var(\"%s\")" v
  | VarPrime v -> printf "VarPrime(\"%s\")" v
  | Plus (e1, e2) -> printf "Plus("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Minus (e1, e2) -> printf "Minus("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Times (e1, e2) -> printf "Times("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Div (e1, e2) -> printf "Div("; print_expr e1; printf ", "; print_expr e2; printf ")"

let rec print_formula = function
  | True -> printf "True"
  | False -> printf "False"
  | Eq (e1, e2) -> printf "Eq("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Lt (e1, e2) -> printf "Lt("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Gt (e1, e2) -> printf "Gt("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Neq (e1, e2) -> printf "Neq("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Leq (e1, e2) -> printf "Leq("; print_expr e1; printf ", "; print_expr e2; printf ")"
  | Geq (e1, e2) -> printf "Geq("; print_expr e1; printf ", "; print_expr e2; printf ")"  
  | And (f1, f2) -> printf "And("; print_formula f1; printf ", "; print_formula f2; printf ")"
  | Or (f1, f2) -> printf "Or("; print_formula f1; printf ", "; print_formula f2; printf ")"
  | Not f -> printf "Not("; print_formula f; printf ")"

let print_symbolic_transition t =
  printf "{\n";
  printf "  pre = %d;\n" t.pre;
  printf "  sender = \"%s\";\n" t.sender;
  printf "  receiver = \"%s\";\n" t.receiver;
  printf "  comm_var = \"%s\";\n" t.comm_var;
  printf "  predicate = "; print_formula t.predicate; printf ";\n";
  printf "  post = %d;\n" t.post;
  printf "}"

let print_symbolic_protocol p =
  printf "{\n";
  printf "  states = [%s];\n" (String.concat "; " (List.map string_of_int p.states));
  printf "  registers = [%s];\n" (String.concat "; " (List.map (sprintf "\"%s\"") p.registers));
  printf "  transitions = [\n";
  List.iter (fun t -> print_symbolic_transition t; printf ";\n") p.transitions;
  printf "  ];\n";
  printf "  initial_state = %d;\n" p.initial_state;
  printf "  initial_register_assignment = [%s];\n" 
    (String.concat "; " (List.map (fun (v, n) -> sprintf "(\"%s\", %d)" v n) p.initial_register_assignment));
  printf "  final_states = [%s];\n" (String.concat "; " (List.map string_of_int p.final_states));
  printf "}\n"
  
(* Printing functions *)


(*
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

let print_symbolic_protocol (protocol: symbolic_protocol) =
  (* Print states *)
  printf "States: %s\n" (String.concat ", " (List.map string_of_int protocol.states));
  
  (* Print registers *)
  printf "Registers: %s\n" (String.concat ", " protocol.registers);
  
  (* Print initial state *)
  printf "Initial state: %d\n" protocol.initial_state;
  
  (* Print initial register assignment *)
  printf "Initial register assignment:\n";
  List.iter (fun (var, value) -> 
    printf "  %s = %d\n" var value
  ) protocol.initial_register_assignment;
  
  (* Print final states *)
  printf "Final states: %s\n" (String.concat ", " (List.map string_of_int protocol.final_states));
  
  (* Print transitions *)
  printf "Transitions:\n";
  List.iter (fun t ->
    printf "  ";
    print_transition_stdout t
  ) protocol.transitions *)

