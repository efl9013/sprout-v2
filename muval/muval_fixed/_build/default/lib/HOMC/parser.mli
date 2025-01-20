
(* The type of tokens. *)

type token = 
  | UIDENT of (string)
  | TRUE
  | RPAREN
  | PERIOD
  | OR
  | OF
  | MINUS_RANGLE
  | LPAREN
  | LIDENT of (string)
  | INT of (int)
  | GEN
  | FALSE
  | EQUAL_RANGLE
  | EQUAL
  | EOF
  | ENDT
  | ENDR
  | ENDG
  | ENDATA
  | ENDA
  | COPY
  | COMMA
  | COLON
  | COERCE
  | CASE
  | BEGINT
  | BEGINR
  | BEGING
  | BEGINATA
  | BEGINA
  | BAR
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val typedefs: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((Ast.Ident.tvar * Ast.Ident.tvar RefType.t) list)

val tta_transitions: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Automata.TTA.pre_trs)

val tree_automata: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Automata.TreeAutomaton.t)

val rules: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (EHMTT.t)

val hors: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (EHMTT.t * Automata.TreeAutomaton.t)

val hmtt: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (EHMTT.t * Automata.TTA.pre_trs *
  (Ast.Ident.tvar * Ast.Ident.tvar RefType.t))
