
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR of (
# 10 "lib/pCSP/LPParser.mly"
       (string)
# 15 "lib/pCSP/LPParser.ml"
  )
    | TRUE
    | TOP
    | TIMES
    | RPAREN
    | QUERY
    | PVAR of (
# 11 "lib/pCSP/LPParser.mly"
       (string)
# 25 "lib/pCSP/LPParser.ml"
  )
    | PLUS
    | OR
    | NOTEQ
    | NOT
    | MOD
    | MINUS
    | LT
    | LPAREN
    | LEQ
    | INT of (
# 9 "lib/pCSP/LPParser.mly"
       (Z.t)
# 39 "lib/pCSP/LPParser.ml"
  )
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
  
end

include MenhirBasics

# 1 "lib/pCSP/LPParser.mly"
  
  open Ast
  open Ast.LogicOld

  (* Logic Program Parser *)

# 68 "lib/pCSP/LPParser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: parser_main_logic_program. *)

  | MenhirState07 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_QUERY, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 07.
        Stack shape : QUERY.
        Start symbol: parser_main_logic_program. *)

  | MenhirState10 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_PVAR, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 10.
        Stack shape : PVAR.
        Start symbol: parser_main_logic_program. *)

  | MenhirState12 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_MINUS, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 12.
        Stack shape : MINUS.
        Start symbol: parser_main_logic_program. *)

  | MenhirState13 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_LPAREN, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 13.
        Stack shape : LPAREN.
        Start symbol: parser_main_logic_program. *)

  | MenhirState17 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 17.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState20 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 20.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState22 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 22.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState24 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 24.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState26 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 26.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState32 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 32.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState36 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_NOT, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 36.
        Stack shape : NOT.
        Start symbol: parser_main_logic_program. *)

  | MenhirState37 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_LPAREN, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 37.
        Stack shape : LPAREN.
        Start symbol: parser_main_logic_program. *)

  | MenhirState40 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 40.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState42 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 42.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState44 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 44.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState46 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 46.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState48 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 48.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState50 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_term, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 50.
        Stack shape : term.
        Start symbol: parser_main_logic_program. *)

  | MenhirState54 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_atom, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 54.
        Stack shape : atom.
        Start symbol: parser_main_logic_program. *)

  | MenhirState57 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_atom, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 57.
        Stack shape : atom.
        Start symbol: parser_main_logic_program. *)

  | MenhirState66 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_atom, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 66.
        Stack shape : atom.
        Start symbol: parser_main_logic_program. *)

  | MenhirState68 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_EXISTS, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 68.
        Stack shape : EXISTS.
        Start symbol: parser_main_logic_program. *)

  | MenhirState70 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_VAR, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 70.
        Stack shape : VAR.
        Start symbol: parser_main_logic_program. *)

  | MenhirState73 : ((('s, _menhir_box_parser_main_logic_program) _menhir_cell1_EXISTS, _menhir_box_parser_main_logic_program) _menhir_cell1_vars, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 73.
        Stack shape : EXISTS vars.
        Start symbol: parser_main_logic_program. *)

  | MenhirState81 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_head, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 81.
        Stack shape : head.
        Start symbol: parser_main_logic_program. *)

  | MenhirState84 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_head, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 84.
        Stack shape : head.
        Start symbol: parser_main_logic_program. *)

  | MenhirState89 : (('s, _menhir_box_parser_main_logic_program) _menhir_cell1_clause, _menhir_box_parser_main_logic_program) _menhir_state
    (** State 89.
        Stack shape : clause.
        Start symbol: parser_main_logic_program. *)


and ('s, 'r) _menhir_cell1_atom = 
  | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_clause = 
  | MenhirCell1_clause of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_head = 
  | MenhirCell1_head of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_term = 
  | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_vars = 
  | MenhirCell1_vars of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.sort_env_list)

and ('s, 'r) _menhir_cell1_EXISTS = 
  | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PVAR = 
  | MenhirCell1_PVAR of 's * ('s, 'r) _menhir_state * (
# 11 "lib/pCSP/LPParser.mly"
       (string)
# 243 "lib/pCSP/LPParser.ml"
)

and ('s, 'r) _menhir_cell1_QUERY = 
  | MenhirCell1_QUERY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state * (
# 10 "lib/pCSP/LPParser.mly"
       (string)
# 253 "lib/pCSP/LPParser.ml"
)

