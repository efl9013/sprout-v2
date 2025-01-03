{
open Parser
exception LexError of string
}

let digit = ['0'-'9']
let integer = digit+
let alpha = ['a'-'z' 'A'-'Z']
let identifier = alpha (alpha | digit | '_')*
let initial_state = "Initial state:"
let final_states = "Final states:"
let register_assignments = "Initial register assignments:"

rule token = parse
  | [' ' '\t' '\r']+        { token lexbuf }
  | initial_state           { INIT_HEADER }
  | final_states            { FINAL_HEADER }
  | register_assignments    { REGISTER_HEADER }
  | '\n'                    { NEWLINE }
  | "True"                  { TRUE }
  | "False"                 { FALSE }
  | "/\\" | "and"           { AND }
  | "\\/" | "or"            { OR }
  | "~" | "not"             { NOT }
  | '='                     { EQUALS }
  | '<'                     { LT }
  | '>'                     { GT }
  | '+'                     { PLUS }
  | '-'                     { MINUS }
  | '*'                     { TIMES }
  | '/'                     { DIV }
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
  | "EOF"                   { PROTEOF }
  | eof                     { EOF }
  | _                       { raise (LexError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
