open Ast 
open Common 
open Reach 

(* GCLTS conditions: 
	1) determinism
	2) deadlock-freedom 
	3) sender-driven 
	4) sink-final *) 

(* 1) Determinism picks out pairs of transitions with the same pre-state *) 
let filter_transition_pairs_for_state_determinism (ls: (symbolic_transition * symbolic_transition) list) (s: state) =
   List.filter (fun (tr1,tr2) -> tr1.pre = s && 
                                 tr2.pre = s)
                             	 (* tr1.post <> tr2.post) *)
                ls

(* Note to self for README: primed variables have special meaning and should not be used as communication variables! *)
let generate_determinism_for_transition_pair_vb (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) : string = 
	let tr1 = fst pair in 
  	let tr2 = snd pair in 
  	let phi1 = substitute (append1_primeonly tr1.predicate) (tr1.comm_var) "x" in 
  	let phi2 = substitute (append2_primeonly tr2.predicate) (tr2.comm_var) "x" in 
  	"exists (x:int) " ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "'1: int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "'2: int")) "" prot.registers ^ 
  	".\n" ^
  	"(" ^
  	"reach_" ^ string_of_int tr1.pre ^ " " ^
  	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
  	")" ^ 
  	" /\\ \n" ^
  	"(" ^ 
	string_of_formula phi1 ^ 
	")\n" ^
	" /\\ \n" ^
	"(" ^ 
	string_of_formula phi2 ^ 
	")" ^
	" /\\ \n" ^
	"(" ^ 
	string_of_int tr1.post ^ "!=" ^ string_of_int tr2.post ^ 
	" \\/ " ^ 
	List.fold_left (fun acc x -> acc ^ " \\/ " ^ parenthesize (x ^ "'1 != " ^ x ^ "'2")) "false" prot.registers ^ 
	")" ^
	"\ns.t.\n" ^
	generate_reach_vb prot 

let determinism_for_transition_pair_v1b_body (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) : string = 
	let tr1 = fst pair in 
  	let tr2 = snd pair in 
  	let phi1 = substitute (append1_primeonly tr1.predicate) (tr1.comm_var) "x" in 
  	let phi2 = substitute (append2_primeonly tr2.predicate) (tr2.comm_var) "x" in 
  	"(" ^
  	"reach_" ^ string_of_int tr1.pre ^ " " ^
  	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
  	")" ^ 
  	" /\\ \n" ^
  	"(" ^ 
	string_of_formula phi1 ^ 
	")\n" ^
	" /\\ \n" ^
	"(" ^ 
	string_of_formula phi2 ^ 
	")" ^
	" /\\ \n" ^
	"(" ^ 
	string_of_int tr1.post ^ "!=" ^ string_of_int tr2.post ^ 
	" \\/ " ^ 
	List.fold_left (fun acc x -> acc ^ " \\/ " ^ parenthesize (x ^ "'1 != " ^ x ^ "'2")) "false" prot.registers ^ 
	")" 

let generate_determinism_for_transition_pair_va (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) : string = 
	let tr1 = fst pair in 
  	let tr2 = snd pair in 
  	let phi1 = substitute (append1_primeonly tr1.predicate) (tr1.comm_var) "x" in 
  	let phi2 = substitute (append2_primeonly tr2.predicate) (tr2.comm_var) "x" in 
  	"exists (x:int) " ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "'1: int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "'2: int")) "" prot.registers ^ 
  	".\n" ^
  	"(" ^
  	"reach " ^ string_of_int tr1.pre ^ " " ^
  	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
  	")" ^ 
  	" /\\ \n" ^
  	"(" ^ 
	string_of_formula phi1 ^ 
	")\n" ^
	" /\\ \n" ^
	"(" ^ 
	string_of_formula phi2 ^ 
	")" ^
	" /\\ \n" ^
	"(" ^ 
	string_of_int tr1.post ^ "!=" ^ string_of_int tr2.post ^ 
	" \\/ " ^ 
	List.fold_left (fun acc x -> acc ^ " \\/ " ^ parenthesize (x ^ "'1 != " ^ x ^ "'2")) "false" prot.registers ^ 
	")" ^
	"\ns.t.\n" ^
	generate_reach_va prot 

let generate_determinism_v1b (prot: symbolic_protocol) : string = 
	"exists (x:int) " ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "'1: int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "'2: int")) "" prot.registers ^ 
  	".\n" ^
  	List.fold_left (fun acc s -> acc ^ " \\/ " ^ 
	List.fold_left (fun acc (tr1,tr2) -> acc ^ " \\/ " ^ parenthesize (determinism_for_transition_pair_v1b_body prot (tr1,tr2)))
						"false"
						(filter_transition_pairs_for_state_determinism (all_transition_pairs prot.transitions) s))
				"false"
				prot.states ^ 
	"\ns.t.\n" ^
	generate_reach_vb prot 

let generate_determinism_queries_v1b (prot: symbolic_protocol) (dir: string) = 
	write_to_file (Filename.concat dir "det.hes") (generate_determinism_v1b prot)

