
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHERE
    | TRUE
    | SEMI
    | RPAREN
    | REALL of (
# 17 "lib/muCLP/HESParser.mly"
       (string)
# 19 "lib/muCLP/HESParser.ml"
  )
    | REAL
    | PREDSYM of (
# 15 "lib/muCLP/HESParser.mly"
       (Ast.LogicOld.pred_sym)
# 25 "lib/muCLP/HESParser.ml"
  )
    | OR
    | NOT
    | MULT
    | MOD
    | MINUS
    | LPAREN
    | INTL of (
# 16 "lib/muCLP/HESParser.mly"
       (int)
# 36 "lib/muCLP/HESParser.ml"
  )
    | INT
    | IMPLY
    | IFF
    | ID of (
# 20 "lib/muCLP/HESParser.mly"
       (string)
# 44 "lib/muCLP/HESParser.ml"
  )
    | FALSE
    | EQFIX of (
# 9 "lib/muCLP/HESParser.mly"
       (Ast.LogicOld.Predicate.fixpoint)
# 50 "lib/muCLP/HESParser.ml"
  )
    | EOF
    | DOT
    | DIV
    | CORON
    | BOOL
    | BINDER of (
# 10 "lib/muCLP/HESParser.mly"
       (Ast.LogicOld.Formula.binder)
# 60 "lib/muCLP/HESParser.ml"
  )
    | AND
    | ADD
  
end

include MenhirBasics

# 1 "lib/muCLP/HESParser.mly"
  
  open Core
  open Ast
  open Ast.LogicOld

