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
                                 tr2.pre = s && 
                             	 tr1.post <> tr2.post)
                ls

let generate_determinism_for_transition_pair (prot: symbolic_protocol) (pair: symbolic_transition * symbolic_transition) : string = 
	let tr1 = fst pair in 
  	let tr2 = snd pair in 
  	let phi1 = substitute tr1.predicate (tr1.comm_var) "x" in 
  	let phi2 = substitute tr2.predicate (tr2.comm_var) "x" in 
  	"forall (x:int) " ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ "': int")) "" prot.registers ^ 
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
	"\ns.t.\n" ^
	generate_reach prot 

let generate_determinism_queries (prot: symbolic_protocol) (dir: string) = 
	List.iter (fun s -> 
						(* For each state in the protocol *)
						List.iter (fun (tr1,tr2) -> 
													(* For every pair of transitions with different post-states originating from it *)
													write_to_file
			                         (Filename.concat dir (string_of_int s ^ "_det_" ^ string_of_int tr1.post ^ "_" ^ string_of_int tr2.post ^ ".hes"))
			                         (generate_determinism_for_transition_pair prot (tr1,tr2)))
								(filter_transition_pairs_for_state_determinism (all_transition_pairs prot.transitions) s))
			prot.states 

(* 2) Deadlock-freedom picks out non-final states *)
let filter_states_for_deadlock_freedom (prot: symbolic_protocol) =
   List.filter (fun x -> not (List.mem x prot.final_states)) prot.states 

let generate_disjuncts_for_deadlock_free (prot: symbolic_protocol) (s: state) (ls: symbolic_transition list) : string = 
	let transitions = List.filter (fun tr -> tr.pre = s) prot.transitions in 
	List.fold_left (fun acc tr -> acc ^ " \\/ " ^ string_of_formula (substitute tr.predicate (tr.comm_var) "x")) "" transitions 

let generate_df_for_state (prot: symbolic_protocol) (s: state) : string = 
	"df_" ^ string_of_int s ^ 
	": bool =mu " ^ 
	"forall (x:int) " ^ 
  	List.fold_left (fun acc x -> acc ^ " " ^ parenthesize (x ^ ": int")) "" prot.registers ^ 
  	".\n" ^
  	"(" ^ 
  	"reach_" ^ string_of_int s ^ " " ^
  	List.fold_left (fun acc x -> acc ^ x ^ " ") "" prot.registers ^
  	" ==> " ^ 
  	"(" ^
  	"exists (x:int) " ^ 
  	generate_disjuncts_for_deadlock_free prot s prot.transitions ^ 
  	")" ^
  	";"

let generate_deadlock_free (prot: symbolic_protocol) : string = 
	List.fold_left (fun acc s -> acc ^ " /\\ df_" ^ string_of_int s) "true" prot.states ^
	"\ns.t.\n" ^ 
	generate_reach prot ^ 
	"\n" ^ 
	List.fold_left (fun acc s -> acc ^ "\n" ^ generate_df_for_state prot s) "" prot.states 

let generate_deadlock_free_queries (prot: symbolic_protocol) (dirname: string) = 
	write_to_file
			     (Filename.concat dirname ("df.hes"))
			     (generate_deadlock_free prot)