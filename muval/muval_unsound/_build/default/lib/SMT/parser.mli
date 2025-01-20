
(* The type of tokens. *)

type token = 
  | RPAREN
  | LPAREN
  | EOF
  | ATOM of (string)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Sexplib0.Sexp.t list)
