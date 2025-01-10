open Ast 
open Common 
open Prodreach 
open Unreach 

(* SCC is first split into a set of queries for each participant p, 
   then it enumerates transitions in which p is the sender *) 
let filter_transitions_scc_participant (ls: symbolic_transition list) (p: participant) =
   filter_by_sender ls p 

let filter_participant_pairs_for_unreach (prot: symbolic_protocol) (p: participant) = 
	(* Defined like so to avoid repeats *)
	let all_pairs = all_distinct_participant_pairs prot in 
	let relevant_transitions = filter_transitions_scc_participant prot.transitions p in 
	let relevant_pairs = List.map (fun tr -> (tr.sender, tr.receiver)) relevant_transitions in 
	intersection all_pairs relevant_pairs 

(** First style of SCC generation: one muCLP query per transition **)
(* For each transition, pair it with each state in the protocol and generate four conjuncts *)
let first_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	List.fold_left (fun acc s -> acc ^ " \\/ " ^ "(s1 = " ^ string_of_int tr.pre ^ " /\\ s'1 = " ^ string_of_int tr.post ^ " /\\ s2 = " ^ string_of_int s ^ ")") "false" prot.states ^ 
	")\n"

let second_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(prodreach_" ^ p ^ " " ^
	"s1 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	"s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

let third_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	let phi1 = substitute (append1 tr.predicate) (tr.comm_var ^ "1") "x1" in 
	"(" ^ 
	string_of_formula phi1 ^ 
	")\n"

let fourth_conjunct_from_transition (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ " s2 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

let generate_scc_preamble_from_transition_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"exists " ^ 
	"(s1: int) (s'1: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	"(s2: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int)" ^ 
	". \n" ^
	first_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	second_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	third_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_transition prot tr p ^ 
	"s.t.\n"

let generate_scc_from_transition_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	generate_scc_preamble_from_transition_for_participant prot tr p ^ 
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	unreach_for_participant_pair prot tr.sender tr.receiver 

let generate_scc_filename_from_transition_for_participant (tr: symbolic_transition) (p: participant) = 
	p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ ".hes"

let generate_scc_queries_from_transition_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) = 
  let transitions = filter_transitions_scc_participant prot.transitions p in 
  List.iter (fun tr -> write_to_file 
                          (Filename.concat dir (generate_scc_filename_from_transition_for_participant tr p))
                          (generate_scc_from_transition_for_participant prot tr p))
            transitions 

let generate_scc_queries_from_transition (prot: symbolic_protocol) (dir: string) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_scc_queries_from_transition_for_participant prot p dir) participants 

(** Second style of SCC generation: one muCLP query per participant **)
(* These versions of the above functions are for generating queries with SCC factored into one query per (transition, state) *)
let first_conjunct_from_transition_and_state (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(s1 = " ^ string_of_int tr.pre ^ " /\\ s'1 = " ^ string_of_int tr.post ^ ")\n" 

let second_conjunct_from_transition_and_state (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	"(prodreach_" ^ p ^ " " ^
	"s1 " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "1 ") "" prot.registers ^ 
	string_of_int s ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	")\n"

let fourth_conjunct_from_transition_and_state (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	"(" ^ 
	"unreach_" ^ p ^ tr.receiver ^ " " ^ string_of_int s ^ " " ^ 
	List.fold_left (fun acc r -> acc ^ r ^ "2 ") "" prot.registers ^ 
	" x1 " ^ 
	")\n"

let generate_scc_preamble_from_transition_and_state_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	"exists " ^ 
	"(s1: int) (s'1: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int)" ^ 
	". \n" ^
	first_conjunct_from_transition_and_state prot tr p ^ 
	" /\\ \n" ^
	second_conjunct_from_transition_and_state prot tr s p ^ 
	" /\\ \n" ^
	third_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_transition_and_state prot tr s p ^ 
	"s.t.\n"

let generate_scc_from_transition_and_state_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (s: state) (p: participant) = 
	generate_scc_preamble_from_transition_and_state_for_participant prot tr s p ^ 
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	unreach_for_participant_pair prot tr.sender tr.receiver 

let generate_scc_filename_from_transition_and_state_for_participant (tr: symbolic_transition) (s: state) (p: participant) = 
	p ^ "_scc_" ^ string_of_int tr.pre ^ string_of_int tr.post ^ "_" ^ string_of_int s ^ ".hes"

let generate_scc_queries_from_transition_and_state_for_participant (prot: symbolic_protocol) (p: participant) (dir: string) = 
  let transitions = filter_transitions_scc_participant prot.transitions p in 
  List.iter (fun tr -> List.iter (fun s -> write_to_file 
                          										(Filename.concat dir (generate_scc_filename_from_transition_and_state_for_participant tr s p))
                          										(generate_scc_from_transition_and_state_for_participant prot tr s p))
            											prot.states)
  					transitions 

let generate_scc_queries_from_transition_and_state (prot: symbolic_protocol) (dir: string) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_scc_queries_from_transition_and_state_for_participant prot p dir) participants 

(** Third style of SCC generation: one muCLP query per transition per state *)
let generate_scc_first_line_for_participant (prot: symbolic_protocol) (p: participant) = 
	"exists " ^ 
	"(s1: int) (s'1: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "1: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'1: int) ") "" prot.registers ^ 
	"(s2: int) " ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "2: int) ") "" prot.registers ^ 
	List.fold_left (fun acc r -> acc ^ "(" ^r ^ "'2: int) ") "" prot.registers ^ 
	"(x1: int)" ^ 
	". \n" 

let generate_scc_body_from_transition_for_participant (prot: symbolic_protocol) (tr: symbolic_transition) (p: participant) = 
	"(" ^
	first_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	second_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	third_conjunct_from_transition prot tr p ^ 
	" /\\ \n" ^
	fourth_conjunct_from_transition prot tr p ^
	")"

let generate_scc_preamble_for_participant_altogether (prot: symbolic_protocol) (p: participant) = 
	let transitions = filter_transitions_scc_participant prot.transitions p in 
	generate_scc_first_line_for_participant prot p ^
  List.fold_left (fun acc tr -> acc ^ "\n\\/\n" ^ generate_scc_body_from_transition_for_participant prot tr p) "false" transitions ^ 
	"\ns.t.\n"

let generate_unreach_for_participant_altogether (prot: symbolic_protocol) (p: participant) : string = 
	let pairs_list = filter_participant_pairs_for_unreach prot p in 
	List.fold_left (fun acc (p,q) -> acc ^ "\n" ^ unreach_for_participant_pair prot p q) "" pairs_list

let generate_scc_for_participant_altogether (prot: symbolic_protocol) (p: participant) = 
	generate_scc_preamble_for_participant_altogether prot p ^ 
	"\n" ^ 
	generate_prodreach_for_participant prot p ^ 
	"\n\n" ^ 
	generate_unreach_for_participant_altogether prot p 

let generate_scc_queries_for_participant_altogether (prot: symbolic_protocol) (p: participant) (dir: string) = 
	let filename = p ^ "_scc.hes" in 
	write_to_file (Filename.concat dir filename) (generate_scc_for_participant_altogether prot p)

let generate_scc_queries_altogether (prot: symbolic_protocol) (dir: string) = 
	let participants = get_senders prot in 
  List.iter (fun p -> generate_scc_queries_for_participant_altogether prot p dir) participants 





