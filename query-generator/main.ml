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

let process_hes_file filename dirname timeout =
  Unix.chdir "/Users/elaineli/Programs/coar";
  (* Adding "> /dev/null 2>&1" to the end of this command breaks everything! *)
  let command = Printf.sprintf "timeout %i dune exec main -- -c ./config/solver/dbg_muval_parallel_exc_tbq_ar.json -p muclp ../gclts-checker/query-generator/%s/%s" timeout dirname filename in
  let start_time = Unix.gettimeofday () in
  let ic = Unix.open_process_in command in
  let rec read_last_line last_line =
    try
      let line = input_line ic in
      read_last_line line
    with End_of_file -> last_line
  in
  let last_line = read_last_line "" in
  let exit_status = Unix.close_process_in ic in
  let end_time = Unix.gettimeofday () in
  let execution_time = end_time -. start_time in
  match exit_status with
  | Unix.WEXITED n when n = 124 -> ("timeout", execution_time)
  | Unix.WEXITED _ -> 
      if is_substring "invalid" last_line 
      then ("invalid", execution_time)
      else if is_substring "valid" last_line 
           then ("valid", execution_time)
         else ("unexpected", execution_time)
  | _ -> ("unexpected", execution_time) (* Handle unexpected exit statuses gracefully *)

let process_directory path dirname timeout : (string * string * float) list =
  let files = Sys.readdir path in
  Array.fold_left (fun acc file ->
    if check_suffix file ".hes" then
      let (outcome, execution_time) = process_hes_file file dirname timeout in
      (file, outcome, execution_time) :: acc
    else acc
  ) [] files

let print_total_execution_time results = 
  let sum = List.fold_left (fun acc (file, outcome, execution_time) -> acc +. execution_time) 0.0 results in 
  Printf.printf "\nTotal time:%f\n" sum

let print_execution_time_table results =
  Printf.printf "\nResults:\n";
  Printf.printf "| %-30s | %-20s | %-10s |\n" "Filename" "Execution Time (s)" "Result";
  Printf.printf "|--------------------------------|----------------------|------------|\n";
  List.iter (fun (file, outcome, execution_time) ->
    Printf.printf "| %-30s | %-20.4f | %-10s |\n" 
      file 
      execution_time 
      outcome
  ) (List.rev results)

let check_protocol (prot: symbolic_protocol) (dirname: string) (timeout: int) : unit = 
  Printf.printf "Checking implementability of the following protocol: \n";
  print_symbolic_protocol prot; 
  let perm = 0o777 in 
  create_newdir dirname perm; 
  (* generate_scc_queries_altogether prot dirname;  *)
  (* generate_rcc_queries prot dirname; *)
  generate_nmc_queries prot dirname;
  let path = dirname in 
  let results = process_directory path dirname timeout in 
  List.iter (fun (file, outcome, time) ->
    Printf.printf "%s: %s\n" file outcome
  ) results;
  if List.for_all (fun (_, result, _) -> result = "invalid") results 
  then Printf.printf "Implementable\n" 
  else if List.exists (fun (_, result, _) -> result = "valid") results 
       then Printf.printf "Non-implementable\n" 
       else Printf.printf "Inconclusive\n";
  print_execution_time_table results;
  print_total_execution_time results 
  (* Note to self: no semi-colon after final statement! *)

let () =
  Logs.set_reporter (Logs.format_reporter ());
  if Array.length Sys.argv < 3 then
    Printf.eprintf "Usage: %s <input_file> <timeout>\n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    let timeout = int_of_string Sys.argv.(2) in
    try
      let protocol = parse_file filename in
      let dirname = filename ^ "-generated" in 
      let perm = 0o777 in 
      check_protocol protocol dirname timeout; 
      (* print_simultaneously_reachable_states_for protocol "q"; *)
    with
    | Sys_error s | Failure s | Invalid_argument s ->
      print_errors [Internal, Loc.dummy, s]
    | Error.Msg es ->
      print_errors es