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
open Mb_rcc 
open Sb_rcc 
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

let process_protocol filename : symbolic_protocol * bool = 
  let prot = parse_file filename in 
  if check_no_disallowed_var_names_in_protocol prot 
  then (add_unmentioned_equalities prot, true)
  else (prot, false)


let process_hes_file_mode filename dirname timeout mode : string * float =
  let command = Printf.sprintf "timeout %i ./_build/default/main.exe -c ./config/solver/muval_%s_tbq_ar.json -p muclp %s/%s" timeout mode dirname filename in
  (* For making Docker image *) 
  (* let command = Printf.sprintf "timeout %i ./main.exe -c ./solver/muval_parallel_tbq_ar.json -p muclp %s/%s" timeout dirname filename in *)
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

(* An optimized strategy for calling MuVal on individual instances *)
(* In general the parallel mode is faster on most queries *)
let process_hes_file_opt filename dirname timeout mode : string * float =
  let parallel_timeout = timeout / 2 in 
  let command = Printf.sprintf "timeout %i ./_build/default/main.exe -c ./config/solver/muval_parallel_tbq_ar.json -p muclp %s/%s" parallel_timeout dirname filename in
  (* For making Docker image *) 
  (* let command = Printf.sprintf "timeout %i ./main.exe -c ./solver/muval_parallel_tbq_ar.json -p muclp %s/%s" parallel_timeout dirname filename in *)
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
  | Unix.WEXITED n when n = 124 -> process_hes_file_mode filename dirname parallel_timeout "parallel_exc"
  | Unix.WEXITED _ -> 
      if is_substring "invalid" last_line 
      then ("invalid", execution_time)
      else if is_substring "valid" last_line 
           then ("valid", execution_time)
         else ("unexpected", execution_time)
  | _ -> ("unexpected", execution_time) 


let process_hes_file_naive filename dirname timeout mode : string * float =
  process_hes_file_mode filename dirname timeout mode 

let process_directory dirname timeout version mode : (string * string * float) list =
  let original_dir = Sys.getcwd () in
  Unix.chdir Config.coar_location; 
  let files = Sys.readdir dirname in
  let results = Array.fold_left (fun acc file -> if check_suffix file ".hes" 
                                                 then (if version = "naive" 
                                                       then (let (outcome, execution_time) = process_hes_file_naive file dirname timeout mode in
                                                            (file, outcome, execution_time) :: acc)
                                                        else (let (outcome, execution_time) = process_hes_file_opt file dirname timeout mode in
                                                            (file, outcome, execution_time) :: acc))
                                                 else acc) 
                                [] 
                                files in 
  Unix.chdir original_dir; 
  results

