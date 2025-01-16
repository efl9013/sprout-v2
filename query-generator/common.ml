(** common.ml **)
open Ast 

(* Basic *)
let unduplicate lst =
  let rec aux seen = function
    | [] -> List.rev seen
    | x :: xs ->
      if List.mem x seen then
        aux seen xs  (* Skip duplicates *)
      else
        aux (x :: seen) xs  (* Add to seen and continue *)
  in
  aux [] lst
  
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
  | Minus (e1, e2) -> Minus (substitute_expr e1 x y, substitute_expr e2 x y)
  | Times (e1, e2) -> Times (substitute_expr e1 x y, substitute_expr e2 x y)
  | Div (e1, e2) -> Div (substitute_expr e1 x y, substitute_expr e2 x y)
  | Mod (e1, e2) -> Mod (substitute_expr e1 x y, substitute_expr e2 x y)

let rec substitute (phi: formula) (x: variable) (y: variable) : formula = 
  match phi with 
  | True -> True 
  | False -> False 
  | Eq (e1, e2) -> Eq (substitute_expr e1 x y, substitute_expr e2 x y)
  | Neq (e1, e2) -> Neq (substitute_expr e1 x y, substitute_expr e2 x y)
  | Leq (e1, e2) -> Leq (substitute_expr e1 x y, substitute_expr e2 x y)
  | Geq (e1, e2) -> Geq (substitute_expr e1 x y, substitute_expr e2 x y)
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
  | Minus (e1, e2) -> Minus (append1_expr e1, append1_expr e2)
  | Times (e1, e2) -> Times (append1_expr e1, append1_expr e2)
  | Div (e1, e2) -> Div (append1_expr e1, append1_expr e2)
  | Mod (e1, e2) -> Mod (append1_expr e1, append1_expr e2)

let rec append1 (phi: formula) : formula = 
  match phi with 
  | True -> True 
  | False -> False 
  | Eq (e1, e2) -> Eq (append1_expr e1, append1_expr e2) 
  | Neq (e1, e2) -> Neq (append1_expr e1, append1_expr e2)
  | Leq (e1, e2) -> Leq (append1_expr e1, append1_expr e2)
  | Geq (e1, e2) -> Geq (append1_expr e1, append1_expr e2)
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
  | Minus (e1, e2) -> Minus (append2_expr e1, append2_expr e2)
  | Times (e1, e2) -> Times (append2_expr e1, append2_expr e2)
  | Div (e1, e2) -> Div (append2_expr e1, append2_expr e2)
  | Mod (e1, e2) -> Mod (append2_expr e1, append2_expr e2)

let rec append2 (phi: formula) : formula = 
  match phi with 
  | True -> True 
  | False -> False 
  | Eq (e1, e2) -> Eq (append2_expr e1, append2_expr e2) 
  | Neq (e1, e2) -> Neq (append2_expr e1, append2_expr e2)
  | Leq (e1, e2) -> Leq (append2_expr e1, append2_expr e2)
  | Geq (e1, e2) -> Geq (append2_expr e1, append2_expr e2)
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
  List.filter (fun (tr: symbolic_transition) -> participant_uninvolved tr p) ls 

let filter_by_involvement (ls: symbolic_transition list) (p: participant) = 
  List.filter (fun (tr: symbolic_transition) -> participant_involved tr p) ls 

let state_disjunction (ls: state list) (v: variable) =
  List.fold_left (fun acc x -> acc ^ " \\/ " ^ v ^ " = " ^ string_of_int x) "false" ls

let filter_by_prestate (ls: symbolic_transition list) (s: state) = 
  List.filter (fun (tr: symbolic_transition) -> tr.pre = s) ls  

let filter_by_poststate (ls: symbolic_transition list) (s: state) = 
  List.filter (fun (tr: symbolic_transition) -> tr.post = s) ls  

let get_prestates (ls: symbolic_transition list) (s: state) = 
  List.map (fun tr -> tr.pre) (filter_by_poststate ls s)

let get_poststates (ls: symbolic_transition list) (s: state) = 
  List.map (fun tr -> tr.post) (filter_by_prestate ls s)

let filter_by_participant_signature (ls: symbolic_transition list) (p: participant) (q: participant) = 
  List.filter (fun (tr: symbolic_transition) -> tr.sender = p && tr.receiver = q) ls 

let all_pairs list =
  List.concat (List.map (fun x -> List.map (fun y -> (x, y)) list) list)

let all_transition_pairs (ls: symbolic_transition list) : (symbolic_transition * symbolic_transition) list = 
  List.concat (List.map (fun x -> List.map (fun y -> (x, y)) ls) ls) 

