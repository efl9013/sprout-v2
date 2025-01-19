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