let process_directory_gclts dirname timeout version mode : (string * string * float) list =
  let original_dir = Sys.getcwd () in
  Unix.chdir Config.coar_location; 
  let files = Sys.readdir dirname in
  let results = Array.fold_left (fun acc file -> if check_suffix file ".hes" 
                                                 then (if version = "naive" 
                                                      then (let (outcome, execution_time) = process_hes_file_naive file dirname timeout mode in
                                                           (file, outcome, execution_time) :: acc)
                                                      else (let (outcome, execution_time) = process_hes_file_opt file dirname timeout mode in
                                                            (file, outcome, execution_time) :: acc))
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
  Printf.printf "\nTotal time:%fs\n" sum;
  sum 

let generate_gclts_queries (prot: symbolic_protocol) (dirname: string) (version: string) = 
  match version with 
  | "opt" -> 
  generate_determinism_queries_v1b prot dirname; 
  generate_deadlock_free_queries_v1b prot dirname 
  | "naive" -> 
  generate_determinism_queries_v1b prot dirname; 
  generate_deadlock_free_queries_v1b prot dirname 
  | "espresso" -> 
  generate_determinism_queries_v2b prot dirname; 
  generate_deadlock_free_queries_v2b prot dirname 
  | "v60" -> 
  generate_determinism_queries_v1b prot dirname; 
  generate_deadlock_free_queries_v2b prot dirname 
  | "chemex" -> 
  generate_determinism_queries_v1b prot dirname; 
  generate_deadlock_free_queries_v1b prot dirname 
  | "coldbrew" -> 
  generate_determinism_queries_v1b prot dirname; 
  generate_deadlock_free_queries_v1b prot dirname 
  | _ -> Printf.eprintf "Version invalid\n" 

let generate_implementability_queries (prot: symbolic_protocol) (dirname: string) (version: string) = 
  match version with 
  | "opt" -> 
  generate_scc_queries_opt prot dirname;
  generate_mb_rcc_queries_opt prot dirname; 
  generate_nmc_queries_opt prot dirname;
  | "naive" -> 
  generate_scc_queries_naive prot dirname;
  generate_mb_rcc_queries_naive prot dirname; 
  generate_nmc_queries_naive prot dirname;
  (* Further versions with more fine-grained differences *)
  | "espresso" -> 
  generate_scc_queries_v3bb prot dirname;
  generate_mb_rcc_queries_v2b prot dirname; 
  generate_nmc_queries_v2b prot dirname;
  | "v60" -> 
  generate_scc_queries_v2ab prot dirname;
  generate_mb_rcc_queries_v2b prot dirname; 
  generate_nmc_queries_v2b prot dirname;
  | "chemex" -> 
  generate_scc_queries_v2ab prot dirname;
  generate_mb_rcc_queries_v2b prot dirname; 
  generate_nmc_queries_v1b prot dirname;
  | "coldbrew" -> 
  generate_scc_queries_v1ab prot dirname;
  generate_mb_rcc_queries_v1b prot dirname; 
  generate_nmc_queries_v1b prot dirname;
  | _ -> Printf.eprintf "Version invalid\n" 

type result = Yes | No | Inconclusive 
let result_to_string res = 
  match res with 
  | Yes -> "implementable"
  | No -> "non-implementable"
  | Inconclusive -> "inconclusive"

let check_gclts (prot: symbolic_protocol) (dirname: string) (timeout: int) (version: string) (mode: string) : (result * float) = 
  Printf.printf "Checking GCLTS eligibility...\n";
  (* print_symbolic_protocol prot;  *)
  (* First do syntactic checks *)
  if (not (sender_driven prot))
  then (Printf.printf "Protocol is not sender-driven\n"; (No,0.0)) 
  else if (not (sink_final prot))
       then (Printf.printf "Protocol is not sink-final\n"; (No,0.0)) 
       else (let results = process_directory_gclts dirname timeout version mode in 
            List.iter (fun (file, outcome, time) -> if outcome = "valid" then Printf.printf "%s violates GCLTS conditions\n" file) results;
            if List.for_all (fun (_, result, _) -> result = "invalid") results 
            then (Printf.printf "GCLTS eligible\n"; 
                  let sum = print_execution_time results in 
                  (Yes,sum))
            else if List.exists (fun (_, result, _) -> result = "valid") results 
                 then (Printf.printf "Protocol is GCLTS ineligible\n"; 
                       let sum = print_execution_time results in 
                        (No, sum))
                 else (Printf.printf "Inconclusive\n"; 
                       let sum = print_execution_time results in 
                       (Inconclusive,sum)))

let result_to_string_gclts res = 
  match res with 
  | Yes -> "implementable"
  | No -> "gclts-ineligible"
  | Inconclusive -> "inconclusive"


let check_implementability (prot: symbolic_protocol) (dirname: string) (timeout: int) (version: string) (mode: string) : (result*float) = 
  Printf.printf "\nChecking implementability...\n";
  (* print_symbolic_protocol prot;  *)
  if is_binary prot 
  then (Printf.printf "Implementable (binary)\n"; (Yes,0.0))
  else (generate_implementability_queries prot dirname version;
        let results = process_directory dirname timeout version mode in 
        (* List.iter (fun (file, outcome, time) -> Printf.printf "%s: %s\n" file outcome) results; *)
        if List.for_all (fun (_, result, _) -> result = "invalid") results 
        then (Printf.printf "Implementable\n"; (Yes, print_execution_time results))
        else if List.exists (fun (_, result, _) -> result = "valid") results 
             then (Printf.printf "Non-implementable\n"; (No, print_execution_time results))
             else (Printf.printf "Inconclusive\n"; (Inconclusive, print_execution_time results)))
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
      (* let protocol = parse_file filename in *)
      let (protocol,b) = process_protocol filename in 
      if b then 
      (let current_dir = Sys.getcwd () in 
      let dirname = Filename.concat current_dir (filename ^ "-generated") in 
      let gclts_dirname = Filename.concat current_dir (filename ^ "-generated-gclts") in 
      let perm = 0o777 in 
      if create_newdir dirname perm && create_newdir gclts_dirname perm 
      then (store_visualization protocol dirname;
            (* to see visualization, run 
              dot -Tsvg visualization.dot > visualization.svg 
              in the respective folder and open svg-file *)
            generate_gclts_queries protocol gclts_dirname version;
            let (gclts_res, gclts_time) = check_gclts protocol gclts_dirname timeout version mode in 
            if gclts_res = Yes 
            then ((* Optionally generate property queries *)
                  (* generate_property_query protocol higher_lower_termination "termination_property" dirname; *)
                  let (res, impl_time) = check_implementability protocol dirname timeout version mode in 
                  Printf.printf "\nTotal verification time: %fs, %s\n" (Float.add gclts_time impl_time) (result_to_string res))
            else (Printf.printf "\nTotal verification time: %fs, %s\n" (Float.add gclts_time gclts_time) (result_to_string_gclts gclts_res));)
      else ();)
    else Printf.eprintf "Protocol not well-formed, terminating.\n"
    with
    | Sys_error s | Failure s | Invalid_argument s ->
      print_errors [Internal, Loc.dummy, s]
    | Error.Msg es ->
      print_errors es

