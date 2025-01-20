
(* The type of tokens. *)

type token = 
  | WILDCARD
  | VERT
  | ToReal
  | ToInt
  | TYPEOF
  | TRUE
  | SUBTYPE
  | SUB
  | SQRT
  | SEMPTY
  | SEMICOLON
  | RTRI
  | RPAREN
  | RECOGNIZER of (string)
  | RBRA
  | QUESTION
  | PROJ
  | PLUSPLUS
  | OR
  | NOTEQUAL
  | NOT
  | MOD
  | MINIMIZE
  | MAXIMIZE
  | LT
  | LPAREN
  | LEQ
  | LBRA
  | INT of (int)
  | INFEFFECTOF
  | IN
  | IMP
  | IFF
  | IDENT_T of (string)
  | IDENT of (string)
  | GT
  | GEQ
  | FSUB
  | FORALL
  | FMUL
  | FLOAT of (float)
  | FINEFFECTOF
  | FDIV
  | FALSE
  | FADD
  | EXISTS
  | EXC
  | EVENT
  | EQUAL
  | EPSILON
  | EOF
  | DOT
  | DIV
  | CONST of (string)
  | COMMA
  | COLON
  | COLCOL
  | BOOL of (bool)
  | AST
  | ARROW
  | APPLY
  | AND
  | AMP
  | ADD
  | ACCESSOR of (string * int)
  | ABS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val val_ty_env: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Rtype.env)

val opt_problems: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((Ident.tvar * (Ident.tvar * Assertion.direction) list *
   (Ident.tvar * SolSpace.space_flag * int) list)
  list)

val formula: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (LogicOld.Formula.t)

val constraints: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (LogicOld.Formula.t list)

val comp_ty: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (LogicOld.sort_env_map -> Rtype.c)

val assertions: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((Ident.tvar * Assertion.t) list)
