open Util
open Ast 
open Common 
open Prodreach
open Unreach
open Avail 
open Gclts
open Scc
open Nmc 
open Rcc 
open Printf
open Lexer 
open Parser 
open Visual
open Unix 
open Config
open Filename 
open Property_playground

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

let process_hes_file filename dirname timeout mode : string * float =
  (* Adding "> /dev/null 2>&1" to the end of this command breaks everything! *)
  (* Currently there is a bug in MuVal for the parallel_exc version of the tool, 
    which is sensitive to equation ordering for least fixpoints *)
  (* So we should use the parallel version until it is fixed *) 
  (* Update: found a bug in the parallel version as well *)
  let command = Printf.sprintf "timeout %i ./_build/default/main.exe -c ./config/solver/muval_%s_tbq_ar.json -p muclp %s/%s" timeout mode dirname filename in
  let start_time = Unix.gettimeofday () in
  (* Printf.printf "Checking %s \n" filename; *)
  flush Stdlib.stdout;
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
  | _ -> ("unexpected", execution_time) 
  
let process_directory dirname timeout mode : (string * string * float) list =
  let original_dir = Sys.getcwd () in
  Unix.chdir Config.coar_location; 
  let files = Sys.readdir dirname in
  let results = Array.fold_left (fun acc file -> if check_suffix file ".hes" 
                                                 then let (outcome, execution_time) = process_hes_file file dirname timeout mode in
                                                      (file, outcome, execution_time) :: acc
                                                 else acc) 
                                [] 
                                files in 
  Unix.chdir original_dir; 
  results

let process_directory_gclts dirname timeout mode : (string * string * float) list =
  let original_dir = Sys.getcwd () in
  Unix.chdir Config.coar_location; 
  let files = Sys.readdir dirname in
  let results = Array.fold_left (fun acc file -> if check_suffix file ".hes" 
                                                 then let (outcome, execution_time) = process_hes_file file dirname timeout mode in
                                                      (file, outcome, execution_time) :: acc
                                                 else acc) 
                                [] 
                                files in 
  Unix.chdir Config.coar_location; 
  results

let print_execution_time results : float =
  let sum = List.fold_left (fun acc (file, outcome, execution_time) -> acc +. execution_time) 0.0 results in 
  Printf.printf "\nResults:\n";
  Printf.printf "| %-30s | %-20s | %-10s |\n" "Filename" "Execution Time (s)" "Result";
  Printf.printf "|--------------------------------|----------------------|------------|\n";
  List.iter (fun (file, outcome, execution_time) ->
    Printf.printf "| %-30s | %-20.4f | %-10s |\n" 
      file 
      execution_time 
      outcome
  ) (List.rev results);
  Printf.printf "\nTotal time:%f\n" sum;
  sum 

let generate_gclts_queries (prot: symbolic_protocol) (dirname: string) = 
  generate_determinism_queries_vb prot dirname; 
  generate_deadlock_free_queries prot dirname 

let generate_implementability_queries_for_participant (prot: symbolic_protocol) (p: participant) (dirname: string) = 
  (* generate_scc_queries_for_participant_v3bb prot p dirname;  *)
  generate_rcc_queries_for_participant_v2b prot p dirname
  (* generate_nmc_queries_for_participant_v2b prot p dirname *)

let generate_implementability_queries (prot: symbolic_protocol) (dirname: string) (version: string) = 
  (* Currently the most optimized version *)
  match version with 
  | "v3bb" -> 
  generate_scc_queries_v3bb prot dirname;
  generate_rcc_queries_v2b prot dirname; 
  generate_nmc_queries_v2b prot dirname;
  | "v3b" -> 
  generate_scc_queries_v3b prot dirname;
  generate_rcc_queries_vb prot dirname; 
  generate_nmc_queries_vb prot dirname;
  | "v3a" -> 
  generate_scc_queries_v3a prot dirname;
  generate_rcc_queries_vb prot dirname; 
  generate_nmc_queries_vb prot dirname;
  | "v2b" -> 
  generate_scc_queries_v2b prot dirname;
  generate_rcc_queries_vb prot dirname; 
  generate_nmc_queries_vb prot dirname;
  | "v2a" -> 
  generate_scc_queries_v2a prot dirname;
  generate_rcc_queries_vb prot dirname; 
  generate_nmc_queries_vb prot dirname;
  | "v1b" -> 
  generate_scc_queries_v1b prot dirname;
  generate_rcc_queries_vb prot dirname; 
  generate_nmc_queries_vb prot dirname;
  | "v1a" -> 
  generate_scc_queries_v1a prot dirname;
  generate_rcc_queries prot dirname; 
  generate_nmc_queries prot dirname;
  | _ -> Printf.eprintf "Version invalid\n" 

