
(* The type of tokens. *)

type token = 
  | UIDENT of (string)
  | TYPE
  | RPAREN
  | RBRACKET
  | QUESTION
  | LPAREN
  | LIDENT of (string)
  | LBRACKET
  | EQUAL
  | EOF
  | COMMA
  | BAR
  | AST

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val regtreeexpdefs: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((string * (string, string) RegTreeExp.t) list)
