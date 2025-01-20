
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | TRUE
  | TOP
  | TIMES
  | RPAREN
  | QUERY
  | PVAR of (string)
  | PLUS
  | OR
  | NOTEQ
  | NOT
  | MOD
  | MINUS
  | LT
  | LPAREN
  | LEQ
  | INT of (Z.t)
  | GT
  | GEQ
  | FALSE
  | EXISTS
  | EQ
  | EOF
  | DOT
  | DIV
  | DECLARE
  | COMMA
  | COLON
  | BOT
  | BOOL
  | ASSUME
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val parser_main_logic_program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t) list)