# 75 "lib/muCLP/HESParser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_formula) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: formula. *)

  | MenhirState03 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 03.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState04 : ((('s, 'r) _menhir_cell1_NOT, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 04.
        Stack shape : NOT NOT.
        Start symbol: <undetermined>. *)

  | MenhirState05 : ((('s, 'r) _menhir_cell1_NOT, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 05.
        Stack shape : NOT LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState06 : (('s, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 06.
        Stack shape : MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState07 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 07.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState12 : (('s, 'r) _menhir_cell1_T_numMultDivMod, 'r) _menhir_state
    (** State 12.
        Stack shape : T_numMultDivMod.
        Start symbol: <undetermined>. *)

  | MenhirState15 : (('s, 'r) _menhir_cell1_T_numMultDivMod, 'r) _menhir_state
    (** State 15.
        Stack shape : T_numMultDivMod.
        Start symbol: <undetermined>. *)

  | MenhirState17 : (('s, 'r) _menhir_cell1_T_numMultDivMod, 'r) _menhir_state
    (** State 17.
        Stack shape : T_numMultDivMod.
        Start symbol: <undetermined>. *)

  | MenhirState20 : (('s, 'r) _menhir_cell1_T_numAddSub, 'r) _menhir_state
    (** State 20.
        Stack shape : T_numAddSub.
        Start symbol: <undetermined>. *)

  | MenhirState22 : (('s, 'r) _menhir_cell1_T_numAddSub, 'r) _menhir_state
    (** State 22.
        Stack shape : T_numAddSub.
        Start symbol: <undetermined>. *)

  | MenhirState27 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 27.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState28 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 28.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState29 : (('s, 'r) _menhir_cell1_T_numAtom, 'r) _menhir_state
    (** State 29.
        Stack shape : T_numAtom.
        Start symbol: <undetermined>. *)

  | MenhirState33 : (('s, 'r) _menhir_cell1_BINDER, 'r) _menhir_state
    (** State 33.
        Stack shape : BINDER.
        Start symbol: <undetermined>. *)

  | MenhirState41 : (('s, 'r) _menhir_cell1_LPAREN _menhir_cell0_ID _menhir_cell0_Sort, 'r) _menhir_state
    (** State 41.
        Stack shape : LPAREN ID Sort.
        Start symbol: <undetermined>. *)

  | MenhirState44 : ((('s, 'r) _menhir_cell1_BINDER, 'r) _menhir_cell1_Bounds, 'r) _menhir_state
    (** State 44.
        Stack shape : BINDER Bounds.
        Start symbol: <undetermined>. *)

  | MenhirState46 : (('s, 'r) _menhir_cell1_T_num _menhir_cell0_PREDSYM, 'r) _menhir_state
    (** State 46.
        Stack shape : T_num PREDSYM.
        Start symbol: <undetermined>. *)

  | MenhirState50 : (('s, 'r) _menhir_cell1_FormulaOr, 'r) _menhir_state
    (** State 50.
        Stack shape : FormulaOr.
        Start symbol: <undetermined>. *)

  | MenhirState52 : (('s, 'r) _menhir_cell1_FormulaNeg, 'r) _menhir_state
    (** State 52.
        Stack shape : FormulaNeg.
        Start symbol: <undetermined>. *)

  | MenhirState58 : (('s, 'r) _menhir_cell1_FormulaAnd, 'r) _menhir_state
    (** State 58.
        Stack shape : FormulaAnd.
        Start symbol: <undetermined>. *)

  | MenhirState61 : (('s, 'r) _menhir_cell1_FormulaImply, 'r) _menhir_state
    (** State 61.
        Stack shape : FormulaImply.
        Start symbol: <undetermined>. *)

  | MenhirState76 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 76.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState79 : (('s, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_state
    (** State 79.
        Stack shape : Formula.
        Start symbol: toplevel. *)

  | MenhirState80 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 80.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState84 : ((('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_cell1_Bounds _menhir_cell0_EQFIX, _menhir_box_toplevel) _menhir_state
    (** State 84.
        Stack shape : ID Bounds EQFIX.
        Start symbol: toplevel. *)

  | MenhirState89 : (('s, _menhir_box_toplevel) _menhir_cell1_Fun, _menhir_box_toplevel) _menhir_state
    (** State 89.
        Stack shape : Fun.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_Bounds = 
  | MenhirCell1_Bounds of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.sort_env_list)

and ('s, 'r) _menhir_cell1_Formula = 
  | MenhirCell1_Formula of 's * ('s, 'r) _menhir_state * (Problem.query)

and ('s, 'r) _menhir_cell1_FormulaAnd = 
  | MenhirCell1_FormulaAnd of 's * ('s, 'r) _menhir_state * (Problem.query)

and ('s, 'r) _menhir_cell1_FormulaImply = 
  | MenhirCell1_FormulaImply of 's * ('s, 'r) _menhir_state * (Problem.query)

and ('s, 'r) _menhir_cell1_FormulaNeg = 
  | MenhirCell1_FormulaNeg of 's * ('s, 'r) _menhir_state * (Problem.query)

and ('s, 'r) _menhir_cell1_FormulaOr = 
  | MenhirCell1_FormulaOr of 's * ('s, 'r) _menhir_state * (Problem.query)

and ('s, 'r) _menhir_cell1_Fun = 
  | MenhirCell1_Fun of 's * ('s, 'r) _menhir_state * (Pred.t)

and 's _menhir_cell0_Sort = 
  | MenhirCell0_Sort of 's * (Ast.LogicOld.Sort.t)

and ('s, 'r) _menhir_cell1_T_num = 
  | MenhirCell1_T_num of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_T_numAddSub = 
  | MenhirCell1_T_numAddSub of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_T_numAtom = 
  | MenhirCell1_T_numAtom of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_T_numMultDivMod = 
  | MenhirCell1_T_numMultDivMod of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_BINDER = 
  | MenhirCell1_BINDER of 's * ('s, 'r) _menhir_state * (
# 10 "lib/muCLP/HESParser.mly"
       (Ast.LogicOld.Formula.binder)
# 254 "lib/muCLP/HESParser.ml"
)

and 's _menhir_cell0_EQFIX = 
  | MenhirCell0_EQFIX of 's * (
# 9 "lib/muCLP/HESParser.mly"
       (Ast.LogicOld.Predicate.fixpoint)
# 261 "lib/muCLP/HESParser.ml"
)

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 20 "lib/muCLP/HESParser.mly"
       (string)
# 268 "lib/muCLP/HESParser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 20 "lib/muCLP/HESParser.mly"
       (string)
# 275 "lib/muCLP/HESParser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_PREDSYM = 
  | MenhirCell0_PREDSYM of 's * (
# 15 "lib/muCLP/HESParser.mly"
       (Ast.LogicOld.pred_sym)
# 291 "lib/muCLP/HESParser.ml"
)

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (Problem.t) [@@unboxed]

and _menhir_box_formula = 
  | MenhirBox_formula of (Problem.query) [@@unboxed]

let _menhir_action_02 =
  fun args funname ->
    (
# 92 "lib/muCLP/HESParser.mly"
                                (
      Atom.mk_pvar_app (Ident.Pvar funname) (List.map args ~f:Term.sort_of) args
    )
# 307 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_03 =
  fun atom ->
    (
# 95 "lib/muCLP/HESParser.mly"
                ( atom )
# 315 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_04 =
  fun () ->
    (
# 96 "lib/muCLP/HESParser.mly"
         ( Atom.True Dummy )
# 323 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_05 =
  fun () ->
    (
# 97 "lib/muCLP/HESParser.mly"
          ( Atom.False Dummy )
# 331 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_06 =
  fun () ->
    (
# 100 "lib/muCLP/HESParser.mly"
    ( [] )
# 339 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_07 =
  fun arg args ->
    (
# 101 "lib/muCLP/HESParser.mly"
                                   ( arg :: args )
# 347 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_08 =
  fun () ->
    (
# 152 "lib/muCLP/HESParser.mly"
    ( [] )
# 355 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.sort_env_list))

let _menhir_action_09 =
  fun bounds sort varname ->
    (
# 153 "lib/muCLP/HESParser.mly"
                                                           (
    (Ident.Tvar varname, sort) :: bounds
  )
# 365 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.sort_env_list))

let _menhir_action_10 =
  fun fml ->
    (
# 55 "lib/muCLP/HESParser.mly"
                      ( fml )
# 373 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_11 =
  fun left right ->
    (
# 74 "lib/muCLP/HESParser.mly"
                                         ( Formula.mk_and left right )
# 381 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_12 =
  fun fml ->
    (
# 75 "lib/muCLP/HESParser.mly"
                   ( fml )
# 389 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_13 =
  fun atom ->
    (
# 86 "lib/muCLP/HESParser.mly"
              ( Formula.mk_atom atom )
# 397 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_14 =
  fun fml ->
    (
# 87 "lib/muCLP/HESParser.mly"
                              ( fml )
# 405 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_15 =
  fun binder body bounds ->
    (
# 58 "lib/muCLP/HESParser.mly"
                                                 ( Formula.mk_bind binder bounds body )
# 413 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_16 =
  fun fml ->
    (
# 59 "lib/muCLP/HESParser.mly"
                   ( fml )
# 421 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_17 =
  fun left right ->
    (
# 62 "lib/muCLP/HESParser.mly"
                                             ( Formula.mk_iff left right )
# 429 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_18 =
  fun fml ->
    (
# 63 "lib/muCLP/HESParser.mly"
                     ( fml )
# 437 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_19 =
  fun left right ->
    (
# 66 "lib/muCLP/HESParser.mly"
                                            ( Formula.mk_imply left right )
# 445 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_20 =
  fun fml ->
    (
# 67 "lib/muCLP/HESParser.mly"
                  ( fml )
# 453 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_21 =
  fun fml ->
    (
# 78 "lib/muCLP/HESParser.mly"
                            ( Formula.mk_neg fml )
# 461 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_22 =
  fun fml ->
    (
# 79 "lib/muCLP/HESParser.mly"
                    ( fml )
# 469 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_23 =
  fun fml ->
    (
# 82 "lib/muCLP/HESParser.mly"
                            ( Formula.mk_neg fml )
# 477 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_24 =
  fun fml ->
    (
# 83 "lib/muCLP/HESParser.mly"
                              ( fml )
# 485 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_25 =
  fun left right ->
    (
# 70 "lib/muCLP/HESParser.mly"
                                       ( Formula.mk_or left right )
# 493 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_26 =
  fun fml ->
    (
# 71 "lib/muCLP/HESParser.mly"
                   ( fml )
# 501 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_27 =
  fun body bounds fix funname ->
    (
# 48 "lib/muCLP/HESParser.mly"
                                                               (
      Pred.make fix (Ident.Pvar funname) bounds body
    )
# 511 "lib/muCLP/HESParser.ml"
     : (Pred.t))

let _menhir_action_28 =
  fun f preds ->
    (
# 44 "lib/muCLP/HESParser.mly"
                          ( f :: preds )
# 519 "lib/muCLP/HESParser.ml"
     : (Pred.t list))

let _menhir_action_29 =
  fun f ->
    (
# 45 "lib/muCLP/HESParser.mly"
               ( [f] )
# 527 "lib/muCLP/HESParser.ml"
     : (Pred.t list))

let _menhir_action_30 =
  fun () ->
    (
# 146 "lib/muCLP/HESParser.mly"
        ( T_int.SInt )
# 535 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Sort.t))

let _menhir_action_31 =
  fun () ->
    (
# 147 "lib/muCLP/HESParser.mly"
         ( T_bool.SBool )
# 543 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Sort.t))

let _menhir_action_32 =
  fun () ->
    (
# 148 "lib/muCLP/HESParser.mly"
         ( T_real.SReal )
# 551 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Sort.t))

let _menhir_action_33 =
  fun op t1 t2 ->
    (
# 135 "lib/muCLP/HESParser.mly"
                                 ( Atom.mk_app (Predicate.mk_psym op) [t1; t2] )
# 559 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_34 =
  fun t ->
    (
# 110 "lib/muCLP/HESParser.mly"
                  ( t )
# 567 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_35 =
  fun t ->
    (
# 113 "lib/muCLP/HESParser.mly"
                      ( t )
# 575 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_36 =
  fun t1 t2 ->
    (
# 114 "lib/muCLP/HESParser.mly"
                                          ( T_num.mk_nadd t1 t2 )
# 583 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_37 =
  fun t1 t2 ->
    (
# 115 "lib/muCLP/HESParser.mly"
                                            ( T_num.mk_nsub t1 t2 )
# 591 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_38 =
  fun t ->
    (
# 128 "lib/muCLP/HESParser.mly"
                          ( t )
# 599 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_39 =
  fun n ->
    (
# 129 "lib/muCLP/HESParser.mly"
           ( T_int.from_int n )
# 607 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_40 =
  fun n ->
    (
# 130 "lib/muCLP/HESParser.mly"
            ( T_real.mk_real (Q.of_string n) )
# 615 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_41 =
  fun varname ->
    (
# 131 "lib/muCLP/HESParser.mly"
               ( Term.mk_var (Ident.Tvar varname) @@ Sort.mk_fresh_svar () )
# 623 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_42 =
  fun t ->
    (
# 118 "lib/muCLP/HESParser.mly"
               ( t )
# 631 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_43 =
  fun t1 t2 ->
    (
# 119 "lib/muCLP/HESParser.mly"
                                        ( T_num.mk_nmult t1 t2 )
# 639 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_44 =
  fun t1 t2 ->
    (
# 120 "lib/muCLP/HESParser.mly"
                                       ( T_num.mk_ndiv t1 t2 )
# 647 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_45 =
  fun t1 t2 ->
    (
# 121 "lib/muCLP/HESParser.mly"
                                       ( T_int.mk_mod(*ToDo*) t1 t2 )
# 655 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_46 =
  fun t ->
    (
# 124 "lib/muCLP/HESParser.mly"
                ( t )
# 663 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_47 =
  fun t ->
    (
# 125 "lib/muCLP/HESParser.mly"
                     ( T_num.mk_nneg t )
# 671 "lib/muCLP/HESParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_48 =
  fun fml ->
    (
# 41 "lib/muCLP/HESParser.mly"
                    ( fml )
# 679 "lib/muCLP/HESParser.ml"
     : (Problem.query))

let _menhir_action_49 =
  fun preds query ->
    (
# 38 "lib/muCLP/HESParser.mly"
                                       ( Problem.make preds query )
# 687 "lib/muCLP/HESParser.ml"
     : (Problem.t))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADD ->
        "ADD"
    | AND ->
        "AND"
    | BINDER _ ->
        "BINDER"
    | BOOL ->
        "BOOL"
    | CORON ->
        "CORON"
    | DIV ->
        "DIV"
    | DOT ->
        "DOT"
    | EOF ->
        "EOF"
    | EQFIX _ ->
        "EQFIX"
    | FALSE ->
        "FALSE"
    | ID _ ->
        "ID"
    | IFF ->
        "IFF"
    | IMPLY ->
        "IMPLY"
    | INT ->
        "INT"
    | INTL _ ->
        "INTL"
    | LPAREN ->
        "LPAREN"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | MULT ->
        "MULT"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PREDSYM _ ->
        "PREDSYM"
    | REAL ->
        "REAL"
    | REALL _ ->
        "REALL"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | TRUE ->
        "TRUE"
    | WHERE ->
        "WHERE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_86 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Formula -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _v ->
      let MenhirCell1_Formula (_menhir_stack, _, query) = _menhir_stack in
      let preds = _v in
      let _v = _menhir_action_49 preds query in
      MenhirBox_toplevel _v
  
  let rec _menhir_goto_Funs : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState89 ->
          _menhir_run_90 _menhir_stack _v
      | MenhirState79 ->
          _menhir_run_86 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_90 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Fun -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _v ->
      let MenhirCell1_Fun (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let preds = _v in
      let _v = _menhir_action_28 f preds in
      _menhir_goto_Funs _menhir_stack _v _menhir_s
  
  let _menhir_run_74 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_formula =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let fml = _v in
          let _v = _menhir_action_48 fml in
          MenhirBox_formula _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_04 () in
      _menhir_goto_Atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let atom = _v in
      let _v = _menhir_action_13 atom in
      _menhir_goto_FormulaAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_FormulaAtom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let fml = _v in
      let _v = _menhir_action_22 fml in
      _menhir_goto_FormulaNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_FormulaNeg : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_FormulaNeg (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState52 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | IFF | IMPLY | OR | RPAREN | SEMI | WHERE ->
          let fml = _v in
          let _v = _menhir_action_12 fml in
          _menhir_goto_FormulaAnd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_40 n in
      _menhir_goto_T_numAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_T_numAtom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState29 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState84 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_29 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_numAtom (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | REALL _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState29
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | INTL _v_1 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState29
      | ID _v_2 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState29
      | AND | EOF | IFF | IMPLY | OR | RPAREN | SEMI | WHERE ->
          let _v_3 = _menhir_action_06 () in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState06 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_39 n in
      _menhir_goto_T_numAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let varname = _v in
      let _v = _menhir_action_41 varname in
      _menhir_goto_T_numAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_30 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numAtom -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_numAtom (_menhir_stack, _menhir_s, arg) = _menhir_stack in
      let args = _v in
      let _v = _menhir_action_07 arg args in
      _menhir_goto_AtomAppArgs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_AtomAppArgs : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState28 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_31 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, funname) = _menhir_stack in
      let args = _v in
      let _v = _menhir_action_02 args funname in
      _menhir_goto_Atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_14 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_46 t in
      _menhir_goto_T_numNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_T_numNeg : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState84 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_47 t in
      _menhir_goto_T_numNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numMultDivMod -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_44 t1 t2 in
      _menhir_goto_T_numMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_T_numMultDivMod : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState84 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_T_numAddSub as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MULT ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | EOF | IFF | IMPLY | MINUS | OR | PREDSYM _ | RPAREN | SEMI | WHERE ->
          let MenhirCell1_T_numAddSub (_menhir_stack, _menhir_s, t1) = _menhir_stack in
          let t2 = _v in
          let _v = _menhir_action_36 t1 t2 in
          _menhir_goto_T_numAddSub _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numMultDivMod -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState12 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numMultDivMod -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState15 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numMultDivMod -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState17 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_T_numAddSub : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_T_numAddSub (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState20 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ADD ->
          let _menhir_stack = MenhirCell1_T_numAddSub (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState22 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | EOF | IFF | IMPLY | OR | PREDSYM _ | RPAREN | SEMI | WHERE ->
          let t = _v in
          let _v = _menhir_action_34 t in
          _menhir_goto_T_num _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_T_num : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState27 ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState84 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_66 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_num (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PREDSYM _v_0 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_T_num -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_T_num (_menhir_stack, _, t) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_38 t in
      _menhir_goto_T_numAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_46 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_num -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _menhir_stack = MenhirCell0_PREDSYM (_menhir_stack, _v) in
      let _menhir_s = MenhirState46 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_num _menhir_cell0_PREDSYM -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_PREDSYM (_menhir_stack, op) = _menhir_stack in
      let MenhirCell1_T_num (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_33 op t1 t2 in
      let atom = _v in
      let _v = _menhir_action_03 atom in
      _menhir_goto_Atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_45 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_num (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PREDSYM _v_0 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_num (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_T_numAddSub as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MULT ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | EOF | IFF | IMPLY | MINUS | OR | PREDSYM _ | RPAREN | SEMI | WHERE ->
          let MenhirCell1_T_numAddSub (_menhir_stack, _menhir_s, t1) = _menhir_stack in
          let t2 = _v in
          let _v = _menhir_action_37 t1 t2 in
          _menhir_goto_T_numAddSub _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MULT ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | EOF | IFF | IMPLY | MINUS | OR | PREDSYM _ | RPAREN | SEMI | WHERE ->
          let t = _v in
          let _v = _menhir_action_35 t in
          _menhir_goto_T_numAddSub _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numMultDivMod -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_45 t1 t2 in
      _menhir_goto_T_numMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_T_numMultDivMod -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_numMultDivMod (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_43 t1 t2 in
      _menhir_goto_T_numMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_10 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_42 t in
      _menhir_goto_T_numMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_03 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState03 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState04 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState05 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BINDER _v ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState27 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BINDER _v ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REALL _v_0 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState28
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | INTL _v_1 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState28
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState28
      | AND | EOF | IFF | IMPLY | OR | RPAREN | SEMI | WHERE ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _v_3 = _menhir_action_06 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 _tok
      | ADD | DIV | MINUS | MOD | MULT | PREDSYM _ ->
          let varname = _v in
          let _v = _menhir_action_41 varname in
          _menhir_goto_T_numAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_05 () in
      _menhir_goto_Atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_BINDER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | DOT ->
          let _v_0 = _menhir_action_08 () in
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState33 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | CORON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_32 () in
                  _menhir_goto_Sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_30 () in
                  _menhir_goto_Sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_31 () in
                  _menhir_goto_Sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_Sort : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN _menhir_cell0_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_Sort (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
          | CORON | DOT ->
              let _v_0 = _menhir_action_08 () in
              _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN _menhir_cell0_ID _menhir_cell0_Sort -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_Sort (_menhir_stack, sort) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, varname) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let bounds = _v in
      let _v = _menhir_action_09 bounds sort varname in
      _menhir_goto_Bounds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Bounds : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState80 ->
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState33 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState41 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_81 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Bounds (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | CORON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQFIX _v ->
                  let _menhir_stack = MenhirCell0_EQFIX (_menhir_stack, _v) in
                  let _menhir_s = MenhirState84 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TRUE ->
                      _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | REALL _v ->
                      _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | NOT ->
                      _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | MINUS ->
                      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INTL _v ->
                      _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ID _v ->
                      _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FALSE ->
                      _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BINDER _v ->
                      _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_BINDER as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Bounds (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_s = MenhirState44 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BINDER _v ->
              _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_FormulaAnd : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState84 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState52 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_57 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_FormulaAnd (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState58 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | IFF | IMPLY | RPAREN | SEMI | WHERE ->
          let fml = _v in
          let _v = _menhir_action_26 fml in
          _menhir_goto_FormulaOr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_FormulaOr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState58 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState84 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_59 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_FormulaAnd -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FormulaAnd (_menhir_stack, _menhir_s, left) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_25 left right in
      _menhir_goto_FormulaOr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_49 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IMPLY ->
          let _menhir_stack = MenhirCell1_FormulaOr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState50 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | IFF | RPAREN | SEMI | WHERE ->
          let fml = _v in
          let _v = _menhir_action_20 fml in
          _menhir_goto_FormulaImply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_FormulaImply : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState61 ->
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState84 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState76 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_62 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_FormulaImply -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FormulaImply (_menhir_stack, _menhir_s, left) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_17 left right in
      _menhir_goto_FormulaIff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_FormulaIff : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let fml = _v in
      let _v = _menhir_action_16 fml in
      _menhir_goto_FormulaBinder _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_FormulaBinder : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let fml = _v in
      let _v = _menhir_action_10 fml in
      _menhir_goto_Formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState84 ->
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState76 ->
          _menhir_run_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_74 _menhir_stack _v _tok
      | MenhirState05 ->
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState44 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_85 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_cell1_Bounds _menhir_cell0_EQFIX -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_EQFIX (_menhir_stack, fix) = _menhir_stack in
      let MenhirCell1_Bounds (_menhir_stack, _, bounds) = _menhir_stack in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, funname) = _menhir_stack in
      let body = _v in
      let _v = _menhir_action_27 body bounds fix funname in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              let _menhir_stack = MenhirCell1_Fun (_menhir_stack, _menhir_s, _v) in
              _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState89
          | EOF ->
              let f = _v in
              let _v = _menhir_action_29 f in
              _menhir_goto_Funs _menhir_stack _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_80 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState80
      | CORON ->
          let _v_0 = _menhir_action_08 () in
          _menhir_run_81 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState80 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_78 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Formula (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHERE ->
          let _menhir_s = MenhirState79 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_69 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let fml = _v in
          let _v = _menhir_action_24 fml in
          _menhir_goto_FormulaNegParen _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_FormulaNegParen : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_72 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let fml = _v in
      let _v = _menhir_action_21 fml in
      _menhir_goto_FormulaNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_71 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let fml = _v in
      let _v = _menhir_action_23 fml in
      _menhir_goto_FormulaNegParen _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_67 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let fml = _v in
          let _v = _menhir_action_14 fml in
          _menhir_goto_FormulaAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_65 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_BINDER, ttv_result) _menhir_cell1_Bounds -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Bounds (_menhir_stack, _, bounds) = _menhir_stack in
      let MenhirCell1_BINDER (_menhir_stack, _menhir_s, binder) = _menhir_stack in
      let body = _v in
      let _v = _menhir_action_15 binder body bounds in
      _menhir_goto_FormulaBinder _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_60 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_FormulaImply (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState61 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REALL _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | RPAREN | SEMI | WHERE ->
          let fml = _v in
          let _v = _menhir_action_18 fml in
          _menhir_goto_FormulaIff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_56 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_FormulaOr -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FormulaOr (_menhir_stack, _menhir_s, left) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_19 left right in
      _menhir_goto_FormulaImply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_54 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_FormulaNeg -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FormulaNeg (_menhir_stack, _menhir_s, left) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_11 left right in
      _menhir_goto_FormulaAnd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_formula =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BINDER _v ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_76 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState76 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REALL _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BINDER _v ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let formula =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_formula v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
