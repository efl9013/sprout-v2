
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | RPAREN
    | LPAREN
    | EOF
    | ATOM of (
# 6 "lib/SMT/parser.mly"
       (string)
# 18 "lib/SMT/parser.ml"
  )
  
end

include MenhirBasics

# 1 "lib/SMT/parser.mly"
  


# 29 "lib/SMT/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState01 : (('s, _menhir_box_program) _menhir_cell1_LPAREN, _menhir_box_program) _menhir_state
    (** State 01.
        Stack shape : LPAREN.
        Start symbol: program. *)

  | MenhirState03 : (('s, _menhir_box_program) _menhir_cell1_sexp, _menhir_box_program) _menhir_state
    (** State 03.
        Stack shape : sexp.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_sexp = 
  | MenhirCell1_sexp of 's * ('s, 'r) _menhir_state * (Ppx_sexp_conv_lib.Sexp.t)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (Sexplib0.Sexp.t list) [@@unboxed]

let _menhir_action_1 =
  fun _1 ->
    (
# 20 "lib/SMT/parser.mly"
           ( Ppx_sexp_conv_lib.Sexp.Atom (_1) )
# 62 "lib/SMT/parser.ml"
     : (Sexplib0.Sexp.t))

let _menhir_action_2 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 70 "lib/SMT/parser.ml"
     : (Sexplib0.Sexp.t list))

let _menhir_action_3 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 78 "lib/SMT/parser.ml"
     : (Sexplib0.Sexp.t list))

let _menhir_action_4 =
  fun _1 ->
    (
# 14 "lib/SMT/parser.mly"
                        ( _1 )
# 86 "lib/SMT/parser.ml"
     : (Sexplib0.Sexp.t list))

let _menhir_action_5 =
  fun _2 ->
    (
# 17 "lib/SMT/parser.mly"
                             ( Ppx_sexp_conv_lib.Sexp.List (_2) )
# 94 "lib/SMT/parser.ml"
     : (Ppx_sexp_conv_lib.Sexp.t))

let _menhir_action_6 =
  fun _1 ->
    (
# 18 "lib/SMT/parser.mly"
         ( _1 )
# 102 "lib/SMT/parser.ml"
     : (Ppx_sexp_conv_lib.Sexp.t))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ATOM _ ->
        "ATOM"
    | EOF ->
        "EOF"
    | LPAREN ->
        "LPAREN"
    | RPAREN ->
        "RPAREN"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_4 _1 in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | ATOM _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
      | RPAREN ->
          let _v = _menhir_action_2 () in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_1 _1 in
      let _1 = _v in
      let _v = _menhir_action_6 _1 in
      _menhir_goto_sexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_sexp : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_sexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | ATOM _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState03
      | EOF | RPAREN ->
          let _v_1 = _menhir_action_2 () in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
  
  and _menhir_run_04 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_sexp -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_sexp (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_3 x xs in
      _menhir_goto_list_sexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_sexp_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_09 _menhir_stack _v _tok
      | MenhirState01 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_5 _2 in
          _menhir_goto_sexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | ATOM _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | EOF ->
          let _v = _menhir_action_2 () in
          _menhir_run_09 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
