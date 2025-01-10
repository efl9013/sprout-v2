(** common.ml **)
open Ast 

(* System utilities *)
let write_to_file filename contents =
  let oc = open_out filename in
  try
    Printf.fprintf oc "%s\n" contents;
    close_out oc
  with e ->
    close_out_noerr oc;
    raise e

let create_newdir path perm =
  if not (Sys.file_exists path) then Sys.mkdir path perm
  
(* Protocol functions *)
module StringSet = Set.Make(String)

let add_nonexistent (p: participant) (ls: participant list) =
  if List.mem p ls then ls else p :: ls 

let get_participants protocol =
  let participant_set = 
    List.fold_left (fun acc transition ->
      acc
      |> StringSet.add transition.sender
      |> StringSet.add transition.receiver
    ) StringSet.empty protocol.transitions
  in
  StringSet.elements participant_set

let get_senders protocol =
  let participant_set = 
    List.fold_left (fun acc transition ->
      acc
      |> StringSet.add transition.sender
    ) StringSet.empty protocol.transitions
  in
  StringSet.elements participant_set

let get_receivers protocol =
  let participant_set = 
    List.fold_left (fun acc transition ->
      acc
      |> StringSet.add transition.receiver
    ) StringSet.empty protocol.transitions
  in
  StringSet.elements participant_set

let print_participants protocol =
  let participants = get_participants protocol in
  Printf.printf "Participants: {";
  List.iteri (fun i p ->
    Printf.printf "%s%s" p (if i < List.length participants - 1 then ", " else "")
  ) participants;
  Printf.printf "}\n"
  
let intersection l1 l2 = List.filter (fun e -> List.mem e l2) l1

let all_distinct_participant_pairs (prot: symbolic_protocol) = 
  let participants = get_participants prot in
  let all_pairs =  List.concat (List.map (fun p -> List.map (fun q -> (p,q)) participants) participants) in 
  List.filter (fun (p,q) -> p <> q) all_pairs

let rec substitute_expr (e: expr) (x: variable) (y: variable) : expr = 
  match e with 
  | Const i -> Const i 
  | Var v -> if v = x then Var y else Var v
  | VarPrime v -> if v ^ "'" = x then Var y else VarPrime v 
  | Plus (e1, e2) -> Plus (substitute_expr e1 x y, substitute_expr e2 x y)
  | Minus (e1, e2) -> Plus (substitute_expr e1 x y, substitute_expr e2 x y)
  | Times (e1, e2) -> Plus (substitute_expr e1 x y, substitute_expr e2 x y)
  | Div (e1, e2) -> Plus (substitute_expr e1 x y, substitute_expr e2 x y)

let rec substitute (phi: formula) (x: variable) (y: variable) : formula = 
  match phi with 
  | True -> True 
  | False -> False 
  | Eq (e1, e2) -> Eq (substitute_expr e1 x y, substitute_expr e2 x y)
  | Lt (e1, e2) -> Lt (substitute_expr e1 x y, substitute_expr e2 x y) 
  | Gt (e1, e2) -> Gt (substitute_expr e1 x y, substitute_expr e2 x y)
  | And (phi1, phi2) -> And (substitute phi1 x y, substitute phi2 x y)
  | Or (phi1, phi2) -> Or (substitute phi1 x y, substitute phi2 x y)
  | Not phi1 -> Not (substitute phi1 x y)

let rec append1_expr (e: expr) : expr = 
  match e with 
  | Const i -> Const i 
  | Var v -> Var (v ^ "1")
  | VarPrime v -> VarPrime (v ^ "1")
  | Plus (e1, e2) -> Plus (append1_expr e1, append1_expr e2)
  | Minus (e1, e2) -> Plus (append1_expr e1, append1_expr e2)
  | Times (e1, e2) -> Plus (append1_expr e1, append1_expr e2)
  | Div (e1, e2) -> Plus (append1_expr e1, append1_expr e2)

let rec append1 (phi: formula) : formula = 
  match phi with 
  | True -> True 
  | False -> False 
  | Eq (e1, e2) -> Eq (append1_expr e1, append1_expr e2) 
  | Lt (e1, e2) -> Lt (append1_expr e1, append1_expr e2) 
  | Gt (e1, e2) -> Gt (append1_expr e1, append1_expr e2)
  | And (phi1, phi2) -> And (append1 phi1, append1 phi2)
  | Or (phi1, phi2) -> Or (append1 phi1, append1 phi2)
  | Not phi1 -> Not (append1 phi1)

