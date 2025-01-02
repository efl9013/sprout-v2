open Ast 
open Common 
open Prodreach
open Unreach
open Avail 
open Scc
open Nmc 
open Rcc 
open Printf

let write_to_file filename contents =
  let oc = open_out filename in
  try
    Printf.fprintf oc "%s\n" contents;
    close_out oc
  with e ->
    close_out_noerr oc;
    raise e

let send_validity_no : symbolic_protocol = {
  states = [0;1;2;3;4];
  registers = [];
  transitions = [
    {
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = Eq (Var "v", Const 1); 
      post = 1
    };
    {
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = Eq (Var "v", Const 2); 
      post = 3
    };
    {
      pre = 1;
      sender = "r";
      receiver = "s";
      comm_var = "v";
      predicate = Eq (Var "v", Const 1); 
      post = 2
    };
    {
      pre = 3;
      sender = "r";
      receiver = "s";
      comm_var = "v";
      predicate = Eq (Var "v", Const 2); 
      post = 4
    }
  ];
  initial_state = 0;
  initial_register_assignment = [];
  final_states = [2;4]
}

let figure11 : symbolic_protocol = {
  states = [0; 1; 2; 3];
  registers = ["rx"; "ry"];
  transitions = [
    { 
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = And(Eq(Var "rx'", Var "v"), Eq(Var "ry'", Var "ry"));
      post = 1;
    };
    {
      pre = 1;
      sender = "q";
      receiver = "r";
      comm_var = "v";
      predicate = And(And(Eq(Var "ry'", Var "v"), Gt(Var "v", Var "rx")), Eq(Var "rx'", Var "rx"));
      post = 2;
    };
    {
      pre = 2;
      sender = "r";
      receiver = "p";
      comm_var = "v";
      predicate = And(And(Gt(Var "v", Var "rx"), Eq(Var "rx'", Var "rx")), Eq(Var "ry'", Var "ry"));
      post = 3;
    };
  ];
  initial_state = 0;
  initial_register_assignment = [("rx", 0); ("ry", 0)];
  final_states = [3];
}

let transition_01 : symbolic_transition = 
  { 
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = And(Eq(Var "rx'", Var "v"), Eq(Var "ry'", Var "ry"));
      post = 1;
    }
 
let generate_scc_queries_for_participant (prot: symbolic_protocol) (p: participant) = 
  let transitions = filter_transitions_scc_participant prot.transitions p in 
  List.iter (fun tr -> write_to_file 
                          (generate_scc_filename_from_transition_for_participant tr p) 
                          (generate_scc_from_transition_for_participant prot tr p))
            transitions 

let generate_nmc_queries_for_participant (prot: symbolic_protocol) (p: participant) = 
  let transition_pairs = filter_transitions_nmc_participant (all_transition_pairs prot.transitions) p in 
  List.iter (fun pair -> write_to_file  
                          (generate_nmc_filename_from_pair_for_participant pair p)
                          (generate_nmc_from_pair_for_participant prot pair p))
            transition_pairs 

let generate_scc_queries (prot: symbolic_protocol) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_scc_queries_for_participant prot p) participants 

let generate_nmc_queries (prot: symbolic_protocol) = 
  let participants = get_participants prot in 
  List.iter (fun p -> generate_nmc_queries_for_participant prot p) participants 

(* Main function currently tests one inductive predicate at a time *) 
let () =
  (* Figure11 protocol has 3 participants *)
  (* generate_scc_queries_for_participant figure11 "p";
  generate_scc_queries_for_participant figure11 "q"; 
  generate_scc_queries_for_participant figure11 "r";  *)
  generate_scc_queries figure11; 
  generate_nmc_queries figure11; 
  (* Send_validity_no protocol has 4 participants *)
  (* generate_scc_queries_for_participant send_validity_no "r"; *)
  (* generate_scc_queries_for_participant send_validity_no "s"; *)

  (* write_to_file "output.txt"  *)
    (* (unreach_for_participant_pair send_validity_no "r" "s") *)
    (* (generate_prodreach_for_participant send_validity_no "r") *)
    (* (generate_prodreach_for_participant figure11 "p") *)
    (* (unreach_for_participant_pair figure11 "p" "q") *)
    (* (generate_scc_from_transition_for_participant figure11 transition_01 "p") *)