let all_state_pairs (ls: state list) : (state * state) list = 
  (* To reproduce the least fixpoint ordering bug in MuVal: toggle ls to List.rev ls *)
  (* Observe that e.g. fibonacci query b_scc_30_3 is now valid, when prodreaches are ordered from 44 ~ 00 *) 
  (* Whereas previously invalid *) 
  (* This happens in both parallel and parallel_exc mode *) 
  (* List.concat (List.map (fun x -> List.map (fun y -> (x, y)) (List.rev ls)) (List.rev ls)) *)
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

(* Helper functions for pruning search space *)
(* Currently this function loops forever *)
(* let rec simultaneously_reachable_for (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) : bool = 
  let s1_prestates_1 = List.map (fun tr -> tr.pre) (filter_by_involvement (filter_by_poststate prot.transitions s1) p) in 
  let s2_prestates_1 = List.map (fun tr -> tr.pre) (filter_by_involvement (filter_by_poststate prot.transitions s2) p) in 
  let s1_prestates_2 = List.map (fun tr -> tr.pre) (filter_by_uninvolvement (filter_by_poststate prot.transitions s1) p) in 
  let s2_prestates_3 = List.map (fun tr -> tr.pre) (filter_by_uninvolvement (filter_by_poststate prot.transitions s2) p) in 
  (s1 = prot.initial_state && s2 = prot.initial_state)
  || 
  (List.fold_left 
    (fun acc1 s1_pre -> 
      acc1 || (List.fold_left 
              (fun acc2 s2_pre -> 
                acc2 || simultaneously_reachable_for prot s1_pre s2_pre p) 
              false 
              s2_prestates_1)) 
  false 
  s1_prestates_1)
  || 
  (List.fold_left 
    (fun acc s1_pre -> acc || simultaneously_reachable_for prot s1_pre s2 p)
  false 
  s1_prestates_2)
  || 
  (List.fold_left 
    (fun acc s2_pre -> acc || simultaneously_reachable_for prot s1 s2_pre p)
  false 
  s2_prestates_3) *)

let simultaneously_reachable_for (prot: symbolic_protocol) (s1: state) (s2: state) (p: participant) : bool =
  let cache = Hashtbl.create 100 in
  let visited = Hashtbl.create 100 in
  
  let rec helper s1 s2 =
    if Hashtbl.mem visited (s1, s2) then false
    else if Hashtbl.mem cache (s1, s2) then Hashtbl.find cache (s1, s2)
    else begin
      Hashtbl.add visited (s1, s2) true;
      let result =
        (let s1_prestates_1 = List.map (fun tr -> tr.pre) (filter_by_involvement (filter_by_poststate prot.transitions s1) p) in 
        let s2_prestates_1 = List.map (fun tr -> tr.pre) (filter_by_involvement (filter_by_poststate prot.transitions s2) p) in 
        let s1_prestates_2 = List.map (fun tr -> tr.pre) (filter_by_uninvolvement (filter_by_poststate prot.transitions s1) p) in 
        let s2_prestates_3 = List.map (fun tr -> tr.pre) (filter_by_uninvolvement (filter_by_poststate prot.transitions s2) p) in 
        (s1 = prot.initial_state && s2 = prot.initial_state)
        || 
        (List.fold_left 
          (fun acc1 s1_pre -> 
            acc1 || (List.fold_left 
                    (fun acc2 s2_pre -> 
                      acc2 || helper s1_pre s2_pre) 
                    false 
                    s2_prestates_1)) 
        false 
        s1_prestates_1)
        || 
        (List.fold_left 
          (fun acc s1_pre -> acc || helper s1_pre s2)
        false 
        s1_prestates_2)
        || 
        (List.fold_left 
          (fun acc s2_pre -> acc || helper s1 s2_pre)
        false 
        s2_prestates_3))
      in
      Hashtbl.add cache (s1, s2) result;
      Hashtbl.remove visited (s1, s2);
      result
    end
  in
  helper s1 s2


let simultaneously_reachable_states_for (prot: symbolic_protocol) (p: participant) : (state * state) list = 
  List.filter (fun (s1, s2) -> simultaneously_reachable_for prot s1 s2 p) (all_state_pairs prot.states)

let simultaneously_reachable_as_for (prot: symbolic_protocol) (s: state) (p: participant) : state list = 
  List.filter (fun s' -> simultaneously_reachable_for prot s s' p) prot.states 

let print_simultaneously_reachable_states_for (prot: symbolic_protocol) (p: participant) = 
  Printf.printf "Printing simultaneously reachable states:\n";
  List.iter (fun (s1, s2) -> Printf.printf "(%i,%i)\n" s1 s2) (simultaneously_reachable_states_for prot p)
