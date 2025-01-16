open Ast 
open Common 

let visualize_initialization_registers (regs: (variable * int) list) (s0: int) : string = 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "\t R [shape=plaintext, label=\""; 
  List.iter (fun (v, i) -> Buffer.add_string buffer (Printf.sprintf "\n%s=%d" v i)) regs;
  Buffer.add_string buffer "\t \"]"; 
  Buffer.add_string buffer (Printf.sprintf "\tR -> %d " s0);
  Buffer.contents buffer

let visualize_transition (t: symbolic_transition) : string = 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "\t"; 
  Buffer.add_string buffer (Printf.sprintf "%d -> %d " t.pre t.post);
  Buffer.add_string buffer 
    (Printf.sprintf "[label=\"%s->%s : %s {%s}\"]; \n"
      t.sender t.receiver t.comm_var (get_string_for_option_string (get_string_for_formula (t.predicate, LastAnd, true))));
  Buffer.contents buffer

let visualize_final_state (s: state) : string = 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "\t"; 
  Buffer.add_string buffer (Printf.sprintf "%d [peripheries=2] " s);
  Buffer.contents buffer

let visualize_protocol (prot: symbolic_protocol) : string = 
  (* Printf.printf "Visualizing the following protocol: \n"; *)
  Printf.printf "\n"; 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "digraph G {\n\n";
  (* Buffer.add_string buffer (visualize_transition (List.hd prot.transitions)); *)
  Buffer.add_string buffer (visualize_initialization_registers prot.initial_register_assignment prot.initial_state); 
  List.iter (fun t -> Buffer.add_string buffer (visualize_transition t)) prot.transitions;
  Buffer.add_string buffer "\n";
  List.iter (fun s -> Buffer.add_string buffer (visualize_final_state s)) prot.final_states;
  Buffer.add_string buffer "\n}\n";
  Buffer.contents buffer

let store_visualization (prot: symbolic_protocol) (dirname: string) : unit = 
	write_to_file (Filename.concat dirname "visualization.dot") (visualize_protocol prot) 