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
open Unix 
open Filename 

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
      predicate = Eq (Var "v", Const 1); 
      post = 2
    };
    {
      pre = 3;
      sender = "r";
      receiver = "s";
      comm_var = "v";
      predicate = Eq (Var "v", Const 1); 
      post = 4
    }
  ];
  initial_state = 0;
  initial_register_assignment = [];
  final_states = []
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
  final_states = []
}

(* Realized that this hardcoded example actually does not handle primed variables in the right way! *)
(* let figure11 : symbolic_protocol = {
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
} *)

let figure11 : symbolic_protocol = {
  states = [0; 1; 2; 3];
  registers = ["rx"; "ry"];
  transitions = [
    { 
      pre = 0;
      sender = "p";
      receiver = "q";
      comm_var = "v";
      predicate = And(Eq(VarPrime "rx", Var "v"), Eq(VarPrime "ry", Var "ry"));
      post = 1;
    };
    {
      pre = 1;
      sender = "q";
      receiver = "r";
      comm_var = "v";
      predicate = And(And(Eq(VarPrime "ry", Var "v"), Gt(Var "v", Var "rx")), Eq(VarPrime "rx", Var "rx"));
      post = 2;
    };
    {
      pre = 2;
      sender = "r";
      receiver = "p";
      comm_var = "v";
      predicate = And(And(Gt(Var "v", Var "rx"), Eq(VarPrime "rx", Var "rx")), Eq(VarPrime "ry", Var "ry"));
      post = 3;
    };
  ];
  initial_state = 0;
  initial_register_assignment = [("rx", 0); ("ry", 0)];
  final_states = [];
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
  final_states = [];
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

let print_errors errs =
  List.iter (fun e -> Logs.err (fun m -> m !"%{Error}" e)) errs;
  Logs.debug (fun m ->
      let bs = Printexc.get_backtrace () in
      m "\n---------\n%s" bs);
  Stdlib.exit 1 (* duplicates error output: `Error (false, "") *)

let is_substring sub str =
  let sub_len = String.length sub in
  let str_len = String.length str in
  let rec check i =
    if i > str_len - sub_len then false
    else if String.sub str i sub_len = sub then true
    else check (i + 1)
  in
  check 0

let process_hes_file filename dirname =
  Unix.chdir "/Users/elaineli/Programs/coar";
  let command = Printf.sprintf "dune exec main -- -c ./config/solver/dbg_muval_parallel_exc_tbq_ar.json -p muclp ../gclts-checker/query-generator/%s/%s" dirname filename in
  let ic = Unix.open_process_in command in
  let rec read_last_line last_line =
    try
      let line = input_line ic in
      read_last_line line
    with End_of_file -> last_line
  in
  let last_line = read_last_line "" in
  let _ = Unix.close_process_in ic in
  is_substring "invalid" last_line

let process_directory path dirname =
  let files = Sys.readdir path in
  Array.fold_left (fun acc file ->
    if check_suffix file ".hes" then
      (file, process_hes_file file dirname) :: acc
    else acc
  ) [] files

let check_protocol (prot: symbolic_protocol) (dirname: string) : unit = 
  Printf.printf "Checking implementability of the following protocol: \n";
  print_symbolic_protocol prot; 
  let perm = 0o777 in 
  create_newdir dirname perm; 
  generate_scc_queries prot dirname; 
  generate_rcc_queries prot dirname;
  generate_nmc_queries prot dirname;
  let path = dirname in 
  let results = process_directory path dirname in 
  List.iter (fun (file, contains_invalid) ->
    Printf.printf "%s: %s\n" file (if contains_invalid then "" else "violates implementability!")
  ) results
  (* Note to self: no semi-colon after final statement! *)

let () =
  Logs.set_reporter (Logs.format_reporter ());
  if Array.length Sys.argv < 2 then
    Printf.eprintf "Usage: %s <input_file>\n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    try
      let protocol = parse_file filename in
      let dirname = filename ^ "-generated" in 
      let perm = 0o777 in 
      check_protocol protocol dirname; 
    with
    | Sys_error s | Failure s | Invalid_argument s ->
      print_errors [Internal, Loc.dummy, s]
    | Error.Msg es ->
      print_errors es