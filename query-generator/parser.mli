type token =
  | INT of (
# 13 "parser.mly"
        int
# 6 "parser.mli"
)
  | IDENT of (
# 14 "parser.mly"
        string
# 11 "parser.mli"
)
  | IDENT_PRIME of (
# 15 "parser.mly"
        string
# 16 "parser.mli"
)
  | TRUE
  | FALSE
  | AND
  | OR
  | NOT
  | EQUALS
  | GT
  | LT
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | COLON
  | ARROW
  | EOF
  | NEWLINE
  | PROTEOF
  | INIT_HEADER
  | FINAL_HEADER
  | REGISTER_HEADER

val protocol :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.symbolic_protocol
