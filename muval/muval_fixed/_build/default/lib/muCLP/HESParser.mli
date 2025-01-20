
(* The type of tokens. *)

type token = 
  | WHERE
  | TRUE
  | SEMI
  | RPAREN
  | REALL of (string)
  | REAL
  | PREDSYM of (Ast.LogicOld.pred_sym)
  | OR
  | NOT
  | MULT
  | MOD
  | MINUS
  | LPAREN
  | INTL of (int)
  | INT
  | IMPLY
  | IFF
  | ID of (string)
  | FALSE
  | EQFIX of (Ast.LogicOld.Predicate.fixpoint)
  | EOF
  | DOT
  | DIV
  | CORON
  | BOOL
  | BINDER of (Ast.LogicOld.Formula.binder)
  | AND
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Problem.t)

val formula: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Problem.query)