and _menhir_box_parser_main_logic_program = 
  | MenhirBox_parser_main_logic_program of ((Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t) list) [@@unboxed]

let _menhir_action_01 =
  fun _2 ->
    (
# 58 "lib/pCSP/LPParser.mly"
                       ( _2 )
# 264 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_02 =
  fun _2 ->
    (
# 59 "lib/pCSP/LPParser.mly"
             ( Formula.mk_neg _2 )
# 272 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 60 "lib/pCSP/LPParser.mly"
                  ( Formula.mk_and _1 _3 )
# 280 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 61 "lib/pCSP/LPParser.mly"
                 ( Formula.mk_or _1 _3 )
# 288 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 62 "lib/pCSP/LPParser.mly"
                 ( Formula.eq _1 _3 )
# 296 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 63 "lib/pCSP/LPParser.mly"
                    ( Formula.mk_atom (T_bool.mk_neq _1 _3) )
# 304 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 64 "lib/pCSP/LPParser.mly"
                 ( Formula.mk_atom (T_int.mk_gt _1 _3) )
# 312 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_08 =
  fun _1 _3 ->
    (
# 65 "lib/pCSP/LPParser.mly"
                 ( Formula.mk_atom (T_int.mk_lt _1 _3) )
# 320 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 66 "lib/pCSP/LPParser.mly"
                  ( Formula.mk_atom (T_int.mk_geq _1 _3) )
# 328 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_10 =
  fun _1 _3 ->
    (
# 67 "lib/pCSP/LPParser.mly"
                  ( Formula.mk_atom (T_int.mk_leq _1 _3) )
# 336 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_11 =
  fun () ->
    (
# 68 "lib/pCSP/LPParser.mly"
        ( Formula.mk_true () )
# 344 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_12 =
  fun () ->
    (
# 69 "lib/pCSP/LPParser.mly"
        ( Formula.mk_false () )
# 352 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_13 =
  fun _1 ->
    (
# 70 "lib/pCSP/LPParser.mly"
        ( Formula.mk_atom (Atom.of_bool_var (Ident.Tvar _1) ))
# 360 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_14 =
  fun _1 _3 ->
    (
# 71 "lib/pCSP/LPParser.mly"
                             (
   let pred = Predicate.Var (Ident.Pvar _1, List.map Term.sort_of _3) in
   Formula.mk_atom (Atom.mk_app pred _3)
   )
# 371 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_15 =
  fun () ->
    let _ = (
# 75 "lib/pCSP/LPParser.mly"
          (
       let message = Printf.sprintf "atom parse error near characters %d-%d"
                                    (Parsing.symbol_start ())
                                    (Parsing.symbol_end ())
       in failwith message
  )
# 384 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\natom -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_16 =
  fun xs ->
    let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 394 "lib/pCSP/LPParser.ml"
     in
    (
# 49 "lib/pCSP/LPParser.mly"
                                   ( _1 )
# 399 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t list))

let _menhir_action_17 =
  fun _1 ->
    (
# 55 "lib/pCSP/LPParser.mly"
            ( Formula.and_of _1 )
# 407 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_18 =
  fun _1 ->
    (
# 38 "lib/pCSP/LPParser.mly"
             ( _1, Formula.mk_true () )
# 415 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t))

let _menhir_action_19 =
  fun _1 _3 ->
    (
# 39 "lib/pCSP/LPParser.mly"
                         ( _1, _3 )
# 423 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t))

let _menhir_action_20 =
  fun _1 _3 ->
    (
# 40 "lib/pCSP/LPParser.mly"
                          ( _1, _3 )
# 431 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t))

let _menhir_action_21 =
  fun _2 ->
    (
# 41 "lib/pCSP/LPParser.mly"
                   ( Formula.mk_false (), _2 )
# 439 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t))

let _menhir_action_22 =
  fun () ->
    let _ = (
# 42 "lib/pCSP/LPParser.mly"
          (
        let message = Printf.sprintf "clause parse error near characters %d-%d"
                                     (Parsing.symbol_start ())
                                     (Parsing.symbol_end ())
        in failwith message
      )
# 452 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nclause -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_23 =
  fun _1 ->
    (
# 35 "lib/pCSP/LPParser.mly"
                      ( _1 )
# 462 "lib/pCSP/LPParser.ml"
     : ((Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t) list))

let _menhir_action_24 =
  fun _1 ->
    (
# 52 "lib/pCSP/LPParser.mly"
         ( Formula.or_of _1 )
# 470 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_25 =
  fun _2 _4 ->
    (
# 53 "lib/pCSP/LPParser.mly"
                         ( Formula.mk_exists _2 (Formula.or_of _4) )
# 478 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_26 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 486 "lib/pCSP/LPParser.ml"
     : ((Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t) list))

let _menhir_action_27 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 494 "lib/pCSP/LPParser.ml"
     : ((Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t) list))

let _menhir_action_28 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 502 "lib/pCSP/LPParser.ml"
     : (string list))

let _menhir_action_29 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 510 "lib/pCSP/LPParser.ml"
     : (string list))

let _menhir_action_30 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 518 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t list))

let _menhir_action_31 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 526 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t list))

let _menhir_action_32 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 534 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_33 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 542 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_34 =
  fun _1 ->
    (
# 33 "lib/pCSP/LPParser.mly"
                                       ( _1 )
# 550 "lib/pCSP/LPParser.ml"
     : ((Ast.LogicOld.Formula.t * Ast.LogicOld.Formula.t) list))

let _menhir_action_35 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 558 "lib/pCSP/LPParser.ml"
     : (string list))

let _menhir_action_36 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 566 "lib/pCSP/LPParser.ml"
     : (string list))

let _menhir_action_37 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 574 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t list))

let _menhir_action_38 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 582 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Formula.t list))

let _menhir_action_39 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 590 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_40 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 598 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_41 =
  fun _2 ->
    (
# 86 "lib/pCSP/LPParser.mly"
                      ( _2 )
# 606 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_42 =
  fun _1 ->
    (
# 87 "lib/pCSP/LPParser.mly"
       ( Term.mk_var (Ident.Tvar _1) T_int.SInt (* ToDo: assume sort is int *) )
# 614 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_43 =
  fun _1 ->
    (
# 88 "lib/pCSP/LPParser.mly"
                  ( Term.mk_var (Ident.Tvar _1) T_bool.SBool )
# 622 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_44 =
  fun () ->
    (
# 89 "lib/pCSP/LPParser.mly"
         ( T_bool.mk_false () )
# 630 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_45 =
  fun () ->
    (
# 90 "lib/pCSP/LPParser.mly"
        ( T_bool.mk_true () )
# 638 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_46 =
  fun _1 ->
    (
# 91 "lib/pCSP/LPParser.mly"
       ( T_int.mk_int _1 )
# 646 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_47 =
  fun _2 ->
    (
# 92 "lib/pCSP/LPParser.mly"
                           ( T_int.mk_neg _2 )
# 654 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_48 =
  fun _1 _3 ->
    (
# 93 "lib/pCSP/LPParser.mly"
                  ( T_int.mk_add _1 _3 )
# 662 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_49 =
  fun _1 _3 ->
    (
# 94 "lib/pCSP/LPParser.mly"
                   ( T_int.mk_mult _1 _3 )
# 670 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_50 =
  fun _1 _3 ->
    (
# 95 "lib/pCSP/LPParser.mly"
                   ( T_int.mk_sub _1 _3 )
# 678 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_51 =
  fun _1 _3 ->
    (
# 96 "lib/pCSP/LPParser.mly"
                 ( T_int.mk_div _1 _3 )
# 686 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_52 =
  fun _1 _3 ->
    (
# 97 "lib/pCSP/LPParser.mly"
                 ( T_int.mk_mod _1 _3 )
# 694 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_53 =
  fun xs ->
    let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 702 "lib/pCSP/LPParser.ml"
     in
    (
# 99 "lib/pCSP/LPParser.mly"
                                    ( _1 )
# 707 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_54 =
  fun xs ->
    let _1 = 
# 241 "<standard.mly>"
    ( xs )
# 715 "lib/pCSP/LPParser.ml"
     in
    (
# 101 "lib/pCSP/LPParser.mly"
                                  ( List.map (fun x -> Ident.Tvar x, T_int.SInt) _1 )
# 720 "lib/pCSP/LPParser.ml"
     : (Ast.LogicOld.sort_env_list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ASSUME ->
        "ASSUME"
    | BOOL ->
        "BOOL"
    | BOT ->
        "BOT"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | DECLARE ->
        "DECLARE"
    | DIV ->
        "DIV"
    | DOT ->
        "DOT"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | EXISTS ->
        "EXISTS"
    | FALSE ->
        "FALSE"
    | GEQ ->
        "GEQ"
    | GT ->
        "GT"
    | INT _ ->
        "INT"
    | LEQ ->
        "LEQ"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | NOT ->
        "NOT"
    | NOTEQ ->
        "NOTEQ"
    | OR ->
        "OR"
    | PLUS ->
        "PLUS"
    | PVAR _ ->
        "PVAR"
    | QUERY ->
        "QUERY"
    | RPAREN ->
        "RPAREN"
    | TIMES ->
        "TIMES"
    | TOP ->
        "TOP"
    | TRUE ->
        "TRUE"
    | VAR _ ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let rec _menhir_error_goto_atom : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState00 ->
          _eRR ()
      | MenhirState89 ->
          _eRR ()
      | MenhirState84 ->
          _eRR ()
      | MenhirState81 ->
          _eRR ()
      | MenhirState73 ->
          _eRR ()
      | MenhirState66 ->
          _eRR ()
      | MenhirState07 ->
          _eRR ()
      | MenhirState36 ->
          _menhir_error_run_59 _menhir_stack _v
      | MenhirState57 ->
          _menhir_error_run_58 _menhir_stack _v
      | MenhirState54 ->
          _eRR ()
      | MenhirState37 ->
          _eRR ()
      | _ ->
          _menhir_fail ()
  
  and _menhir_error_run_59 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_NOT -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _v ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_02 _2 in
      _menhir_error_goto_atom _menhir_stack _v _menhir_s
  
  and _menhir_error_run_58 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_atom -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _v ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_03 _1 _3 in
      _menhir_error_goto_atom _menhir_stack _v _menhir_s
  
  let _menhir_error_run_08 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_15 () in
      _menhir_error_goto_atom _menhir_stack _v _menhir_s
  
  let _menhir_run_78 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _v ->
      let _1 = _v in
      let _v = _menhir_action_23 _1 in
      let _1 = _v in
      let _v = _menhir_action_34 _1 in
      MenhirBox_parser_main_logic_program _v
  
  let rec _menhir_run_90 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_clause -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _v ->
      let MenhirCell1_clause (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_27 x xs in
      _menhir_goto_list_clause_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_clause_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState89 ->
          _menhir_run_90 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_78 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_error_run_01 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_22 () in
      let _menhir_stack = MenhirCell1_clause (_menhir_stack, _menhir_s, _v) in
      _menhir_error_run_01 _menhir_stack MenhirState89
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let _1 = _v in
          let _v = _menhir_action_13 _1 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DIV | EQ | GEQ | GT | LEQ | LT | MINUS | MOD | NOTEQ | PLUS | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_42 _1 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_VAR -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_VAR (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _v = _menhir_action_43 _1 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_term : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState89 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState84 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState81 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState73 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState66 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState57 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState54 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_55 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NOTEQ ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState17 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DIV | DOT | EQ | GEQ | GT | LEQ | LT | MINUS | MOD | NOTEQ | OR | PLUS | RPAREN | TIMES ->
          let _1 = _v in
          let _v = _menhir_action_42 _1 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_45 () in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState12 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_46 _1 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_44 () in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState20 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState40 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState22 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState26 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState42 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState44 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState46 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState48 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState50 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState24 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_51 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_05 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState89 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState84 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState81 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState73 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState66 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState57 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState54 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_65 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState66 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TRUE ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOP ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PVAR _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOT ->
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _menhir_error_run_08 _menhir_stack _menhir_s)
      | AND ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSUME | DECLARE | DOT ->
          let x = _v in
          let _v = _menhir_action_37 x in
          _menhir_goto_separated_nonempty_list_COMMA_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_54 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_atom -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState54 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _menhir_error_run_08 _menhir_stack _menhir_s
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_11 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_PVAR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState10 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TRUE ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RPAREN ->
              let _v = _menhir_action_32 () in
              _menhir_goto_loption_separated_nonempty_list_COMMA_term__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_term__ : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_PVAR -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let xs = _v in
      let _v = _menhir_action_53 xs in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_PVAR (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_14 _1 _3 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_36 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState36 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _menhir_error_run_08 _menhir_stack _menhir_s
  
  and _menhir_run_37 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState37 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _menhir_error_run_08 _menhir_stack _menhir_s
  
  and _menhir_run_38 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_12 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_57 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_atom -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState57 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _menhir_error_run_08 _menhir_stack _menhir_s
  
  and _menhir_goto_separated_nonempty_list_COMMA_atom_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState66 ->
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState89 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState84 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState81 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState73 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_67 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_60 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_31 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_atom__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_atom__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let xs = _v in
      let _v = _menhir_action_16 xs in
      _menhir_goto_atoms _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atoms : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_91 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState89 ->
          _menhir_run_91 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState73 ->
          _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState84 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState81 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_91 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_24 _1 in
      _menhir_goto_head _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_head : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | DECLARE ->
          let _menhir_stack = MenhirCell1_head (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState81 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TRUE ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOP ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PVAR _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOT ->
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DOT ->
              _menhir_reduce_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _menhir_error_run_08 _menhir_stack _menhir_s)
      | ASSUME ->
          let _menhir_stack = MenhirCell1_head (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState84 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TRUE ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TOP ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PVAR _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOT ->
              _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DOT ->
              _menhir_reduce_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _menhir_error_run_08 _menhir_stack _menhir_s)
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_clause : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_clause (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState89
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | QUERY ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | PVAR _v_1 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState89
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | INT _v_2 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState89
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | EXISTS ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState89
      | EOF ->
          let _v_3 = _menhir_action_26 () in
          _menhir_run_90 _menhir_stack _v_3
      | ASSUME | DECLARE | DOT ->
          let _menhir_s = MenhirState89 in
          let _v = _menhir_action_30 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_atom__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_error_run_01 _menhir_stack MenhirState89
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_QUERY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DOT ->
          _menhir_reduce_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _menhir_error_run_08 _menhir_stack _menhir_s
  
  and _menhir_reduce_30 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      let _v = _menhir_action_30 () in
      _menhir_goto_loption_separated_nonempty_list_COMMA_atom__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_68 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState68 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOT ->
          let _v = _menhir_action_28 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_VAR__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_69 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState70 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DOT ->
          let x = _v in
          let _v = _menhir_action_35 x in
          _menhir_goto_separated_nonempty_list_COMMA_VAR_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_VAR_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState68 ->
          _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState70 ->
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_75 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_29 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_VAR__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_VAR__ : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let xs = _v in
      let _v = _menhir_action_54 xs in
      let _menhir_stack = MenhirCell1_vars (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState73 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME | DECLARE | DOT ->
          _menhir_reduce_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _menhir_error_run_08 _menhir_stack _menhir_s
  
  and _menhir_run_71 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_VAR -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_36 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_VAR_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_74 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_EXISTS, _menhir_box_parser_main_logic_program) _menhir_cell1_vars -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_vars (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_EXISTS (_menhir_stack, _menhir_s) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_25 _2 _4 in
      _menhir_goto_head _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_64 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_17 _1 in
      _menhir_goto_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_body : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState84 ->
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState81 ->
          _menhir_run_82 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_85 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_head -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_head (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_19 _1 _3 in
          _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_82 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_head -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_head (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_20 _1 _3 in
          _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_62 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_QUERY -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_QUERY (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_21 _2 in
          _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_59 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_02 _2 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_58 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_03 _1 _3 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_56 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_atom as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_atom (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_04 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_52 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_01 _2 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_49 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_07 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_10 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_08 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | OR | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NOTEQ ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_LPAREN, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_term (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_41 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState32 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAR _v ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | TRUE ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_39 x in
          _menhir_goto_separated_nonempty_list_COMMA_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_term_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_state -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState10 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_PVAR -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_33 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_term__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_40 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_28 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_47 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_27 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | EQ | GEQ | GT | LEQ | LT | MINUS | NOTEQ | OR | PLUS | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_50 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_51 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_52 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ASSUME | COMMA | DECLARE | DOT | EQ | GEQ | GT | LEQ | LT | MINUS | NOTEQ | OR | PLUS | RPAREN ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_48 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_49 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_parser_main_logic_program) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_parser_main_logic_program) _menhir_state -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_parser_main_logic_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | TRUE ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | TOP ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | QUERY ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PVAR _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | NOT ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | MINUS ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | FALSE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EXISTS ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | BOT ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EOF ->
          let _v = _menhir_action_26 () in
          _menhir_run_78 _menhir_stack _v
      | ASSUME | DECLARE | DOT ->
          let _menhir_s = MenhirState00 in
          let _v = _menhir_action_30 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_atom__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_error_run_01 _menhir_stack MenhirState00
  
end

let parser_main_logic_program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_parser_main_logic_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
