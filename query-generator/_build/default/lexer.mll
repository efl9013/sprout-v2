(* File: lexer.mll *)

{
  open Parser
  exception LexError of string
  let line_num = ref 1
}

(* Naming regular expressions *)
let digit = ['0'-'9']
let participant = ['p' 'q' 'r' 's' 't']
let nat = digit+
let integer = '-'? digit+
let whitespace = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"
let identifier = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

let state = '(' nat ')'

rule token = parse
  | whitespace    { token lexbuf }
  | newline       { incr line_num; token lexbuf }
  | '('           { LPAREN }
  | ')'           { RPAREN }
  | integer as i  { STATE (int_of_string i) }
  | "->"          { ARROW }
  | ':'           { COLON }
  | '{'           { LBRACE }
  | '}'           { RBRACE }
  | '='           { EQUALS }
  | "'"           { PRIME }
  | '+'           { PLUS }
  | '-'           { MINUS }
  | '*'           { TIMES }
  | '/'           { DIV }
  | "!="          { NEQ }
  | '<'           { LT }
  | "<="          { LTE }
  | '>'           { GT }
  | ">="          { GTE }
  | "/\\"         { AND }
  | "\\/"         { OR }
  | identifier as id { IDENT id }
  | eof           { EOF }
  | _ as c        { raise (LexError (Printf.sprintf "Unexpected character: %c at line %d" c !line_num)) }
