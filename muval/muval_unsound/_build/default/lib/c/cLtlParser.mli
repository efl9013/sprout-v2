
(* The type of tokens. *)

type token = 
  | X
  | WU
  | WHILE_TRUE
  | WHILE
  | VOLATILE
  | VOID
  | UNSIGNED
  | U
  | STRINGL of (string)
  | STATIC
  | SIZEOF
  | SEMI
  | RPAREN
  | RETURN
  | RBLOCK
  | R
  | PREDSYM of (Ast.LogicOld.pred_sym)
  | PLUSPLUS
  | OR
  | NOT
  | NORETURN
  | NONDET
  | MOD
  | MINUSMINUS
  | MINUS
  | MAIN
  | LTLDECLARE
  | LPAREN
  | LBLOCK
  | INTL of (int)
  | INT
  | IMPLY
  | IF
  | ID of (string)
  | GOTO
  | FOR
  | EXTERN
  | ERROR
  | EQUAL
  | EOF
  | ELSE
  | DO
  | DIV
  | DIAMOND
  | CORON
  | CONST
  | COMMA
  | BREAK
  | BOX
  | ATTRIBUTE
  | ASTERISK
  | ASSUME
  | AP
  | AND
  | ADDR
  | ADD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val toplevel: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (CSyntax.cltl * CSyntax.Define.t list * CSyntax.FunDecl.t list)
