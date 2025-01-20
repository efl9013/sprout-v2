
(* The type of tokens. *)

type token = 
  | WHILE
  | VOID
  | UNSIGNED
  | STRING of (string)
  | SHARPINCLUDE
  | SHARPDEFINE
  | SEMI
  | RPAREN
  | RETURN
  | RBLOCK
  | PREDSYM of (Ast.LogicOld.pred_sym)
  | PLUSPLUS
  | PHI
  | OR
  | NOT
  | NONDET
  | MOD
  | MINUSMINUS
  | MINUS
  | MAIN
  | LPAREN
  | LNONDET
  | LBLOCK
  | INTL of (int)
  | INT
  | INIT
  | IF
  | ID of (string)
  | EQUAL
  | EOF
  | ELSE
  | DOCHECK
  | DIV
  | CORON
  | COR
  | COMMA
  | CIMP
  | CEG
  | CEF
  | CAP
  | CAND
  | CAG
  | CAF
  | BREAK
  | BODY
  | ASTERISK
  | ASSUME
  | AND
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (CSyntax.cctl * CSyntax.Define.t list * CSyntax.FunDecl.t list)
