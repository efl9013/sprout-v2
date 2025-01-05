open Util
open Ast 
open Common 
open Prodreach
open Unreach
open Avail 
open Scc
open Nmc 
open Rcc 
open Printf
open Lexer 
open Parser 

let send_validity_yes : symbolic_protocol = {
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
      predicate = Eq (Var "v", Const 2); 
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

let figure11_repaired : symbolic_protocol = {
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
      predicate = And(And(Gt(Var "v", Var "ry"), Eq(Var "rx'", Var "rx")), Eq(Var "ry'", Var "ry"));
      post = 3;
    };
  ];
  initial_state = 0;
  initial_register_assignment = [("rx", 0); ("ry", 0)];
  final_states = [3];
}

let receive_validity_no : symbolic_protocol = {
  states = [0; 1; 2; 3; 4; 5; 6];
  registers = [];
  transitions = [
    {
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = Eq(Var "v", Const 1);
      post = 1;
    };
    {
      pre = 1;
      sender = "q";
      receiver = "r";
      comm_var = "v";
      predicate = True;
      post = 2;
    };
    {
      pre = 2;
      sender = "p";
      receiver = "r";
      comm_var = "v";
      predicate = True;
      post = 3;
    };
    {
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = Eq(Var "v", Const 2);
      post = 4;
    };
    {
      pre = 4;
      sender = "p";
      receiver = "r";
      comm_var = "v";
      predicate = True;
      post = 5;
    };
    {
      pre = 5;
      sender = "q";
      receiver = "r";
      comm_var = "v";
      predicate = True;
      post = 6;
    };
  ];
  initial_state = 0;
  initial_register_assignment = [];
  final_states = [3; 6];
}



let parse_file filename =
  let channel = open_in filename in
  let lexbuf = Lexing.from_channel channel in
  let _ = Lexer.set_file_name lexbuf filename in
  try
    let result = Parser.protocol Lexer.token lexbuf in
    close_in channel;
    result
  with
  | Parser.Error ->
    let err_pos = lexbuf.lex_curr_p in
    Error.syntax_error (Loc.make err_pos err_pos) "Parse error"
  | Parsing.Parse_error ->
      let pos = lexbuf.lex_curr_p in
      Printf.eprintf "Parse error at line %d, character %d: Unexpected token '%s'\n"
        pos.pos_lnum (pos.pos_cnum - pos.pos_bol) (Lexing.lexeme lexbuf);
      close_in channel;
      failwith ("Parsing error in file")
  | Lexer.LexError msg ->
      let pos = lexbuf.lex_curr_p in
      Printf.eprintf "Lexing error at line %d, character %d: %s\n"
        pos.pos_lnum (pos.pos_cnum - pos.pos_bol) msg;
      close_in channel;
      failwith ("Lexing error in file")
(* 
let parse_file filename =
  let channel = open_in filename in
  try
    let lexbuf = Lexing.from_channel channel in
    let result = Parser.protocol Lexer.token lexbuf in
    close_in channel;
    result
  with
  | Parsing.Parse_error ->
      close_in channel;
      failwith ("Parse error in file: " ^ filename)
  | e ->
      close_in channel;
      raise e
 *)

let print_errors errs =
  List.iter (fun e -> Logs.err (fun m -> m !"%{Error}" e)) errs;
  Logs.debug (fun m ->
      let bs = Printexc.get_backtrace () in
      m "\n---------\n%s" bs);
  Stdlib.exit 1 (* duplicates error output: `Error (false, "") *)

let () =
  Logs.set_reporter (Logs.format_reporter ());
  if Array.length Sys.argv < 2 then
    Printf.eprintf "Usage: %s <input_file>\n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    try
      (*print_endline (string_of_blocked_set ["r"; "s"; "p"]); *)
      let protocol = parse_file filename in
  (* Figure11 protocol has 3 participants *)
  (* generate_scc_queries_for_participant figure11 "p";
  generate_scc_queries_for_participant figure11 "q"; 
  generate_scc_queries_for_participant figure11 "r";  *)
      let dirname = filename ^ "-generated" in 
      let perm = 0o777 in 
      create_newdir dirname perm; 
      generate_scc_queries protocol dirname; 
      generate_rcc_queries protocol  dirname;
      generate_nmc_queries protocol dirname; 
    with
    | Sys_error s | Failure s | Invalid_argument s ->
      print_errors [Internal, Loc.dummy, s]
    | Error.Msg es ->
      print_errors es
(*   create_newdir "figure11" 0o777;
  generate_rcc_queries figure11 "figure11"; *)
  (* generate_rcc_queries send_validity_no;  *)
  (* Send_validity_no protocol has 4 participants *)
  (* generate_scc_queries_for_participant send_validity_no "r"; *)
  (* generate_scc_queries_for_participant send_validity_no "s"; *)

  (* write_to_file "output.txt"  *)
    (* (unreach_for_participant_pair send_validity_no "r" "s") *)
    (* (generate_prodreach_for_participant send_validity_no "r") *)
    (* (generate_prodreach_for_participant figure11 "p") *)
    (* (unreach_for_participant_pair figure11 "p" "q") *)
    (* (generate_scc_from_transition_for_participant figure11 transition_01 "p") *)