let rec append2_expr (e: expr) : expr = 
  match e with 
  | Const i -> Const i 
  | Var v -> Var (v ^ "2")
  | VarPrime v -> VarPrime (v ^ "2")
  | Plus (e1, e2) -> Plus (append2_expr e1, append2_expr e2)
  | Minus (e1, e2) -> Plus (append2_expr e1, append2_expr e2)
  | Times (e1, e2) -> Plus (append2_expr e1, append2_expr e2)
  | Div (e1, e2) -> Plus (append2_expr e1, append2_expr e2)

let rec append2 (phi: formula) : formula = 
  match phi with 
  | True -> True 
  | False -> False 
  | Eq (e1, e2) -> Eq (append2_expr e1, append2_expr e2) 
  | Lt (e1, e2) -> Lt (append2_expr e1, append2_expr e2) 
  | Gt (e1, e2) -> Gt (append2_expr e1, append2_expr e2)
  | And (phi1, phi2) -> And (append2 phi1, append2 phi2)
  | Or (phi1, phi2) -> Or (append2 phi1, append2 phi2)
  | Not phi1 -> Not (append2 phi1)

(* For now we are assuming that everything is an int *)
let filter_by_sender (ls: symbolic_transition list) (p: participant) = 
  List.filter (fun (tr: symbolic_transition) -> tr.sender = p) ls 

let filter_by_receiver (ls: symbolic_transition list) (p: participant) = 
  List.filter (fun (tr: symbolic_transition) -> tr.receiver = p) ls 

let participant_involved (tr: symbolic_transition) (p: participant) = 
  tr.sender = p || tr.receiver = p 

let participant_uninvolved (tr: symbolic_transition) (p: participant) = 
  tr.sender <> p && tr.receiver <> p 

let filter_by_uninvolvement (ls: symbolic_transition list) (p: participant) = 
  List.filter (fun (tr: symbolic_transition) -> tr.sender <> p && tr.receiver <> p) ls 

let state_disjunction (ls: state list) (v: variable) =
  List.fold_left (fun acc x -> acc ^ " \\/ " ^ v ^ " = " ^ string_of_int x) "false" ls

let filter_by_prestate (ls: symbolic_transition list) (s: state) = 
  List.filter (fun (tr: symbolic_transition) -> tr.pre = s) ls  

let filter_by_poststate (ls: symbolic_transition list) (s: state) = 
  List.filter (fun (tr: symbolic_transition) -> tr.post = s) ls  

let filter_by_participant_signature (ls: symbolic_transition list) (p: participant) (q: participant) = 
  List.filter (fun (tr: symbolic_transition) -> tr.sender = p && tr.receiver = q) ls 

let all_pairs list =
  List.concat (List.map (fun x -> List.map (fun y -> (x, y)) list) list)

let all_transition_pairs (ls: symbolic_transition list) : (symbolic_transition * symbolic_transition) list = 
  List.concat (List.map (fun x -> List.map (fun y -> (x, y)) ls) ls) 

let all_state_pairs (ls: state list) : (state * state) list = 
  List.concat (List.map (fun x -> List.map (fun y -> (x, y)) ls) ls)

let parenthesize (s: string) : string = 
  "(" ^ s ^ ")"

let quantify_over_prestate_registers (prot: symbolic_protocol) (quantifier: string) : string = 
  if prot.registers = [] then "" else 
    (quantifier ^ 
     List.fold_left (fun acc x -> acc ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
     ". ")

let quantify_over_poststate_registers (prot: symbolic_protocol) (quantifier: string) : string = 
  if prot.registers = [] then "" else 
    (quantifier ^ 
      List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "': int")) "" prot.registers ^
     ". ")

let all_registers (prot: symbolic_protocol) : string = 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ ":int")) "" prot.registers 

let all_registers_prime (prot: symbolic_protocol) : string = 
  List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "':int")) "" prot.registers 

let prime_variables (ls: variable list) : variable list = 
  List.map (fun x -> x ^ "'") ls 

let append1_variables (ls: variable list) : variable list = 
  List.map (fun x -> x ^ "1") ls 

let append2_variables (ls: variable list) : variable list = 
  List.map (fun x -> x ^ "2") ls 
(** common.ml **)

