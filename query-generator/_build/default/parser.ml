type token =
  | INT of (
# 13 "parser.mly"
        int
# 6 "parser.ml"
)
  | IDENT of (
# 14 "parser.mly"
        string
# 11 "parser.ml"
)
  | IDENT_PRIME of (
# 15 "parser.mly"
        string
# 16 "parser.ml"
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

open Parsing
let _ = parse_error;;
# 2 "parser.mly"
open Ast 

exception Parse_failure of string

let make_symbolic_transition pre sender receiver comm_var predicate post =
  { pre; sender; receiver; comm_var; predicate; post }

let make_symbolic_protocol states registers transitions initial_state initial_register_assignment final_states =
  { states; registers; transitions; initial_state; initial_register_assignment; final_states }
# 56 "parser.ml"
let yytransl_const = [|
  260 (* TRUE *);
  261 (* FALSE *);
  262 (* AND *);
  263 (* OR *);
  264 (* NOT *);
  265 (* EQUALS *);
  266 (* GT *);
  267 (* LT *);
  268 (* PLUS *);
  269 (* MINUS *);
  270 (* TIMES *);
  271 (* DIV *);
  272 (* LPAREN *);
  273 (* RPAREN *);
  274 (* LBRACE *);
  275 (* RBRACE *);
  276 (* COMMA *);
  277 (* COLON *);
  278 (* ARROW *);
    0 (* EOF *);
  279 (* NEWLINE *);
  280 (* PROTEOF *);
  281 (* INIT_HEADER *);
  282 (* FINAL_HEADER *);
  283 (* REGISTER_HEADER *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  259 (* IDENT_PRIME *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\003\000\003\000\003\000\004\000\005\000\
\005\000\006\000\007\000\007\000\007\000\008\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\000\000"

let yylen = "\002\000\
\013\000\001\000\003\000\000\000\001\000\003\000\003\000\000\000\
\003\000\014\000\000\000\003\000\003\000\003\000\001\000\001\000\
\003\000\003\000\003\000\003\000\003\000\002\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\031\000\000\000\000\000\000\000\
\000\000\003\000\000\000\000\000\000\000\005\000\000\000\000\000\
\000\000\007\000\006\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\012\000\000\000\013\000\000\000\
\000\000\000\000\001\000\000\000\014\000\000\000\023\000\024\000\
\025\000\015\000\016\000\000\000\000\000\000\000\000\000\022\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\030\000\020\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\028\000\029\000\000\000\010\000"

let yydgoto = "\002\000\
\005\000\007\000\013\000\014\000\021\000\022\000\031\000\039\000\
\054\000\055\000"

let yysindex = "\013\000\
\000\255\000\000\000\000\255\254\000\000\015\255\006\255\018\255\
\012\255\000\000\041\255\060\255\063\255\000\000\081\255\041\255\
\074\255\000\000\000\000\090\255\070\255\071\255\078\255\072\255\
\074\255\094\255\083\255\000\000\075\255\099\255\064\255\100\255\
\084\255\087\255\080\255\085\255\000\000\104\255\000\000\107\000\
\106\255\092\255\000\000\093\255\000\000\001\255\000\000\000\000\
\000\000\000\000\000\000\001\255\010\255\030\255\062\255\000\000\
\047\255\001\255\001\255\096\255\010\255\010\255\010\255\010\255\
\010\255\010\255\010\255\000\000\000\000\107\255\109\255\066\255\
\066\255\066\255\052\255\052\255\000\000\000\000\097\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\065\255\000\000\000\000\000\000\000\000\000\000\
\095\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\095\255\000\000\069\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\046\255\000\000\044\255\
\049\255\051\255\021\255\035\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\099\000\091\000\000\000\000\000\000\000\
\205\255\213\255"

let yytablesize = 118
let yytable = "\003\000\
\056\000\047\000\048\000\049\000\050\000\051\000\069\000\070\000\
\052\000\057\000\047\000\048\000\049\000\001\000\006\000\008\000\
\053\000\072\000\073\000\074\000\075\000\076\000\077\000\078\000\
\004\000\053\000\026\000\026\000\009\000\026\000\026\000\026\000\
\026\000\026\000\010\000\058\000\059\000\026\000\011\000\026\000\
\027\000\027\000\012\000\027\000\027\000\027\000\027\000\027\000\
\060\000\017\000\017\000\027\000\021\000\027\000\019\000\019\000\
\018\000\018\000\064\000\065\000\066\000\067\000\017\000\068\000\
\021\000\066\000\067\000\019\000\015\000\018\000\061\000\062\000\
\063\000\064\000\065\000\066\000\067\000\064\000\065\000\066\000\
\067\000\018\000\016\000\034\000\004\000\017\000\035\000\004\000\
\011\000\020\000\023\000\011\000\024\000\025\000\026\000\029\000\
\032\000\027\000\030\000\033\000\037\000\036\000\038\000\040\000\
\042\000\041\000\043\000\044\000\045\000\079\000\046\000\071\000\
\058\000\080\000\019\000\028\000\000\000\008\000"

let yycheck = "\000\001\
\052\000\001\001\002\001\003\001\004\001\005\001\058\000\059\000\
\008\001\053\000\001\001\002\001\003\001\001\000\016\001\001\001\
\016\001\061\000\062\000\063\000\064\000\065\000\066\000\067\000\
\025\001\016\001\006\001\007\001\023\001\009\001\010\001\011\001\
\012\001\013\001\017\001\006\001\007\001\017\001\027\001\019\001\
\006\001\007\001\002\001\009\001\010\001\011\001\012\001\013\001\
\019\001\006\001\007\001\017\001\007\001\019\001\006\001\007\001\
\006\001\007\001\012\001\013\001\014\001\015\001\019\001\017\001\
\019\001\014\001\015\001\019\001\009\001\019\001\009\001\010\001\
\011\001\012\001\013\001\014\001\015\001\012\001\013\001\014\001\
\015\001\001\001\020\001\020\001\020\001\023\001\023\001\023\001\
\020\001\016\001\001\001\023\001\023\001\023\001\017\001\002\001\
\022\001\026\001\016\001\001\001\017\001\002\001\016\001\024\001\
\001\001\021\001\000\000\002\001\017\001\001\001\018\001\016\001\
\006\001\017\001\016\000\025\000\255\255\023\001"

let yynames_const = "\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  NOT\000\
  EQUALS\000\
  GT\000\
  LT\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  COLON\000\
  ARROW\000\
  EOF\000\
  NEWLINE\000\
  PROTEOF\000\
  INIT_HEADER\000\
  FINAL_HEADER\000\
  REGISTER_HEADER\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  IDENT_PRIME\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 11 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 8 : (Ast.variable * int) list) in
    let _7 = (Parsing.peek_val __caml_parser_env 6 : Ast.symbolic_transition list) in
    let _10 = (Parsing.peek_val __caml_parser_env 3 : int list) in
    Obj.repr(
# 44 "parser.mly"
    ( make_symbolic_protocol 
        (List.sort_uniq compare (_2 :: [] @ (List.map (fun t -> t.Ast.pre) _7) @ (List.map (fun t -> t.Ast.post) _7)))
        (List.sort_uniq compare (List.map fst _5))
        _7
        _2
        _5
        [] )
# 232 "parser.ml"
               : Ast.symbolic_protocol))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
          ( raise (Parse_failure "CRASH!") )
# 238 "parser.ml"
               : Ast.symbolic_protocol))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 54 "parser.mly"
                      ( _2 )
# 245 "parser.ml"
               : int))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
                ( [] )
