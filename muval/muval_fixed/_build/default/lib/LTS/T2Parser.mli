
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | TO
  | TIMES
  | SUBST
  | STRING
  | STORE_ARRAY
  | START
  | SKIP
  | SHL
  | SHADOW
  | SEMICOLON
  | SELECT_TUPLE
  | SELECT_ARRAY
  | RPAREN
  | REAL_TO_INT
  | PLUS
  | OR
  | NOT
  | NONDET
  | NEQ
  | MOD
  | MINUS
  | LT
  | LSHR
  | LPAREN
  | LEQ
  | INT_TO_REAL
  | INT of (int)
  | GT
  | GEQ
  | FROM
  | FLOAT of (Q.t)
  | ERROR
  | EQ
  | EOF
  | DIV
  | CUTPOINT
  | CONST_ARRAY
  | CONSTR_TUPLE
  | COMMA
  | COLON
  | CHAR of (char)
  | BITOR
  | BITAND
  | AT
  | ASSUME
  | ASHR
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Problem.lts)
