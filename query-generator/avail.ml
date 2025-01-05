open Ast 
open Common 

(* The only extra thing to be mindful of here is the way sets are canonically represented as strings *)
(* For the _pqr that goes on avail *)

(* Convention is that we are defining avail_pq_set *)

let sort_participants (ls: participant list) : participant list = 
	List.sort String.compare ls 

let string_of_blocked_set (ls: participant list) : string = 
	List.fold_left (fun acc x -> acc ^ x) "" (sort_participants ls)

let rec powerset = function
  | [] -> [[]]
  | x :: xs ->
      let ps = powerset xs in
      ps @ List.map (fun subset -> x :: subset) ps

let all_participant_subsets (prot: symbolic_protocol) : (participant list) list = 
	powerset (get_participants prot)

(* The first conjunct constrains the values of s to the state space of the protocol *) 
let first_conjunct (prot: symbolic_protocol) : string = 
	"(" ^ 
	List.fold_left (fun acc s -> acc ^ " \\/ s = " ^ string_of_int s) "false" prot.states ^ 
	")\n"

(* The second disjunct corresponds to the case where a new participant is blocked *)
(* The second disjunct enumerates transitions where the sender is blocked, and the signature is not p->q *)
let filter_transitions_disjunct_two (ls: symbolic_transition list) (bs: participant list) (p: participant) (q: participant) : symbolic_transition list =
   List.filter (fun tr -> List.mem tr.sender bs && (tr.sender <> p || tr.receiver <> q)) ls 

let second_disjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (bs: participant list) (p: participant) (q: participant) : string = 
	let phi = substitute tr.predicate tr.comm_var "x" in 
	"(exists (x: int). " ^ 
	quantify_over_poststate_registers prot "exists" ^ " " ^ 
	"avail_" ^ p ^ q ^ "_" ^ 
	string_of_blocked_set (add_nonexistent tr.receiver bs) ^ " " ^ 
	"x1 " ^ 
	string_of_int tr.post ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "'")) "" prot.registers ^
	" /\\ " ^
	string_of_formula phi ^ 
	")\n"

let second_disjunct (prot: symbolic_protocol) (bs: participant list) (p: participant) (q: participant) : string = 
  let transitions = filter_transitions_disjunct_two prot.transitions bs p q in 
  List.fold_left (fun acc tr -> acc ^ " \\/ \n" ^ second_disjunct_from_transition prot tr bs p q) "false" transitions

(* The third disjunct corresponds to the case where no new participant is blocked *)
(* The third disjunct enumerates transitions where the sender is not blocked, and the signature is not p->q *)

let sender_not_blocked (prot: symbolic_protocol) (bs: participant list) (tr: symbolic_transition) : bool = 
	let participants = get_participants prot in 
	List.mem tr.sender participants && not (List.mem tr.sender bs)

let filter_transitions_disjunct_three (prot: symbolic_protocol) (ls: symbolic_transition list) (bs: participant list) (p: participant) (q: participant) : symbolic_transition list =
   List.filter (fun tr -> sender_not_blocked prot bs tr && (tr.sender <> p || tr.receiver <> q)) ls 

let third_disjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (bs: participant list) (p: participant) (q: participant) : string = 
	let phi = substitute tr.predicate tr.comm_var "x" in 
	"(exists (x: int). " ^ 
	"(" ^
	quantify_over_poststate_registers prot "exists" ^ " " ^ 
	"avail_" ^ p ^ q ^ "_" ^ 
	string_of_blocked_set bs ^ " " ^ 
	"x1 " ^ 
	string_of_int tr.post ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ parenthesize (x ^ "'")) "" prot.registers ^
	" /\\ " ^
	string_of_formula phi ^ 
	"))\n"

let third_disjunct (prot: symbolic_protocol) (bs: participant list) (p: participant) (q: participant) : string = 
  let transitions = filter_transitions_disjunct_three prot prot.transitions bs p q in 
  List.fold_left (fun acc tr -> acc ^ " \\/ \n" ^ third_disjunct_from_transition prot tr bs p q) "false" transitions

(* The fourth disjunct eumerates all transitions with the signature p->q, when p is not blocked *)
let filter_transitions_disjunct_four (ls: symbolic_transition list) (bs: participant list) (p: participant) (q: participant) = 
	if List.mem p bs then [] else 
	List.filter (fun tr -> tr.sender = p && tr.receiver = q) ls 

let fourth_disjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (bs: participant list) (p: participant) (q: participant) : string = 
	let phi = substitute tr.predicate tr.comm_var "x1" in 
	string_of_formula phi 

let fourth_disjunct (prot: symbolic_protocol) (bs: participant list) (p: participant) (q: participant) : string = 
	let transitions = filter_transitions_disjunct_four prot.transitions bs p q in 
  	List.fold_left (fun acc tr -> acc ^ " \\/ \n" ^ fourth_disjunct_from_transition prot tr bs p q) "false" transitions

let generate_avail_for_participant_pair_and_blocked_set (prot: symbolic_protocol) (bs: participant list) (p: participant) (q: participant) : string = 
  "avail_" ^ p ^ q ^ "_" ^ 
  string_of_blocked_set bs ^ " " ^ 
  "(x1: int) (s: int) " ^ 
  all_registers prot ^ 
  ": bool =mu " ^ 
  "\n" ^
  first_conjunct prot ^ 
  "/\\ \n" ^
  second_disjunct prot bs p q ^ 
  "\\/ \n " ^ 
  third_disjunct prot bs p q ^
  "\\/ \n " ^ 
  fourth_disjunct prot bs p q ^
  ";"

let generate_avail_for_participant_pair (prot: symbolic_protocol) (p: participant) (q: participant) : string = 
	let bs_list = all_participant_subsets prot in 
	List.fold_left (fun acc bs -> acc ^ "\n" ^ generate_avail_for_participant_pair_and_blocked_set prot bs p q) "" bs_list

