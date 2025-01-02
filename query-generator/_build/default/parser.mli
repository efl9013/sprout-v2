
(* The type of tokens. *)

type token = 
  | TIMES
  | STATE of (int)
  | RPAREN
  | RBRACE
  | PLUS
  | NEQ
  | MINUS
  | LTE
  | LT
  | LPAREN
  | LBRACE
  | IDENT of (string)
  | GTE
  | GT
  | EQUALS
  | EOF
  | DIV
  | COLON
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
