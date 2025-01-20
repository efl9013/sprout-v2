
(* The type of tokens. *)

type token = 
  | TRUE
  | SKIP
  | SEMI
  | RPAREN
  | RBLOCK
  | OR
  | NOT
  | NEVER
  | LPAREN
  | LBLOCK
  | IF
  | ID of (string)
  | GOTO
  | FI
  | FALSE
  | EOF
  | CORONCORON
  | CORON
  | ARROW
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((string * string * Ast.LogicOld.Formula.t) list)
