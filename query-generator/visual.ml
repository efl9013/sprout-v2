open Ast 
open Common 

let visualize_transition (t: symbolic_transition) : string = 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "\t"; 
  Buffer.add_string buffer (Printf.sprintf "%d -> %d " t.pre t.post);
  Buffer.add_string buffer 
    (Printf.sprintf "[label=\"%s->%s : %s {%s}\"]; \n"
      t.sender t.receiver t.comm_var (get_string_for_formula t.predicate));
  Buffer.contents buffer

let visualize_final_state (s: state) : string = 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "\t"; 
  Buffer.add_string buffer (Printf.sprintf "%d [shape=doublecircle] " s);
  Buffer.contents buffer

let visualize_protocol (prot: symbolic_protocol) : string = 
  (* Printf.printf "Visualizing the following protocol: \n";
  print_symbolic_protocol prot;  *)
  Printf.printf "\n"; 
  let buffer = Buffer.create 256 in
  Buffer.add_string buffer "digraph G {\n\n";
  (* Buffer.add_string buffer (visualize_transition (List.hd prot.transitions)); *)
  List.iter (fun t -> Buffer.add_string buffer (visualize_transition t)) prot.transitions;
  Buffer.add_string buffer "\n";
  List.iter (fun s -> Buffer.add_string buffer (visualize_final_state s)) prot.final_states;
  Buffer.add_string buffer "\n}\n";
  Buffer.contents buffer

let store_visualization (prot: symbolic_protocol) (dirname: string) : unit = 
	write_to_file (Filename.concat dirname "visualization.dot") (visualize_protocol prot) 