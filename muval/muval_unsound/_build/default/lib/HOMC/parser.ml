
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UIDENT of (
# 26 "lib/HOMC/parser.mly"
       (string)
# 15 "lib/HOMC/parser.ml"
  )
    | TRUE
    | RPAREN
    | PERIOD
    | OR
    | OF
    | MINUS_RANGLE
    | LPAREN
    | LIDENT of (
# 25 "lib/HOMC/parser.mly"
       (string)
# 27 "lib/HOMC/parser.ml"
  )
    | INT of (
# 27 "lib/HOMC/parser.mly"
       (int)
# 32 "lib/HOMC/parser.ml"
  )
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
  
end

include MenhirBasics

# 1 "lib/HOMC/parser.mly"
  
open Ast

let print_error_information () =
  let st = Parsing.symbol_start_pos () in
  let en = Parsing.symbol_end_pos () in
  print_string ("File \"" ^ st.Lexing.pos_fname);
  Format.printf "\", line %d" st.Lexing.pos_lnum;
  Format.printf ", characters %d-%d:\n"
    (st.Lexing.pos_cnum - st.Lexing.pos_bol)
    (en.Lexing.pos_cnum - en.Lexing.pos_bol)

let coerce_idx = ref 1

# 76 "lib/HOMC/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState002 : ('s, _menhir_box_hmtt) _menhir_state
    (** State 002.
        Stack shape : .
        Start symbol: hmtt. *)

  | MenhirState003 : (('s, 'r) _menhir_cell1_UIDENT, 'r) _menhir_state
    (** State 003.
        Stack shape : UIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState004 : (('s, 'r) _menhir_cell1_LIDENT, 'r) _menhir_state
    (** State 004.
        Stack shape : LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState007 : ((('s, 'r) _menhir_cell1_UIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_state
    (** State 007.
        Stack shape : UIDENT lidents.
        Start symbol: <undetermined>. *)

  | MenhirState009 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 009.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState014 : (('s, 'r) _menhir_cell1_COPY, 'r) _menhir_state
    (** State 014.
        Stack shape : COPY.
        Start symbol: <undetermined>. *)

  | MenhirState017 : (('s, 'r) _menhir_cell1_COERCE _menhir_cell0_LIDENT, 'r) _menhir_state
    (** State 017.
        Stack shape : COERCE LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState021 : (('s, 'r) _menhir_cell1_CASE _menhir_cell0_LIDENT, 'r) _menhir_state
    (** State 021.
        Stack shape : CASE LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState022 : (('s, 'r) _menhir_cell1_LIDENT, 'r) _menhir_state
    (** State 022.
        Stack shape : LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState024 : ((('s, 'r) _menhir_cell1_LIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_state
    (** State 024.
        Stack shape : LIDENT lidents.
        Start symbol: <undetermined>. *)

  | MenhirState025 : (((('s, 'r) _menhir_cell1_LIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 025.
        Stack shape : LIDENT lidents term.
        Start symbol: <undetermined>. *)

  | MenhirState030 : (('s, 'r) _menhir_cell1_pat, 'r) _menhir_state
    (** State 030.
        Stack shape : pat.
        Start symbol: <undetermined>. *)

  | MenhirState032 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 032.
        Stack shape : LPAREN term.
        Start symbol: <undetermined>. *)

  | MenhirState034 : (((('s, 'r) _menhir_cell1_UIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 034.
        Stack shape : UIDENT lidents term.
        Start symbol: <undetermined>. *)

  | MenhirState036 : ((('s, 'r) _menhir_cell1_UIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_state
    (** State 036.
        Stack shape : UIDENT lidents.
        Start symbol: <undetermined>. *)

  | MenhirState037 : (((('s, 'r) _menhir_cell1_UIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 037.
        Stack shape : UIDENT lidents term.
        Start symbol: <undetermined>. *)

  | MenhirState042 : (('s, _menhir_box_hmtt) _menhir_cell1_rules, _menhir_box_hmtt) _menhir_state
    (** State 042.
        Stack shape : rules.
        Start symbol: hmtt. *)

  | MenhirState045 : (('s, 'r) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, 'r) _menhir_state
    (** State 045.
        Stack shape : LIDENT LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState047 : ((('s, 'r) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, 'r) _menhir_cell1_lidents, 'r) _menhir_state
    (** State 047.
        Stack shape : LIDENT LIDENT lidents.
        Start symbol: <undetermined>. *)

  | MenhirState052 : ((('s, _menhir_box_hmtt) _menhir_cell1_rules, _menhir_box_hmtt) _menhir_cell1_tta_transitions, _menhir_box_hmtt) _menhir_state
    (** State 052.
        Stack shape : rules tta_transitions.
        Start symbol: hmtt. *)

  | MenhirState054 : (('s, 'r) _menhir_cell1_UIDENT, 'r) _menhir_state
    (** State 054.
        Stack shape : UIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState055 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 055.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState059 : (('s, 'r) _menhir_cell1_typ, 'r) _menhir_state
    (** State 059.
        Stack shape : typ.
        Start symbol: <undetermined>. *)

  | MenhirState064 : (('s, 'r) _menhir_cell1_LIDENT, 'r) _menhir_state
    (** State 064.
        Stack shape : LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState070 : (('s, 'r) _menhir_cell1_rule, 'r) _menhir_state
    (** State 070.
        Stack shape : rule.
        Start symbol: <undetermined>. *)

  | MenhirState075 : ('s, _menhir_box_hors) _menhir_state
    (** State 075.
        Stack shape : .
        Start symbol: hors. *)

  | MenhirState077 : (('s, _menhir_box_hors) _menhir_cell1_rules, _menhir_box_hors) _menhir_state
    (** State 077.
        Stack shape : rules.
        Start symbol: hors. *)

  | MenhirState079 : (('s, _menhir_box_hors) _menhir_cell1_BEGINR, _menhir_box_hors) _menhir_state
    (** State 079.
        Stack shape : BEGINR.
        Start symbol: hors. *)

  | MenhirState083 : (('s, 'r) _menhir_cell1_LIDENT _menhir_cell0_INT, 'r) _menhir_state
    (** State 083.
        Stack shape : LIDENT INT.
        Start symbol: <undetermined>. *)

  | MenhirState088 : ((('s, _menhir_box_hors) _menhir_cell1_BEGINR, _menhir_box_hors) _menhir_cell1_ata_arities, _menhir_box_hors) _menhir_state
    (** State 088.
        Stack shape : BEGINR ata_arities.
        Start symbol: hors. *)

  | MenhirState091 : (('s, 'r) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, 'r) _menhir_state
    (** State 091.
        Stack shape : LIDENT LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState098 : (('s, 'r) _menhir_cell1_LPAREN _menhir_cell0_INT _menhir_cell0_LIDENT, 'r) _menhir_state
    (** State 098.
        Stack shape : LPAREN INT LIDENT.
        Start symbol: <undetermined>. *)

  | MenhirState102 : ((('s, 'r) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, 'r) _menhir_cell1_dnf, 'r) _menhir_state
    (** State 102.
        Stack shape : LIDENT LIDENT dnf.
        Start symbol: <undetermined>. *)

  | MenhirState106 : (('s, 'r) _menhir_cell1_cube, 'r) _menhir_state
    (** State 106.
        Stack shape : cube.
        Start symbol: <undetermined>. *)

  | MenhirState110 : (('s, _menhir_box_hors) _menhir_cell1_BEGINA, _menhir_box_hors) _menhir_state
    (** State 110.
        Stack shape : BEGINA.
        Start symbol: hors. *)

  | MenhirState116 : ('s, _menhir_box_rules) _menhir_state
    (** State 116.
        Stack shape : .
        Start symbol: rules. *)

  | MenhirState119 : (('s, _menhir_box_rules) _menhir_cell1_rule, _menhir_box_rules) _menhir_state
    (** State 119.
        Stack shape : rule.
        Start symbol: rules. *)

  | MenhirState121 : ('s, _menhir_box_tree_automata) _menhir_state
    (** State 121.
        Stack shape : .
        Start symbol: tree_automata. *)

  | MenhirState123 : (('s, _menhir_box_tree_automata) _menhir_cell1_BEGINR, _menhir_box_tree_automata) _menhir_state
    (** State 123.
        Stack shape : BEGINR.
        Start symbol: tree_automata. *)

  | MenhirState126 : ((('s, _menhir_box_tree_automata) _menhir_cell1_BEGINR, _menhir_box_tree_automata) _menhir_cell1_ata_arities, _menhir_box_tree_automata) _menhir_state
    (** State 126.
        Stack shape : BEGINR ata_arities.
        Start symbol: tree_automata. *)

  | MenhirState129 : (('s, _menhir_box_tree_automata) _menhir_cell1_BEGINA, _menhir_box_tree_automata) _menhir_state
    (** State 129.
        Stack shape : BEGINA.
        Start symbol: tree_automata. *)

  | MenhirState133 : ('s, _menhir_box_tta_transitions) _menhir_state
    (** State 133.
        Stack shape : .
        Start symbol: tta_transitions. *)

  | MenhirState136 : (('s, _menhir_box_tta_transitions) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, _menhir_box_tta_transitions) _menhir_state
    (** State 136.
        Stack shape : LIDENT LIDENT.
        Start symbol: tta_transitions. *)

  | MenhirState138 : ((('s, _menhir_box_tta_transitions) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, _menhir_box_tta_transitions) _menhir_cell1_lidents, _menhir_box_tta_transitions) _menhir_state
    (** State 138.
        Stack shape : LIDENT LIDENT lidents.
        Start symbol: tta_transitions. *)

  | MenhirState142 : ('s, _menhir_box_typedefs) _menhir_state
    (** State 142.
        Stack shape : .
        Start symbol: typedefs. *)

  | MenhirState145 : (('s, _menhir_box_typedefs) _menhir_cell1_typedef, _menhir_box_typedefs) _menhir_state
    (** State 145.
        Stack shape : typedef.
        Start symbol: typedefs. *)


and ('s, 'r) _menhir_cell1_ata_arities = 
  | MenhirCell1_ata_arities of 's * ('s, 'r) _menhir_state * (Automata.ATA.arity)

and ('s, 'r) _menhir_cell1_cube = 
  | MenhirCell1_cube of 's * ('s, 'r) _menhir_state * ((int * string) list)

and ('s, 'r) _menhir_cell1_dnf = 
  | MenhirCell1_dnf of 's * ('s, 'r) _menhir_state * (Automata.ATA.dest)

and ('s, 'r) _menhir_cell1_lidents = 
  | MenhirCell1_lidents of 's * ('s, 'r) _menhir_state * (Ast.Ident.tvar list)

and ('s, 'r) _menhir_cell1_pat = 
  | MenhirCell1_pat of 's * ('s, 'r) _menhir_state * (Ast.Ident.tvar * (Ast.Ident.tvar list * EHMTT.term))

and ('s, 'r) _menhir_cell1_rule = 
  | MenhirCell1_rule of 's * ('s, 'r) _menhir_state * (EHMTT.rule)

and ('s, 'r) _menhir_cell1_rules = 
  | MenhirCell1_rules of 's * ('s, 'r) _menhir_state * (EHMTT.t)

and ('s, 'r) _menhir_cell1_term = 
  | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (EHMTT.term)

and ('s, 'r) _menhir_cell1_tta_transitions = 
  | MenhirCell1_tta_transitions of 's * ('s, 'r) _menhir_state * (Automata.TTA.pre_trs)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Ast.Ident.tvar RefType.t)

and ('s, 'r) _menhir_cell1_typedef = 
  | MenhirCell1_typedef of 's * ('s, 'r) _menhir_state * (Ast.Ident.tvar * Ast.Ident.tvar RefType.t)

and ('s, 'r) _menhir_cell1_BEGINA = 
  | MenhirCell1_BEGINA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_BEGINR = 
  | MenhirCell1_BEGINR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CASE = 
  | MenhirCell1_CASE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COERCE = 
  | MenhirCell1_COERCE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COPY = 
  | MenhirCell1_COPY of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_INT = 
  | MenhirCell0_INT of 's * (
# 27 "lib/HOMC/parser.mly"
       (int)
# 362 "lib/HOMC/parser.ml"
)

and ('s, 'r) _menhir_cell1_LIDENT = 
  | MenhirCell1_LIDENT of 's * ('s, 'r) _menhir_state * (
# 25 "lib/HOMC/parser.mly"
       (string)
# 369 "lib/HOMC/parser.ml"
)

and 's _menhir_cell0_LIDENT = 
  | MenhirCell0_LIDENT of 's * (
# 25 "lib/HOMC/parser.mly"
       (string)
# 376 "lib/HOMC/parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UIDENT = 
  | MenhirCell1_UIDENT of 's * ('s, 'r) _menhir_state * (
# 26 "lib/HOMC/parser.mly"
       (string)
# 386 "lib/HOMC/parser.ml"
)

and _menhir_box_typedefs = 
  | MenhirBox_typedefs of ((Ast.Ident.tvar * Ast.Ident.tvar RefType.t) list) [@@unboxed]

and _menhir_box_tta_transitions = 
  | MenhirBox_tta_transitions of (Automata.TTA.pre_trs) [@@unboxed]

and _menhir_box_tree_automata = 
  | MenhirBox_tree_automata of (Automata.TreeAutomaton.t) [@@unboxed]

and _menhir_box_rules = 
  | MenhirBox_rules of (EHMTT.t) [@@unboxed]

and _menhir_box_hors = 
  | MenhirBox_hors of (EHMTT.t * Automata.TreeAutomaton.t) [@@unboxed]

and _menhir_box_hmtt = 
  | MenhirBox_hmtt of (EHMTT.t * Automata.TTA.pre_trs *
  (Ast.Ident.tvar * Ast.Ident.tvar RefType.t)) [@@unboxed]

let _menhir_action_06 =
  fun () ->
    (
# 138 "lib/HOMC/parser.mly"
    ( [] )
# 413 "lib/HOMC/parser.ml"
     : (Automata.ATA.arity))

let _menhir_action_07 =
  fun _1 _3 _5 ->
    (
# 140 "lib/HOMC/parser.mly"
    ( (_1, _3) :: _5 )
# 421 "lib/HOMC/parser.ml"
     : (Automata.ATA.arity))

let _menhir_action_08 =
  fun () ->
    (
# 142 "lib/HOMC/parser.mly"
    ( [] )
# 429 "lib/HOMC/parser.ml"
     : (Automata.ATA.arity))

let _menhir_action_09 =
  fun () ->
    (
# 146 "lib/HOMC/parser.mly"
    ( [] )
# 437 "lib/HOMC/parser.ml"
     : (Automata.ATA.pre_trs))

let _menhir_action_10 =
  fun _1 _2 _4 _6 ->
    (
# 148 "lib/HOMC/parser.mly"
    ( (_1, (_2, _4)) :: _6 )
# 445 "lib/HOMC/parser.ml"
     : (Automata.ATA.pre_trs))

let _menhir_action_11 =
  fun () ->
    (
# 150 "lib/HOMC/parser.mly"
    ( [] )
# 453 "lib/HOMC/parser.ml"
     : (Automata.ATA.pre_trs))

let _menhir_action_12 =
  fun () ->
    (
# 158 "lib/HOMC/parser.mly"
       ( [] )
# 461 "lib/HOMC/parser.ml"
     : ((int * string) list))

let _menhir_action_13 =
  fun _2 _4 ->
    (
# 159 "lib/HOMC/parser.mly"
                                 ( [(_2, _4)] )
# 469 "lib/HOMC/parser.ml"
     : ((int * string) list))

let _menhir_action_14 =
  fun _2 _4 _7 ->
    (
# 160 "lib/HOMC/parser.mly"
                                          ( (_2, _4) :: _7 )
# 477 "lib/HOMC/parser.ml"
     : ((int * string) list))

let _menhir_action_15 =
  fun () ->
    (
# 153 "lib/HOMC/parser.mly"
        ( [] )
# 485 "lib/HOMC/parser.ml"
     : (Automata.ATA.dest))

let _menhir_action_16 =
  fun _1 ->
    (
# 154 "lib/HOMC/parser.mly"
       ( [_1] )
# 493 "lib/HOMC/parser.ml"
     : (Automata.ATA.dest))

let _menhir_action_17 =
  fun _1 _3 ->
    (
# 155 "lib/HOMC/parser.mly"
              ( _1 :: _3 )
# 501 "lib/HOMC/parser.ml"
     : (Automata.ATA.dest))

let _menhir_action_18 =
  fun _2 _5 _8 ->
    (
# 56 "lib/HOMC/parser.mly"
    ( _2, _5, _8 )
# 509 "lib/HOMC/parser.ml"
     : (EHMTT.t * Automata.TTA.pre_trs *
  (Ast.Ident.tvar * Ast.Ident.tvar RefType.t)))

let _menhir_action_19 =
  fun () ->
    let _ = (
# 58 "lib/HOMC/parser.mly"
    ( print_error_information ();
      raise (Failure "Syntax error") )
# 519 "lib/HOMC/parser.ml"
     : (EHMTT.t * Automata.TTA.pre_trs *
  (Ast.Ident.tvar * Ast.Ident.tvar RefType.t))) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nhmtt -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_20 =
  fun _2 _4 ->
    (
# 49 "lib/HOMC/parser.mly"
    ( _2, _4 )
# 530 "lib/HOMC/parser.ml"
     : (EHMTT.t * Automata.TreeAutomaton.t))

let _menhir_action_21 =
  fun () ->
    let _ = (
# 51 "lib/HOMC/parser.mly"
    ( print_error_information ();
      raise (Failure "Syntax error") )
# 539 "lib/HOMC/parser.ml"
     : (EHMTT.t * Automata.TreeAutomaton.t)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nhors -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_22 =
  fun () ->
    (
# 124 "lib/HOMC/parser.mly"
    ( [] )
# 549 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar list))

let _menhir_action_23 =
  fun _1 _2 ->
    (
# 126 "lib/HOMC/parser.mly"
    ( (Ident.Tvar _1) :: _2 )
# 557 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar list))

let _menhir_action_24 =
  fun _1 _2 _4 ->
    (
# 120 "lib/HOMC/parser.mly"
    ( Ident.Tvar _1, (_2, _4) )
# 565 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar * (Ast.Ident.tvar list * EHMTT.term)))

let _menhir_action_25 =
  fun _1 ->
    (
# 114 "lib/HOMC/parser.mly"
    ( [_1] )
# 573 "lib/HOMC/parser.ml"
     : ((Ast.Ident.tvar * (Ast.Ident.tvar list * EHMTT.term)) list))

let _menhir_action_26 =
  fun _1 _3 ->
    (
# 116 "lib/HOMC/parser.mly"
    ( _1::_3 )
# 581 "lib/HOMC/parser.ml"
     : ((Ast.Ident.tvar * (Ast.Ident.tvar list * EHMTT.term)) list))

let _menhir_action_27 =
  fun _1 _2 _4 ->
    (
# 80 "lib/HOMC/parser.mly"
    ( Ident.Tvar _1, (_2, EHMTT.elimVarOrTerm _2 _4) )
# 589 "lib/HOMC/parser.ml"
     : (EHMTT.rule))

let _menhir_action_28 =
  fun _1 _2 _4 ->
    (
# 82 "lib/HOMC/parser.mly"
    ( Ident.Tvar _1, (_2, EHMTT.elimVarOrTerm _2 _4) )
# 597 "lib/HOMC/parser.ml"
     : (EHMTT.rule))

let _menhir_action_29 =
  fun () ->
    (
# 72 "lib/HOMC/parser.mly"
    ( [] )
# 605 "lib/HOMC/parser.ml"
     : (EHMTT.t))

let _menhir_action_30 =
  fun _1 _2 ->
    (
# 74 "lib/HOMC/parser.mly"
    ( _1::_2 )
# 613 "lib/HOMC/parser.ml"
     : (EHMTT.t))

let _menhir_action_31 =
  fun () ->
    (
# 76 "lib/HOMC/parser.mly"
    ( [] )
# 621 "lib/HOMC/parser.ml"
     : (EHMTT.t))

let _menhir_action_32 =
  fun _2 ->
    (
# 86 "lib/HOMC/parser.mly"
    ( _2 )
# 629 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_33 =
  fun _1 ->
    (
# 88 "lib/HOMC/parser.mly"
    ( EHMTT.VarOrTerm(Ident.Tvar _1) )
# 637 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_34 =
  fun _1 ->
    (
# 90 "lib/HOMC/parser.mly"
    ( EHMTT.Nonterm(Ident.Tvar _1) )
# 645 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_35 =
  fun _1 ->
    (
# 92 "lib/HOMC/parser.mly"
    ( EHMTT.Fd _1 )
# 653 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_36 =
  fun _1 ->
    (
# 96 "lib/HOMC/parser.mly"
    ( _1 )
# 661 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_37 =
  fun _1 _2 ->
    (
# 98 "lib/HOMC/parser.mly"
    ( EHMTT.App(_1, _2) )
# 669 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_38 =
  fun _2 _4 ->
    (
# 100 "lib/HOMC/parser.mly"
    ( EHMTT.Case(Ident.Tvar _2, _4) )
# 677 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_39 =
  fun _2 _3 ->
    (
# 102 "lib/HOMC/parser.mly"
    ( 
      let idx = !coerce_idx in
      coerce_idx := idx + 1;
      EHMTT.Coerce(Ident.Tvar _2, _3, idx) 
    )
# 689 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_40 =
  fun _2 ->
    (
# 108 "lib/HOMC/parser.mly"
    ( EHMTT.Copy(_2) )
# 697 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_41 =
  fun _2 ->
    (
# 110 "lib/HOMC/parser.mly"
    ( EHMTT.Tree(Ident.Tvar _2) )
# 705 "lib/HOMC/parser.ml"
     : (EHMTT.term))

let _menhir_action_42 =
  fun _2 ->
    (
# 63 "lib/HOMC/parser.mly"
    ( Automata.TreeAutomaton.TTA (Automata.TTA.make _2) )
# 713 "lib/HOMC/parser.ml"
     : (Automata.TreeAutomaton.t))

let _menhir_action_43 =
  fun _2 _5 ->
    (
# 65 "lib/HOMC/parser.mly"
    ( Automata.TreeAutomaton.ATA (_2, Automata.ATA.make _5) )
# 721 "lib/HOMC/parser.ml"
     : (Automata.TreeAutomaton.t))

let _menhir_action_44 =
  fun () ->
    let _ = (
# 67 "lib/HOMC/parser.mly"
    ( print_error_information ();
      raise (Failure "Syntax error") )
# 730 "lib/HOMC/parser.ml"
     : (Automata.TreeAutomaton.t)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\ntree_automata -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_45 =
  fun () ->
    (
# 130 "lib/HOMC/parser.mly"
    ( [] )
# 740 "lib/HOMC/parser.ml"
     : (Automata.TTA.pre_trs))

let _menhir_action_46 =
  fun _1 _2 _4 _6 ->
    (
# 132 "lib/HOMC/parser.mly"
    ( (_1, (_2, List.map Ident.name_of_tvar _4)) :: _6 )
# 748 "lib/HOMC/parser.ml"
     : (Automata.TTA.pre_trs))

let _menhir_action_47 =
  fun () ->
    (
# 134 "lib/HOMC/parser.mly"
    ( [] )
# 756 "lib/HOMC/parser.ml"
     : (Automata.TTA.pre_trs))

let _menhir_action_48 =
  fun _1 ->
    (
# 179 "lib/HOMC/parser.mly"
    ( RefType.Base(Ident.Tvar _1) )
# 764 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar RefType.t))

let _menhir_action_49 =
  fun _1 _3 ->
    (
# 181 "lib/HOMC/parser.mly"
    ( RefType.Func(_1, _3) )
# 772 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar RefType.t))

let _menhir_action_50 =
  fun _2 ->
    (
# 183 "lib/HOMC/parser.mly"
    ( _2 )
# 780 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar RefType.t))

let _menhir_action_51 =
  fun _1 _3 ->
    (
# 173 "lib/HOMC/parser.mly"
    ( Ident.Tvar _1, _3 )
# 788 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar * Ast.Ident.tvar RefType.t))

let _menhir_action_52 =
  fun _1 _3 ->
    (
# 175 "lib/HOMC/parser.mly"
    ( Ident.Tvar _1, _3 )
# 796 "lib/HOMC/parser.ml"
     : (Ast.Ident.tvar * Ast.Ident.tvar RefType.t))

let _menhir_action_53 =
  fun () ->
    (
# 165 "lib/HOMC/parser.mly"
    ( [] )
# 804 "lib/HOMC/parser.ml"
     : ((Ast.Ident.tvar * Ast.Ident.tvar RefType.t) list))

let _menhir_action_54 =
  fun _1 _2 ->
    (
# 167 "lib/HOMC/parser.mly"
    ( _1::_2 )
# 812 "lib/HOMC/parser.ml"
     : ((Ast.Ident.tvar * Ast.Ident.tvar RefType.t) list))

let _menhir_action_55 =
  fun () ->
    (
# 169 "lib/HOMC/parser.mly"
    ( [] )
# 820 "lib/HOMC/parser.ml"
     : ((Ast.Ident.tvar * Ast.Ident.tvar RefType.t) list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BAR ->
        "BAR"
    | BEGINA ->
        "BEGINA"
    | BEGINATA ->
        "BEGINATA"
    | BEGING ->
        "BEGING"
    | BEGINR ->
        "BEGINR"
    | BEGINT ->
        "BEGINT"
    | CASE ->
        "CASE"
    | COERCE ->
        "COERCE"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | COPY ->
        "COPY"
    | ENDA ->
        "ENDA"
    | ENDATA ->
        "ENDATA"
    | ENDG ->
        "ENDG"
    | ENDR ->
        "ENDR"
    | ENDT ->
        "ENDT"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | EQUAL_RANGLE ->
        "EQUAL_RANGLE"
    | FALSE ->
        "FALSE"
    | GEN ->
        "GEN"
    | INT _ ->
        "INT"
    | LIDENT _ ->
        "LIDENT"
    | LPAREN ->
        "LPAREN"
    | MINUS_RANGLE ->
        "MINUS_RANGLE"
    | OF ->
        "OF"
    | OR ->
        "OR"
    | PERIOD ->
        "PERIOD"
    | RPAREN ->
        "RPAREN"
    | TRUE ->
        "TRUE"
    | UIDENT _ ->
        "UIDENT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_141 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_tta_transitions =
    fun _menhir_stack _v ->
      MenhirBox_tta_transitions _v
  
  let _menhir_run_132 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_tree_automata =
    fun _menhir_stack _v ->
      MenhirBox_tree_automata _v
  
  let _menhir_run_113 : type  ttv_stack. (ttv_stack, _menhir_box_hors) _menhir_cell1_rules -> _ -> _ -> _menhir_box_hors =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let MenhirCell1_rules (_menhir_stack, _, _2) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_20 _2 _4 in
          MenhirBox_hors _v
      | _ ->
          _eRR ()
  
  let _menhir_goto_tree_automata : type  ttv_stack ttv_result. ttv_stack -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState121 ->
          _menhir_run_132 _menhir_stack _v
      | MenhirState077 ->
          _menhir_run_113 _menhir_stack _v _tok
      | _ ->
          _menhir_fail ()
  
  let _menhir_run_130 : type  ttv_stack. (ttv_stack, _menhir_box_tree_automata) _menhir_cell1_BEGINA -> _ -> _ -> _menhir_box_tree_automata =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | ENDA ->
          let MenhirCell1_BEGINA (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_42 _2 in
          _menhir_goto_tree_automata _menhir_stack _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_111 : type  ttv_stack. (ttv_stack, _menhir_box_hors) _menhir_cell1_BEGINA -> _ -> _ -> _ -> _ -> _menhir_box_hors =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | ENDA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_BEGINA (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_42 _2 in
          _menhir_goto_tree_automata _menhir_stack _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_144 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_typedefs =
    fun _menhir_stack _v ->
      MenhirBox_typedefs _v
  
  let rec _menhir_goto_typedefs : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_typedefs) _menhir_state -> _menhir_box_typedefs =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState145 ->
          _menhir_run_146 _menhir_stack _v
      | MenhirState142 ->
          _menhir_run_144 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_146 : type  ttv_stack. (ttv_stack, _menhir_box_typedefs) _menhir_cell1_typedef -> _ -> _menhir_box_typedefs =
    fun _menhir_stack _v ->
      let MenhirCell1_typedef (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_54 _1 _2 in
      _menhir_goto_typedefs _menhir_stack _v _menhir_s
  
  let _menhir_run_143 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_typedefs) _menhir_state -> _menhir_box_typedefs =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_55 () in
      _menhir_goto_typedefs _menhir_stack _v _menhir_s
  
  let _menhir_run_067 : type  ttv_stack. ((ttv_stack, _menhir_box_hmtt) _menhir_cell1_rules, _menhir_box_hmtt) _menhir_cell1_tta_transitions -> _ -> _ -> _ -> _ -> _menhir_box_hmtt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | ENDT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let MenhirCell1_tta_transitions (_menhir_stack, _, _5) = _menhir_stack in
              let MenhirCell1_rules (_menhir_stack, _, _2) = _menhir_stack in
              let _8 = _v in
              let _v = _menhir_action_18 _2 _5 _8 in
              MenhirBox_hmtt _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_053 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState054 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LIDENT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState055 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_48 _1 in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState054 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_065 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PERIOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_52 _1 _3 in
          _menhir_goto_typedef _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS_RANGLE ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_typedef : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState145 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_145 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_typedefs) _menhir_state -> _ -> _menhir_box_typedefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typedef (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState145
      | LIDENT _v_1 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState145
      | EOF ->
          _menhir_run_143 _menhir_stack MenhirState145
      | _ ->
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState064 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LIDENT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_typ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState059 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_UIDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PERIOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_UIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_51 _1 _3 in
          _menhir_goto_typedef _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS_RANGLE ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_typ as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS_RANGLE ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PERIOD | RPAREN ->
          let MenhirCell1_typ (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_49 _1 _3 in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_50 _2 in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MINUS_RANGLE ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let _menhir_run_050 : type  ttv_stack. ((ttv_stack, _menhir_box_hmtt) _menhir_cell1_rules as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_hmtt) _menhir_state -> _ -> _menhir_box_hmtt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_tta_transitions (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ENDA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGINT ->
              let _menhir_s = MenhirState052 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UIDENT _v ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | LIDENT _v ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_goto_tta_transitions : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState133 ->
          _menhir_run_141 _menhir_stack _v
      | MenhirState138 ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _v _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState042 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_140 : type  ttv_stack. ((ttv_stack, _menhir_box_tta_transitions) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, _menhir_box_tta_transitions) _menhir_cell1_lidents -> _ -> _ -> _ -> _ -> _menhir_box_tta_transitions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_lidents (_menhir_stack, _, _4) = _menhir_stack in
      let MenhirCell0_LIDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _6 = _v in
      let _v = _menhir_action_46 _1 _2 _4 _6 in
      _menhir_goto_tta_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, ttv_result) _menhir_cell1_lidents -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_lidents (_menhir_stack, _, _4) = _menhir_stack in
      let MenhirCell0_LIDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _6 = _v in
      let _v = _menhir_action_46 _1 _2 _4 _6 in
      _menhir_goto_tta_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_139 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_tta_transitions) _menhir_state -> _ -> _menhir_box_tta_transitions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      let _v = _menhir_action_47 () in
      _menhir_goto_tta_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_048 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_47 () in
      _menhir_goto_tta_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_118 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_rules =
    fun _menhir_stack _v ->
      MenhirBox_rules _v
  
  let _menhir_run_127 : type  ttv_stack. ((ttv_stack, _menhir_box_tree_automata) _menhir_cell1_BEGINR, _menhir_box_tree_automata) _menhir_cell1_ata_arities -> _ -> _ -> _menhir_box_tree_automata =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | ENDATA ->
          let MenhirCell1_ata_arities (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_BEGINR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_43 _2 _5 in
          _menhir_goto_tree_automata _menhir_stack _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_108 : type  ttv_stack. ((ttv_stack, _menhir_box_hors) _menhir_cell1_BEGINR, _menhir_box_hors) _menhir_cell1_ata_arities -> _ -> _ -> _ -> _ -> _menhir_box_hors =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | ENDATA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ata_arities (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_BEGINR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_43 _2 _5 in
          _menhir_goto_tree_automata _menhir_stack _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_goto_ata_transitions : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _v _tok
      | MenhirState088 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState102 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_104 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LIDENT _menhir_cell0_LIDENT, ttv_result) _menhir_cell1_dnf -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_dnf (_menhir_stack, _, _4) = _menhir_stack in
      let MenhirCell0_LIDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _6 = _v in
      let _v = _menhir_action_10 _1 _2 _4 _6 in
      _menhir_goto_ata_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_103 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_11 () in
      _menhir_goto_ata_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_089 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v ->
          let _menhir_stack = MenhirCell0_LIDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS_RANGLE ->
              let _menhir_s = MenhirState091 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_12 () in
      _menhir_goto_cube _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_cube : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState106 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_105 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_cube (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState106 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PERIOD ->
          let _1 = _v in
          let _v = _menhir_action_16 _1 in
          _menhir_goto_dnf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | AND ->
                          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
                          let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
                          let _menhir_stack = MenhirCell0_LIDENT (_menhir_stack, _v_0) in
                          let _menhir_s = MenhirState098 in
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | TRUE ->
                              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | LPAREN ->
                              _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | _ ->
                              _eRR ())
                      | OR | PERIOD ->
                          let (_2, _4) = (_v, _v_0) in
                          let _v = _menhir_action_13 _2 _4 in
                          _menhir_goto_cube _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_15 () in
      _menhir_goto_dnf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_dnf : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState106 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState091 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_107 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_cube -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_cube (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_17 _1 _3 in
      _menhir_goto_dnf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_101 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LIDENT _menhir_cell0_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_dnf (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PERIOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LIDENT _v_0 ->
              _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState102
          | EOF ->
              _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
          | ENDATA ->
              let _v_1 = _menhir_action_09 () in
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN _menhir_cell0_INT _menhir_cell0_LIDENT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_LIDENT (_menhir_stack, _4) = _menhir_stack in
      let MenhirCell0_INT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _7 = _v in
      let _v = _menhir_action_14 _2 _4 _7 in
      _menhir_goto_cube _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_124 : type  ttv_stack. ((ttv_stack, _menhir_box_tree_automata) _menhir_cell1_BEGINR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_tree_automata) _menhir_state -> _ -> _menhir_box_tree_automata =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ata_arities (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ENDR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGINATA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_0 ->
                  _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState126
              | EOF ->
                  _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
              | ENDATA ->
                  let _v_1 = _menhir_action_09 () in
                  _menhir_run_127 _menhir_stack _v_1 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_086 : type  ttv_stack. ((ttv_stack, _menhir_box_hors) _menhir_cell1_BEGINR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_hors) _menhir_state -> _ -> _menhir_box_hors =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ata_arities (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ENDR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGINATA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_0 ->
                  _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState088
              | EOF ->
                  _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
              | ENDATA ->
                  let _v_1 = _menhir_action_09 () in
                  _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_goto_ata_arities : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState123 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_085 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LIDENT _menhir_cell0_INT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_INT (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_07 _1 _3 _5 in
      _menhir_goto_ata_arities _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_084 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_08 () in
      _menhir_goto_ata_arities _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_080 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS_RANGLE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v_0 ->
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v_0) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PERIOD ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LIDENT _v_1 ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState083
                  | EOF ->
                      _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
                  | ENDR ->
                      let _v_2 = _menhir_action_06 () in
                      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_003 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState003
      | EQUAL | MINUS_RANGLE ->
          let _v_1 = _menhir_action_22 () in
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState003 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState004
      | EQUAL | EQUAL_RANGLE | MINUS_RANGLE | PERIOD ->
          let _v_1 = _menhir_action_22 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LIDENT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_23 _1 _2 in
      _menhir_goto_lidents _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_lidents : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState136 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_137 : type  ttv_stack. ((ttv_stack, _menhir_box_tta_transitions) _menhir_cell1_LIDENT _menhir_cell0_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_tta_transitions) _menhir_state -> _ -> _menhir_box_tta_transitions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lidents (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PERIOD ->
          let _menhir_s = MenhirState138 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LIDENT _v ->
              _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | EOF ->
              _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_134 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_tta_transitions) _menhir_state -> _menhir_box_tta_transitions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v_0 ->
          let _menhir_stack = MenhirCell0_LIDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS_RANGLE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_1 ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState136
              | PERIOD ->
                  let _v_2 = _menhir_action_22 () in
                  _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState136 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LIDENT _menhir_cell0_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lidents (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PERIOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LIDENT _v_0 ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState047
          | EOF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState047
          | ENDA ->
              let _v_1 = _menhir_action_45 () in
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v_0 ->
          let _menhir_stack = MenhirCell0_LIDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS_RANGLE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_1 ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState045
              | PERIOD ->
                  let _v_2 = _menhir_action_22 () in
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState045 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lidents (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL_RANGLE ->
          let _menhir_s = MenhirState024 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LIDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GEN ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COPY ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COERCE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CASE ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_34 _1 in
      _menhir_goto_simple_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_simple_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState036 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState034 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState032 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState017 ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState014 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_36 _1 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState036 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_037 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_UIDENT, ttv_result) _menhir_cell1_lidents as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState037
      | PERIOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_lidents (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_UIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_28 _1 _2 _4 in
          _menhir_goto_rule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
      | LIDENT _v_1 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState037
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState037
      | _ ->
          _eRR ()
  
  and _menhir_goto_rule : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState119 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_119 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_rules) _menhir_state -> _ -> _menhir_box_rules =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_rule (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState119
      | EOF ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_rules) _menhir_state -> _ -> _menhir_box_rules =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      let _v = _menhir_action_31 () in
      _menhir_goto_rules _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_rules : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState116 ->
          _menhir_run_118 _menhir_stack _v
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState002 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_120 : type  ttv_stack. (ttv_stack, _menhir_box_rules) _menhir_cell1_rule -> _ -> _ -> _ -> _ -> _menhir_box_rules =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_rule (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_30 _1 _2 in
      _menhir_goto_rules _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_076 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_hors) _menhir_state -> _ -> _menhir_box_hors =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_rules (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ENDG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGINR ->
              let _menhir_stack = MenhirCell1_BEGINR (_menhir_stack, MenhirState077) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_0 ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState079
              | EOF ->
                  _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
              | ENDR ->
                  let _v_1 = _menhir_action_06 () in
                  _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState079 _tok
              | _ ->
                  _eRR ())
          | BEGINA ->
              let _menhir_stack = MenhirCell1_BEGINA (_menhir_stack, MenhirState077) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_2 ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState110
              | EOF ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
              | ENDA ->
                  let _v_3 = _menhir_action_45 () in
                  _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 _tok
              | _ ->
                  _eRR ())
          | _ ->
              let _ = _menhir_action_44 () in
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_rule -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_rule (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_30 _1 _2 in
      _menhir_goto_rules _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_040 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_hmtt) _menhir_state -> _ -> _menhir_box_hmtt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_rules (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ENDG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGINA ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v_0 ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState042
              | EOF ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
              | ENDA ->
                  let _v_1 = _menhir_action_45 () in
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState042 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_rule (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState070
      | EOF ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
      | ENDG ->
          let _v_1 = _menhir_action_29 () in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_31 () in
      _menhir_goto_rules _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState009 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INT _v ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GEN ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COPY ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COERCE ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CASE ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_33 _1 in
      _menhir_goto_simple_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_35 _1 in
      _menhir_goto_simple_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _2 = _v in
          let _v = _menhir_action_41 _2 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COPY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState014 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INT _v ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COERCE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v ->
          let _menhir_stack = MenhirCell0_LIDENT (_menhir_stack, _v) in
          let _menhir_s = MenhirState017 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LIDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CASE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v ->
          let _menhir_stack = MenhirCell0_LIDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OF ->
              let _menhir_s = MenhirState021 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v_0 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState022
      | EQUAL_RANGLE ->
          let _v_1 = _menhir_action_22 () in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState022 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_UIDENT, ttv_result) _menhir_cell1_lidents as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState034
      | PERIOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_lidents (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_UIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_27 _1 _2 _4 in
          _menhir_goto_rule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState034
      | LIDENT _v_1 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState034
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState034
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState032
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_32 _2 in
          _menhir_goto_simple_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | LIDENT _v_1 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState032
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState032
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LIDENT, ttv_result) _menhir_cell1_lidents as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UIDENT _v_0 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState025
      | LPAREN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | LIDENT _v_1 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState025
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState025
      | BAR | PERIOD | RPAREN ->
          let MenhirCell1_lidents (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_24 _1 _2 _4 in
          (match (_tok : MenhirBasics.token) with
          | BAR ->
              let _menhir_stack = MenhirCell1_pat (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState030 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LIDENT _v ->
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | INT _ | LIDENT _ | LPAREN | PERIOD | RPAREN | UIDENT _ ->
              let _1 = _v in
              let _v = _menhir_action_25 _1 in
              _menhir_goto_pats _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_pats : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState030 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_031 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pat -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pat (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_26 _1 _3 in
      _menhir_goto_pats _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_028 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_CASE _menhir_cell0_LIDENT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_LIDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_CASE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_38 _2 _4 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_37 _1 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_018 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_COERCE _menhir_cell0_LIDENT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_LIDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_COERCE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_39 _2 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_015 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_COPY -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_COPY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_40 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_006 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_UIDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lidents (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MINUS_RANGLE ->
          let _menhir_s = MenhirState007 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LIDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GEN ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COPY ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COERCE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CASE ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_s = MenhirState036 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LIDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | GEN ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COPY ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COERCE ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CASE ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_hmtt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | BEGING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002
          | EOF ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
          | ENDG ->
              let _v = _menhir_action_29 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002 _tok
          | _ ->
              _eRR ())
      | _ ->
          let _v = _menhir_action_19 () in
          MenhirBox_hmtt _v
  
  let _menhir_run_073 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_hors =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | BEGING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075
          | EOF ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
          | ENDG ->
              let _v = _menhir_action_29 () in
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
          | _ ->
              _eRR ())
      | _ ->
          let _v = _menhir_action_21 () in
          MenhirBox_hors _v
  
  let _menhir_run_116 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_rules =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState116 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | EOF ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_121 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_tree_automata =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | BEGINR ->
          let _menhir_stack = MenhirCell1_BEGINR (_menhir_stack, MenhirState121) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LIDENT _v ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123
          | EOF ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
          | ENDR ->
              let _v = _menhir_action_06 () in
              _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
          | _ ->
              _eRR ())
      | BEGINA ->
          let _menhir_stack = MenhirCell1_BEGINA (_menhir_stack, MenhirState121) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LIDENT _v ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState129
          | EOF ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
          | ENDA ->
              let _v = _menhir_action_45 () in
              _menhir_run_130 _menhir_stack _v _tok
          | _ ->
              _eRR ())
      | _ ->
          let _v = _menhir_action_44 () in
          MenhirBox_tree_automata _v
  
  let _menhir_run_133 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_tta_transitions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState133 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LIDENT _v ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | EOF ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_142 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_typedefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState142 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LIDENT _v ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | EOF ->
          _menhir_run_143 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
end

let typedefs =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_typedefs v = _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let tta_transitions =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_tta_transitions v = _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let tree_automata =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_tree_automata v = _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let rules =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_rules v = _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let hors =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_hors v = _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let hmtt =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_hmtt v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
