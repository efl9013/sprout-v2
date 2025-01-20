
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UIDENT of (
# 14 "lib/grammar/regTreeExpParser.mly"
       (string)
# 15 "lib/grammar/regTreeExpParser.ml"
  )
    | TYPE
    | RPAREN
    | RBRACKET
    | QUESTION
    | LPAREN
    | LIDENT of (
# 13 "lib/grammar/regTreeExpParser.mly"
       (string)
# 25 "lib/grammar/regTreeExpParser.ml"
  )
    | LBRACKET
    | EQUAL
    | EOF
    | COMMA
    | BAR
    | AST
  
end

include MenhirBasics

# 1 "lib/grammar/regTreeExpParser.mly"
  
let print_error_information () =
  let st = Parsing.symbol_start_pos () in
  let en = Parsing.symbol_end_pos () in
  print_string ("File \"" ^ st.Lexing.pos_fname);
  Format.printf "\", line %d" st.Lexing.pos_lnum;
  Format.printf ", characters %d-%d:\n"
    (st.Lexing.pos_cnum - st.Lexing.pos_bol)
    (en.Lexing.pos_cnum - en.Lexing.pos_bol)

# 49 "lib/grammar/regTreeExpParser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: regtreeexpdefs. *)

  | MenhirState04 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_TYPE _menhir_cell0_UIDENT, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 04.
        Stack shape : TYPE UIDENT.
        Start symbol: regtreeexpdefs. *)

  | MenhirState06 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_LPAREN, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 06.
        Stack shape : LPAREN.
        Start symbol: regtreeexpdefs. *)

  | MenhirState09 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_LPAREN, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 09.
        Stack shape : LPAREN.
        Start symbol: regtreeexpdefs. *)

  | MenhirState12 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_LIDENT, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 12.
        Stack shape : LIDENT.
        Start symbol: regtreeexpdefs. *)

  | MenhirState17 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 17.
        Stack shape : regtreeexp.
        Start symbol: regtreeexpdefs. *)

  | MenhirState20 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 20.
        Stack shape : regtreeexp.
        Start symbol: regtreeexpdefs. *)

  | MenhirState27 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_LIDENT, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 27.
        Stack shape : LIDENT.
        Start symbol: regtreeexpdefs. *)

  | MenhirState33 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 33.
        Stack shape : regtreeexp.
        Start symbol: regtreeexpdefs. *)

  | MenhirState36 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 36.
        Stack shape : regtreeexp.
        Start symbol: regtreeexpdefs. *)

  | MenhirState39 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexpdef, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 39.
        Stack shape : regtreeexpdef.
        Start symbol: regtreeexpdefs. *)

  | MenhirState43 : (('s, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexpdef, _menhir_box_regtreeexpdefs) _menhir_state
    (** State 43.
        Stack shape : regtreeexpdef.
        Start symbol: regtreeexpdefs. *)


and ('s, 'r) _menhir_cell1_regtreeexp = 
  | MenhirCell1_regtreeexp of 's * ('s, 'r) _menhir_state * ((string, string) RegTreeExp.t)

and ('s, 'r) _menhir_cell1_regtreeexpdef = 
  | MenhirCell1_regtreeexpdef of 's * ('s, 'r) _menhir_state * (string * (string, string) RegTreeExp.t)

and ('s, 'r) _menhir_cell1_LIDENT = 
  | MenhirCell1_LIDENT of 's * ('s, 'r) _menhir_state * (
# 13 "lib/grammar/regTreeExpParser.mly"
       (string)
# 123 "lib/grammar/regTreeExpParser.ml"
)

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TYPE = 
  | MenhirCell1_TYPE of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_UIDENT = 
  | MenhirCell0_UIDENT of 's * (
# 14 "lib/grammar/regTreeExpParser.mly"
       (string)
# 136 "lib/grammar/regTreeExpParser.ml"
)

and _menhir_box_regtreeexpdefs = 
  | MenhirBox_regtreeexpdefs of ((string * (string, string) RegTreeExp.t) list) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 51 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Nil )
