{
open Parser
open Util
open Lexing

exception LexError of string

(* set file name *)
let set_file_name lexbuf name =
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = name }

let lexical_error lexbuf msg =
  let pos = lexeme_start_p lexbuf in
  let loc = Loc.make pos pos in
  Error.syntax_error loc msg

}


let digit = ['0'-'9']
let integer = digit+
let alpha = ['a'-'z' 'A'-'Z']
let identifier = alpha (alpha | digit | '_')*
let initial_state = "Initial state:"
let final_states = "Final states:"
let register_assignments = "Initial register assignments:"
let comment = "//" [^ '\n']* '\n'

rule token = parse
  | [' ' '\t' '\r']+        { token lexbuf }
  | comment                 { token lexbuf }
  | initial_state           { INIT_HEADER }
  | final_states            { FINAL_HEADER }
  | register_assignments    { REGISTER_HEADER }
  | '\n'                    { Lexing.new_line lexbuf; token lexbuf }
  | "True"                  { TRUE }
  | "False"                 { FALSE }
  | "/\\" | "and"           { AND }
  | "\\/" | "or"            { OR }
  | "~" | "not"             { NOT }
  | '='                     { EQUALS }
  | ">="                    { GEQ }
  | "<="                    { LEQ }
  | "!="                    { NEQ }
  | '<'                     { LT }
  | '>'                     { GT }
  | '+'                     { PLUS }
  | '-'                     { MINUS }
  | '*'                     { TIMES }
  | '/'                     { DIV }
  | '%'                     { MOD }
  | identifier as id        { IDENT id }
  | identifier as id "'"    { IDENT_PRIME id }
  | integer as num          { INT (int_of_string num) }
  | '('                     { LPAREN }
  | ')'                     { RPAREN }
  | '{'                     { LBRACE }
  | '}'                     { RBRACE }
  | ','                     { COMMA }
  | ':'                     { COLON }
  | "->"                    { ARROW }
  | eof                     { EOF }
  | _                       { lexical_error lexbuf "Unexpected character" }