let check_gclts (prot: symbolic_protocol) (dirname: string) (timeout: int) (mode: string) : (bool * float) = 
  Printf.printf "Checking GCLTS eligibility...\n";
  (* print_symbolic_protocol prot;  *)
  (* First do syntactic checks *)
  if (not (sender_driven prot))
  then (Printf.printf "Protocol is not sender-driven\n"; (false,0.0)) 
  else if (not (sink_final prot))
       then (Printf.printf "Protocol is not sink-final\n"; (false,0.0)) 
       else (let results = process_directory_gclts dirname timeout mode in 
            List.iter (fun (file, outcome, time) -> if outcome = "valid" then Printf.printf "%s violates GCLTS conditions\n" file) results;
            if List.for_all (fun (_, result, _) -> result = "invalid") results 
            then (Printf.printf "GCLTS eligible\n"; 
                  let sum = print_execution_time results in 
                  (true,sum))
            else if List.exists (fun (_, result, _) -> result = "valid") results 
                 then (Printf.printf "Protocol is GCLTS ineligible\n"; 
                       let sum = print_execution_time results in 
                        (false, sum))
                 else (Printf.printf "Inconclusive\n"; 
                       let sum = print_execution_time results in 
                       (false,sum)))

let check_implementability (prot: symbolic_protocol) (dirname: string) (timeout: int) (version: string) (mode: string) : float = 
  Printf.printf "\nChecking implementability...\n";
  (* print_symbolic_protocol prot;  *)
  if is_binary prot 
  then (Printf.printf "Binary protocol, implementable\n"; 0.0)
  else (generate_implementability_queries prot dirname version;
        let results = process_directory dirname timeout mode in 
        (* List.iter (fun (file, outcome, time) -> Printf.printf "%s: %s\n" file outcome) results; *)
        if List.for_all (fun (_, result, _) -> result = "invalid") results 
        then Printf.printf "Implementable\n" 
        else if List.exists (fun (_, result, _) -> result = "valid") results 
             then Printf.printf "Non-implementable\n" 
             else Printf.printf "Inconclusive\n";
        print_execution_time results)
        (* Note to self: no semi-colon after final statement! *)

let () =
  Logs.set_reporter (Logs.format_reporter ());
  if Array.length Sys.argv < 5 then
    Printf.eprintf "Usage: %s <input_file> <timeout> <version> <parallel | parallel_exc> \n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    let timeout = int_of_string Sys.argv.(2) in
    let version = Sys.argv.(3) in 
    let mode = Sys.argv.(4) in 
    if mode <> "parallel" && mode <> "parallel_exc" then 
    Printf.eprintf "Mode invalid \n" 
  else 
    try
      let protocol = parse_file filename in
      let current_dir = Sys.getcwd () in 
      let dirname = Filename.concat current_dir (filename ^ "-generated") in 
      let gclts_dirname = Filename.concat current_dir (filename ^ "-generated-gclts") in 
      let perm = 0o777 in 
      if create_newdir dirname perm && create_newdir gclts_dirname perm 
      then (store_visualization protocol dirname;
            (* to see visualization, run 
              dot -Tsvg visualization.dot > visualization.svg 
              in the respective folder and open svg-file *)
            generate_gclts_queries protocol gclts_dirname;
            let (is_gclts, gclts_time) = check_gclts protocol gclts_dirname timeout mode in 
            if is_gclts 
            then (let impl_time = check_implementability protocol dirname timeout version mode in 
                  (* Optionally generate property queries *)
                  (* generate_property_query protocol higher_lower_termination "termination_property" dirname; *)
                  Printf.eprintf "\nTotal verification time: %f\n" (Float.add gclts_time impl_time))
          else ();)
      else ();
    with
    | Sys_error s | Failure s | Invalid_argument s ->
      print_errors [Internal, Loc.dummy, s]
    | Error.Msg es ->
      print_errors es