# 147 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_02 =
  fun _1 ->
    (
# 53 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Symbol _1 )
# 155 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 55 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Concat (_1, _3) )
# 163 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_04 =
  fun _1 ->
    (
# 57 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Label (_1, RegTreeExp.Nil) )
# 171 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 59 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Label (_1, _3) )
# 179 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 61 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Alter (_1, _3) )
# 187 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_07 =
  fun _1 ->
    (
# 63 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Kleene _1 )
# 195 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_08 =
  fun _1 ->
    (
# 65 "lib/grammar/regTreeExpParser.mly"
    ( RegTreeExp.Option _1 )
# 203 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_09 =
  fun _2 ->
    (
# 67 "lib/grammar/regTreeExpParser.mly"
    ( _2 )
# 211 "lib/grammar/regTreeExpParser.ml"
     : ((string, string) RegTreeExp.t))

let _menhir_action_10 =
  fun _2 _4 ->
    (
# 47 "lib/grammar/regTreeExpParser.mly"
    ( _2, _4 )
# 219 "lib/grammar/regTreeExpParser.ml"
     : (string * (string, string) RegTreeExp.t))

let _menhir_action_11 =
  fun () ->
    (
# 38 "lib/grammar/regTreeExpParser.mly"
    ( [] )
# 227 "lib/grammar/regTreeExpParser.ml"
     : ((string * (string, string) RegTreeExp.t) list))

let _menhir_action_12 =
  fun _1 _2 ->
    (
# 40 "lib/grammar/regTreeExpParser.mly"
    ( _1::_2 )
# 235 "lib/grammar/regTreeExpParser.ml"
     : ((string * (string, string) RegTreeExp.t) list))

let _menhir_action_13 =
  fun () ->
    let _ = (
# 42 "lib/grammar/regTreeExpParser.mly"
    ( print_error_information ();
      raise (Failure "Syntax error") )
# 244 "lib/grammar/regTreeExpParser.ml"
     : ((string * (string, string) RegTreeExp.t) list)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nregtreeexpdefs -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AST ->
        "AST"
    | BAR ->
        "BAR"
    | COMMA ->
        "COMMA"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | LBRACKET ->
        "LBRACKET"
    | LIDENT _ ->
        "LIDENT"
    | LPAREN ->
        "LPAREN"
    | QUESTION ->
        "QUESTION"
    | RBRACKET ->
        "RBRACKET"
    | RPAREN ->
        "RPAREN"
    | TYPE ->
        "TYPE"
    | UIDENT _ ->
        "UIDENT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_error_run_38 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v ->
      MenhirBox_regtreeexpdefs _v
  
  let _menhir_error_goto_regtreeexpdefs : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState43 ->
          _eRR ()
      | MenhirState39 ->
          _eRR ()
      | MenhirState00 ->
          _menhir_error_run_38 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let _menhir_error_run_40 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_13 () in
      _menhir_error_goto_regtreeexpdefs _menhir_stack _v _menhir_s
  
  let _menhir_error_run_43 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v _menhir_s ->
      let _menhir_stack = MenhirCell1_regtreeexpdef (_menhir_stack, _menhir_s, _v) in
      _menhir_error_run_40 _menhir_stack MenhirState43
  
  let _menhir_error_run_39 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v _menhir_s ->
      let _menhir_stack = MenhirCell1_regtreeexpdef (_menhir_stack, _menhir_s, _v) in
      _menhir_error_run_40 _menhir_stack MenhirState39
  
  let _menhir_error_goto_regtreeexpdef : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState43 ->
          _menhir_error_run_43 _menhir_stack _v _menhir_s
      | MenhirState39 ->
          _menhir_error_run_43 _menhir_stack _v _menhir_s
      | MenhirState00 ->
          _menhir_error_run_39 _menhir_stack _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  let _menhir_error_run_31 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_TYPE _menhir_cell0_UIDENT -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v ->
      let MenhirCell0_UIDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_TYPE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_10 _2 _4 in
      _menhir_error_goto_regtreeexpdef _menhir_stack _v _menhir_s
  
  let rec _menhir_error_goto_regtreeexp : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState36 ->
          _menhir_error_run_37 _menhir_stack _v
      | MenhirState33 ->
          _menhir_error_run_34 _menhir_stack _v
      | MenhirState04 ->
          _menhir_error_run_31 _menhir_stack _v
      | MenhirState27 ->
          _eRR ()
      | MenhirState06 ->
          _eRR ()
      | MenhirState09 ->
          _eRR ()
      | MenhirState20 ->
          _eRR ()
      | MenhirState17 ->
          _eRR ()
      | MenhirState12 ->
          _eRR ()
      | _ ->
          _menhir_fail ()
  
  and _menhir_error_run_37 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v ->
      let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_06 _1 _3 in
      _menhir_error_goto_regtreeexp _menhir_stack _v _menhir_s
  
  and _menhir_error_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v ->
      let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_03 _1 _3 in
      _menhir_error_goto_regtreeexp _menhir_stack _v _menhir_s
  
  let _menhir_run_38 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _v ->
      MenhirBox_regtreeexpdefs _v
  
  let rec _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexpdef -> _ -> _ -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_regtreeexpdef (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_12 _1 _2 in
          _menhir_goto_regtreeexpdefs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_regtreeexpdefs : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState43 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState39 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_38 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexpdef -> _ -> _ -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let MenhirCell1_regtreeexpdef (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_12 _1 _2 in
          _menhir_goto_regtreeexpdefs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TYPE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          let _menhir_stack = MenhirCell0_UIDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _menhir_s = MenhirState04 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UIDENT _v ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | LPAREN ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LIDENT _v ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_02 _1 in
      _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_regtreeexp : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState33 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | TYPE ->
          let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_error_goto_regtreeexp _menhir_stack _v _menhir_s
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      _menhir_reduce_08 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_reduce_08 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_08 _1 in
      _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState33 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LIDENT _v ->
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_02 _1 in
      _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LIDENT _v ->
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v_0 ->
              let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState12
          | RBRACKET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v in
              let _v = _menhir_action_04 _1 in
              _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | LPAREN ->
              let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
          | LIDENT _v_1 ->
              let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState12
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UIDENT _v_0 ->
              let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState27
          | RBRACKET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v in
              let _v = _menhir_action_04 _1 in
              _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | LPAREN ->
              let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LIDENT _v_1 ->
              let _menhir_stack = MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState27
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState36 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      _menhir_reduce_07 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_reduce_07 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_07 _1 in
      _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR | EOF | TYPE ->
          let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_error_goto_regtreeexp _menhir_stack _v _menhir_s
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_TYPE _menhir_cell0_UIDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | TYPE ->
          let MenhirCell0_UIDENT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_TYPE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_10 _2 _4 in
          _menhir_goto_regtreeexpdef _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          let MenhirCell0_UIDENT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_TYPE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_10 _2 _4 in
          _menhir_error_goto_regtreeexpdef _menhir_stack _v _menhir_s
  
  and _menhir_goto_regtreeexpdef : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState43 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState39 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_43 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_regtreeexpdef (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
      | EOF ->
          let _v_0 = _menhir_action_11 () in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_regtreeexpdef (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | EOF ->
          let _v_0 = _menhir_action_11 () in
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_05 _1 _3 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      _menhir_reduce_08 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState17 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState20 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UIDENT _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LIDENT _v ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      _menhir_reduce_07 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_24 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_09 _2 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_09 _2 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RBRACKET | RPAREN ->
          let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_regtreeexp as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR | RBRACKET | RPAREN ->
          let MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_regtreeexpdefs) _menhir_cell1_LIDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_regtreeexpdefs) _menhir_state -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LIDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_05 _1 _3 in
          _menhir_goto_regtreeexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | QUESTION ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BAR ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_regtreeexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_regtreeexpdefs =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | _ ->
          let _v = _menhir_action_13 () in
          _menhir_error_run_38 _menhir_stack _v
  
end

let regtreeexpdefs =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_regtreeexpdefs v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