let generate_determinism_queries_vb (prot: symbolic_protocol) (dir: string) = 
	List.iter (fun s -> 
						(* For each state in the protocol *)
						List.iter (fun (tr1,tr2) -> 
													(* For every pair of transitions with different post-states originating from it *)
													write_to_file
			                         (Filename.concat dir (string_of_int s ^ "_det_" ^ string_of_int tr1.post ^ "_" ^ string_of_int tr2.post ^ ".hes"))
			                         (generate_determinism_for_transition_pair_vb prot (tr1,tr2)))
								(filter_transition_pairs_for_state_determinism (all_transition_pairs prot.transitions) s))
			prot.states 

let generate_determinism_queries_va (prot: symbolic_protocol) (dir: string) = 
	List.iter (fun s -> 
						(* For each state in the protocol *)
						List.iter (fun (tr1,tr2) -> 
													(* For every pair of transitions with different post-states originating from it *)
													write_to_file
			                         (Filename.concat dir (string_of_int s ^ "_det_" ^ string_of_int tr1.post ^ "_" ^ string_of_int tr2.post ^ ".hes"))
			                         (generate_determinism_for_transition_pair_va prot (tr1,tr2)))
								(filter_transition_pairs_for_state_determinism (all_transition_pairs prot.transitions) s))
			prot.states 

(* 2) Deadlock-freedom picks out non-final states *)
let filter_states_for_deadlock_freedom (prot: symbolic_protocol) =
   List.filter (fun x -> not (List.mem x prot.final_states)) prot.states 

let generate_conjunct_for_df (prot: symbolic_protocol) (s: state) (ls: symbolic_transition list) : string = 
	let transitions = List.filter (fun tr -> tr.pre = s) prot.transitions in 
	List.fold_left (fun acc tr -> acc ^ " /\\ " ^ "(" ^ parenthesize (string_of_formula (substitute tr.predicate (tr.comm_var) "x")) ^ " => false " ^ ")") "true" transitions 

let generate_df_for_state (prot: symbolic_protocol) (s: state) : string = 
	"df_" ^ string_of_int s ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
	": bool =mu " ^ 
	"forall (x:int) " ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "': int")) "" prot.registers ^ 
  	".\n" ^
  	generate_conjunct_for_df prot s prot.transitions ^ 
  	";"

let generate_deadlock_free_for_state (prot: symbolic_protocol) (s: state) : string = 
	"exists " ^
	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
	".\n" ^
	"reach_" ^ string_of_int s ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
	" /\\ df_" ^ string_of_int s ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
	"\ns.t.\n" ^ 
	generate_reach_vb prot ^ 
	"\n" ^ 
	List.fold_left (fun acc s -> acc ^ "\n" ^ generate_df_for_state prot s) "" prot.states 

let deadlock_free_body_for_state (prot: symbolic_protocol) (s: state) : string = 
	"reach_" ^ string_of_int s ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^ 
	" /\\ df_" ^ string_of_int s ^ " " ^ 
	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers 

let generate_deadlock_free_v1 (prot: symbolic_protocol) : string = 
	"exists " ^
	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
	".\n" ^
	List.fold_left (fun acc s -> acc ^ " \\/ " ^ parenthesize (deadlock_free_body_for_state prot s)) "false" (filter_states_for_deadlock_freedom prot) ^ 
	"\ns.t.\n" ^ 
	generate_reach_vb prot ^ 
	"\n" ^ 
	List.fold_left (fun acc s -> acc ^ "\n" ^ generate_df_for_state prot s) "" prot.states 

let generate_deadlock_free_queries_v1 (prot: symbolic_protocol) (dirname: string) = 
	write_to_file (Filename.concat dirname "df.hes")
				     (generate_deadlock_free_v1 prot )

let generate_deadlock_free_queries (prot: symbolic_protocol) (dirname: string) = 
	List.iter (fun s -> write_to_file
			     		(Filename.concat dirname ("df_" ^ string_of_int s ^ ".hes"))
			     		(generate_deadlock_free_for_state prot s))
			  (filter_states_for_deadlock_freedom prot) 

(* 3) Sender-driven is a purely syntactic check *) 
let same_sender (ls: symbolic_transition list) : bool = 
	match ls with 
	| [] -> true 
	| hd :: tl -> List.for_all (fun tr -> tr.sender = hd.sender) tl 

let sender_driven_for_state (prot: symbolic_protocol) (s: state): bool = 
	let outgoing_transitions = filter_by_prestate prot.transitions s in 
	same_sender outgoing_transitions 

let sender_driven (prot: symbolic_protocol) : bool = 
	List.fold_left (fun acc s -> acc && sender_driven_for_state prot s) true prot.states 

(* 4) Sink-final is a purely syntactic check *) 
let sink_final (prot: symbolic_protocol) : bool = 
	List.fold_left (fun acc s -> acc && filter_by_prestate prot.transitions s = []) true prot.final_states

