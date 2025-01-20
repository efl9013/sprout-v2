
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TRUE
    | SKIP
    | SEMI
    | RPAREN
    | RBLOCK
    | OR
    | NOT
    | NEVER
    | LPAREN
    | LBLOCK
    | IF
    | ID of (
# 11 "lib/c/baParsing.mly"
       (string)
# 26 "lib/c/baParsing.ml"
  )
    | GOTO
    | FI
    | FALSE
    | EOF
    | CORONCORON
    | CORON
    | ARROW
    | AND
  
end

include MenhirBasics

# 1 "lib/c/baParsing.mly"
  
  open Ast
  open Ast.LogicOld

# 46 "lib/c/baParsing.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState02 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 02.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState06 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 06.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState07 : (('s, _menhir_box_toplevel) _menhir_cell1_CORONCORON, _menhir_box_toplevel) _menhir_state
    (** State 07.
        Stack shape : CORONCORON.
        Start symbol: toplevel. *)

  | MenhirState09 : (('s, _menhir_box_toplevel) _menhir_cell1_NOT, _menhir_box_toplevel) _menhir_state
    (** State 09.
        Stack shape : NOT.
        Start symbol: toplevel. *)

  | MenhirState10 : (('s, _menhir_box_toplevel) _menhir_cell1_LPAREN, _menhir_box_toplevel) _menhir_state
    (** State 10.
        Stack shape : LPAREN.
        Start symbol: toplevel. *)

  | MenhirState13 : (('s, _menhir_box_toplevel) _menhir_cell1_formula_unary, _menhir_box_toplevel) _menhir_state
    (** State 13.
        Stack shape : formula_unary.
        Start symbol: toplevel. *)

  | MenhirState18 : (('s, _menhir_box_toplevel) _menhir_cell1_formula_and, _menhir_box_toplevel) _menhir_state
    (** State 18.
        Stack shape : formula_and.
        Start symbol: toplevel. *)

  | MenhirState29 : (('s, _menhir_box_toplevel) _menhir_cell1_cond, _menhir_box_toplevel) _menhir_state
    (** State 29.
        Stack shape : cond.
        Start symbol: toplevel. *)

  | MenhirState37 : (('s, _menhir_box_toplevel) _menhir_cell1_state, _menhir_box_toplevel) _menhir_state
    (** State 37.
        Stack shape : state.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_cond = 
  | MenhirCell1_cond of 's * ('s, 'r) _menhir_state * (string * Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_formula_and = 
  | MenhirCell1_formula_and of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_formula_unary = 
  | MenhirCell1_formula_unary of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_state = 
  | MenhirCell1_state of 's * ('s, 'r) _menhir_state * ((string * string * Ast.LogicOld.Formula.t) list)

and ('s, 'r) _menhir_cell1_CORONCORON = 
  | MenhirCell1_CORONCORON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 11 "lib/c/baParsing.mly"
       (string)
# 114 "lib/c/baParsing.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of ((string * string * Ast.LogicOld.Formula.t) list) [@@unboxed]

let _menhir_action_01 =
  fun fml id ->
    (
# 39 "lib/c/baParsing.mly"
                                            ( (id, fml) )
# 131 "lib/c/baParsing.ml"
     : (string * Ast.LogicOld.Formula.t))

let _menhir_action_02 =
  fun c ->
    (
# 35 "lib/c/baParsing.mly"
           ( [c] )
# 139 "lib/c/baParsing.ml"
     : ((string * Ast.LogicOld.Formula.t) list))

let _menhir_action_03 =
  fun c toes ->
    (
# 36 "lib/c/baParsing.mly"
                      ( c :: toes )
# 147 "lib/c/baParsing.ml"
     : ((string * Ast.LogicOld.Formula.t) list))

let _menhir_action_04 =
  fun fml ->
    (
# 42 "lib/c/baParsing.mly"
                   ( fml )
# 155 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_05 =
  fun fml ->
    (
# 49 "lib/c/baParsing.mly"
                      ( fml )
# 163 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_06 =
  fun fml1 fml2 ->
    (
# 50 "lib/c/baParsing.mly"
                                            ( Formula.mk_and fml1 fml2 ~info:Dummy )
# 171 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_07 =
  fun id ->
    (
# 57 "lib/c/baParsing.mly"
          ( Formula.mk_atom (Atom.mk_app (Predicate.Var (Ident.Pvar id, [])) [] ~info:Dummy) ~info:Dummy )
# 179 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_08 =
  fun () ->
    (
# 58 "lib/c/baParsing.mly"
         ( Formula.mk_atom (Atom.mk_true () ~info:Dummy) ~info:Dummy )
# 187 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_09 =
  fun fml ->
    (
# 59 "lib/c/baParsing.mly"
                              ( fml )
# 195 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_10 =
  fun fml ->
    (
# 45 "lib/c/baParsing.mly"
                    ( fml )
# 203 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_11 =
  fun fml1 fml2 ->
    (
# 46 "lib/c/baParsing.mly"
                                        ( Formula.mk_or fml1 fml2 ~info:Dummy )
# 211 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_12 =
  fun fml ->
    (
# 53 "lib/c/baParsing.mly"
                     ( fml )
# 219 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_13 =
  fun fml ->
    (
# 54 "lib/c/baParsing.mly"
                          ( Formula.mk_neg fml ~info:Dummy )
# 227 "lib/c/baParsing.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_14 =
  fun id ->
    (
# 25 "lib/c/baParsing.mly"
                     ( [id, id, Formula.mk_atom (Atom.mk_true () ~info:Dummy) ~info:Dummy] )
# 235 "lib/c/baParsing.ml"
     : ((string * string * Ast.LogicOld.Formula.t) list))

let _menhir_action_15 =
  fun id toes ->
    (
# 26 "lib/c/baParsing.mly"
                                     (
    List.map (fun (to_id, fml) -> id, to_id, fml) toes
  )
# 245 "lib/c/baParsing.ml"
     : ((string * string * Ast.LogicOld.Formula.t) list))

let _menhir_action_16 =
  fun t ->
    (
# 21 "lib/c/baParsing.mly"
            ( t )
# 253 "lib/c/baParsing.ml"
     : ((string * string * Ast.LogicOld.Formula.t) list))

let _menhir_action_17 =
  fun t1 t2 ->
    (
# 22 "lib/c/baParsing.mly"
                       ( t1 @ t2 )
# 261 "lib/c/baParsing.ml"
     : ((string * string * Ast.LogicOld.Formula.t) list))

let _menhir_action_18 =
  fun t ->
    (
# 18 "lib/c/baParsing.mly"
                                     ( t )
# 269 "lib/c/baParsing.ml"
     : ((string * string * Ast.LogicOld.Formula.t) list))

let _menhir_action_19 =
  fun () ->
    (
# 31 "lib/c/baParsing.mly"
          ( [] )
# 277 "lib/c/baParsing.ml"
     : ((string * Ast.LogicOld.Formula.t) list))

let _menhir_action_20 =
  fun toes ->
    (
# 32 "lib/c/baParsing.mly"
                     ( toes )
# 285 "lib/c/baParsing.ml"
     : ((string * Ast.LogicOld.Formula.t) list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ARROW ->
        "ARROW"
    | CORON ->
        "CORON"
    | CORONCORON ->
        "CORONCORON"
    | EOF ->
        "EOF"
    | FALSE ->
        "FALSE"
    | FI ->
        "FI"
    | GOTO ->
        "GOTO"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | LBLOCK ->
        "LBLOCK"
    | LPAREN ->
        "LPAREN"
    | NEVER ->
        "NEVER"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | RBLOCK ->
        "RBLOCK"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | SKIP ->
        "SKIP"
    | TRUE ->
        "TRUE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let t = _v in
          let _v = _menhir_action_18 t in
          MenhirBox_toplevel _v
      | _ ->
          _eRR ()
  
  let rec _menhir_goto_states : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState37 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState02 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_state -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_state (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_17 t1 t2 in
      _menhir_goto_states _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | CORON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SKIP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let id = _v in
              let _v = _menhir_action_14 id in
              _menhir_goto_state _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | IF ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState06 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | CORONCORON ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | FALSE ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_19 () in
              _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_state : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_state (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState37
      | RBLOCK ->
          let t = _v in
          let _v = _menhir_action_16 t in
          _menhir_goto_states _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CORONCORON (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_08 () in
      _menhir_goto_formula_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_formula_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let fml = _v in
      let _v = _menhir_action_12 fml in
      _menhir_goto_formula_unary _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_formula_unary : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState09 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let fml = _v in
      let _v = _menhir_action_13 fml in
      _menhir_goto_formula_unary _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_formula_unary (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState13 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ARROW | OR | RPAREN ->
          let fml = _v in
          let _v = _menhir_action_05 fml in
          _menhir_goto_formula_and _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState09 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState10 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let id = _v in
      let _v = _menhir_action_07 id in
      _menhir_goto_formula_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_formula_and : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState07 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formula_and (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState18 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ARROW | RPAREN ->
          let fml = _v in
          let _v = _menhir_action_10 fml in
          _menhir_goto_formula_or _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_formula_or : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState18 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_formula_and -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_formula_and (_menhir_stack, _menhir_s, fml1) = _menhir_stack in
      let fml2 = _v in
      let _v = _menhir_action_11 fml1 fml2 in
      _menhir_goto_formula_or _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let fml = _v in
      let _v = _menhir_action_04 fml in
      _menhir_goto_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_formula : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState07 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState10 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CORONCORON -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | GOTO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let MenhirCell1_CORONCORON (_menhir_stack, _menhir_s) = _menhir_stack in
                  let (id, fml) = (_v_0, _v) in
                  let _v = _menhir_action_01 fml id in
                  (match (_tok : MenhirBasics.token) with
                  | CORONCORON ->
                      let _menhir_stack = MenhirCell1_cond (_menhir_stack, _menhir_s, _v) in
                      _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
                  | FI ->
                      let c = _v in
                      let _v = _menhir_action_02 c in
                      _menhir_goto_conds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_conds : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState29 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState06 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_cond -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_cond (_menhir_stack, _menhir_s, c) = _menhir_stack in
      let toes = _v in
      let _v = _menhir_action_03 c toes in
      _menhir_goto_conds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_27 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let toes = _v in
      let _v = _menhir_action_20 toes in
      _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_transition : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, id) = _menhir_stack in
          let toes = _v in
          let _v = _menhir_action_15 id toes in
          _menhir_goto_state _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let fml = _v in
          let _v = _menhir_action_09 fml in
          _menhir_goto_formula_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_formula_unary -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_formula_unary (_menhir_stack, _menhir_s, fml1) = _menhir_stack in
      let fml2 = _v in
      let _v = _menhir_action_06 fml1 fml2 in
      _menhir_goto_formula_and _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NEVER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBLOCK ->
              let _menhir_s = MenhirState02 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