# 251 "parser.ml"
               : (Ast.variable * int) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.variable * int) in
    Obj.repr(
# 58 "parser.mly"
                        ( [_1] )
# 258 "parser.ml"
               : (Ast.variable * int) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : (Ast.variable * int) list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.variable * int) in
    Obj.repr(
# 59 "parser.mly"
                                                   ( _1 @ [_3] )
# 266 "parser.ml"
               : (Ast.variable * int) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 62 "parser.mly"
                     ( (_1, _3) )
# 274 "parser.ml"
               : Ast.variable * int))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "parser.mly"
                ( [] )
# 280 "parser.ml"
               : Ast.symbolic_transition list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.symbolic_transition) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.symbolic_transition list) in
    Obj.repr(
# 66 "parser.mly"
                                   ( _1 :: _3 )
# 288 "parser.ml"
               : Ast.symbolic_transition list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 12 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 10 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _8 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _10 = (Parsing.peek_val __caml_parser_env 4 : Ast.formula) in
    let _13 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 70 "parser.mly"
    ( make_symbolic_transition _2 _4 _6 _8 _10 _13 )
# 300 "parser.ml"
               : Ast.symbolic_transition))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
                ( [] )
# 306 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 74 "parser.mly"
                      ( [_2] )
# 313 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int list) in
    Obj.repr(
# 75 "parser.mly"
                                   ( _1 @ _3 )
# 321 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 78 "parser.mly"
                      ( [_2] )
# 328 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
         ( Ast.True )
# 334 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
          ( Ast.False )
# 340 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Ast.Eq(_1, _3) )
# 348 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 84 "parser.mly"
                 ( Ast.Lt(_1, _3) )
# 356 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 85 "parser.mly"
                 ( Ast.Gt(_1, _3) )
# 364 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.formula) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.formula) in
    Obj.repr(
# 86 "parser.mly"
                        ( Ast.And(_1, _3) )
# 372 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.formula) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.formula) in
    Obj.repr(
# 87 "parser.mly"
                       ( Ast.Or(_1, _3) )
# 380 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.formula) in
    Obj.repr(
# 88 "parser.mly"
                ( Ast.Not(_2) )
# 387 "parser.ml"
               : Ast.formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 91 "parser.mly"
        ( Ast.Const _1 )
# 394 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 92 "parser.mly"
          ( Ast.Var _1 )
# 401 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 93 "parser.mly"
                ( Ast.VarPrime _1 )
# 408 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 94 "parser.mly"
                   ( Ast.Plus(_1, _3) )
# 416 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 95 "parser.mly"
                    ( Ast.Minus(_1, _3) )
# 424 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 96 "parser.mly"
                    ( Ast.Times(_1, _3) )
# 432 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 97 "parser.mly"
                  ( Ast.Div(_1, _3) )
# 440 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 98 "parser.mly"
                       ( _2 )
# 447 "parser.ml"
               : Ast.expr))
(* Entry protocol *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let protocol (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.symbolic_protocol)
