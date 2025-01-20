
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WILDCARD
    | VERT
    | ToReal
    | ToInt
    | TYPEOF
    | TRUE
    | SUBTYPE
    | SUB
    | SQRT
    | SEMPTY
    | SEMICOLON
    | RTRI
    | RPAREN
    | RECOGNIZER of (
# 27 "lib/ast/rtypeParser.mly"
       (string)
# 28 "lib/ast/rtypeParser.ml"
  )
    | RBRA
    | QUESTION
    | PROJ
    | PLUSPLUS
    | OR
    | NOTEQUAL
    | NOT
    | MOD
    | MINIMIZE
    | MAXIMIZE
    | LT
    | LPAREN
    | LEQ
    | LBRA
    | INT of (
# 25 "lib/ast/rtypeParser.mly"
       (int)
# 47 "lib/ast/rtypeParser.ml"
  )
    | INFEFFECTOF
    | IN
    | IMP
    | IFF
    | IDENT_T of (
# 22 "lib/ast/rtypeParser.mly"
       (string)
# 56 "lib/ast/rtypeParser.ml"
  )
    | IDENT of (
# 21 "lib/ast/rtypeParser.mly"
       (string)
# 61 "lib/ast/rtypeParser.ml"
  )
    | GT
    | GEQ
    | FSUB
    | FORALL
    | FMUL
    | FLOAT of (
# 26 "lib/ast/rtypeParser.mly"
       (float)
# 71 "lib/ast/rtypeParser.ml"
  )
    | FINEFFECTOF
    | FDIV
    | FALSE
    | FADD
    | EXISTS
    | EXC
    | EVENT
    | EQUAL
    | EPSILON
    | EOF
    | DOT
    | DIV
    | CONST of (
# 23 "lib/ast/rtypeParser.mly"
       (string)
# 88 "lib/ast/rtypeParser.ml"
  )
    | COMMA
    | COLON
    | COLCOL
    | BOOL of (
# 24 "lib/ast/rtypeParser.mly"
       (bool)
# 96 "lib/ast/rtypeParser.ml"
  )
    | AST
    | ARROW
    | APPLY
    | AND
    | AMP
    | ADD
    | ACCESSOR of (
# 28 "lib/ast/rtypeParser.mly"
       (string * int)
# 107 "lib/ast/rtypeParser.ml"
  )
    | ABS
  
end

include MenhirBasics

# 1 "lib/ast/rtypeParser.mly"
  
open Common.Ext
open Common.Util
open Ident
open LogicOld
open Grammar

let print _ = ()

(*let print_error_information () =
  let st = Parsing.symbol_start_pos () in
  let en = Parsing.symbol_end_pos () in
  print_string ("File \"" ^ st.Lexing.pos_fname);
  Format.printf "\", line %d" st.Lexing.pos_lnum;
  Format.printf ", characters %d-%d:\n"
    (st.Lexing.pos_cnum - st.Lexing.pos_bol)
    (en.Lexing.pos_cnum - en.Lexing.pos_bol)*)

# 134 "lib/ast/rtypeParser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_assertions) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: assertions. *)

  | MenhirState005 : (('s, _menhir_box_assertions) _menhir_cell1_TYPEOF _menhir_cell0_IDENT, _menhir_box_assertions) _menhir_state
    (** State 005.
        Stack shape : TYPEOF IDENT.
        Start symbol: assertions. *)

  | MenhirState006 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 006.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState007 : (('s, 'r) _menhir_cell1_LBRA, 'r) _menhir_state
    (** State 007.
        Stack shape : LBRA.
        Start symbol: <undetermined>. *)

  | MenhirState009 : ((('s, 'r) _menhir_cell1_LBRA, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 009.
        Stack shape : LBRA IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState012 : (('s, 'r) _menhir_cell1_val_tys_ast, 'r) _menhir_state
    (** State 012.
        Stack shape : val_tys_ast.
        Start symbol: <undetermined>. *)

  | MenhirState015 : (('s, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 015.
        Stack shape : val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState017 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 017.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState019 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_LBRA, 'r) _menhir_state
    (** State 019.
        Stack shape : LPAREN LBRA.
        Start symbol: <undetermined>. *)

  | MenhirState022 : (('s, 'r) _menhir_cell1_CONST, 'r) _menhir_state
    (** State 022.
        Stack shape : CONST.
        Start symbol: <undetermined>. *)

  | MenhirState025 : ((('s, 'r) _menhir_cell1_CONST, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 025.
        Stack shape : CONST val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState027 : (('s, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 027.
        Stack shape : val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState031 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 031.
        Stack shape : LPAREN IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState034 : (((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_IDENT, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 034.
        Stack shape : LPAREN IDENT val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState040 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_val_tys_comma, 'r) _menhir_state
    (** State 040.
        Stack shape : LPAREN val_tys_comma.
        Start symbol: <undetermined>. *)

  | MenhirState044 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 044.
        Stack shape : LPAREN val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState047 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 047.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState050 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_FORALL _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 050.
        Stack shape : LPAREN FORALL IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState053 : (((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_FORALL _menhir_cell0_IDENT, 'r) _menhir_cell1_comp_ty, 'r) _menhir_state
    (** State 053.
        Stack shape : LPAREN FORALL IDENT comp_ty.
        Start symbol: <undetermined>. *)

  | MenhirState056 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_opsig_ty, 'r) _menhir_state
    (** State 056.
        Stack shape : LPAREN opsig_ty.
        Start symbol: <undetermined>. *)

  | MenhirState058 : (((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_opsig_ty, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 058.
        Stack shape : LPAREN opsig_ty val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState062 : (('s, 'r) _menhir_cell1_comp_ty, 'r) _menhir_state
    (** State 062.
        Stack shape : comp_ty.
        Start symbol: <undetermined>. *)

  | MenhirState066 : (((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_opsig_ty, 'r) _menhir_cell1_val_ty _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 066.
        Stack shape : LPAREN opsig_ty val_ty IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState067 : (('s, 'r) _menhir_cell1_VERT, 'r) _menhir_state
    (** State 067.
        Stack shape : VERT.
        Start symbol: <undetermined>. *)

  | MenhirState068 : (('s, 'r) _menhir_cell1_ToReal, 'r) _menhir_state
    (** State 068.
        Stack shape : ToReal.
        Start symbol: <undetermined>. *)

  | MenhirState069 : (('s, 'r) _menhir_cell1_ToInt, 'r) _menhir_state
    (** State 069.
        Stack shape : ToInt.
        Start symbol: <undetermined>. *)

  | MenhirState071 : (('s, 'r) _menhir_cell1_SUB, 'r) _menhir_state
    (** State 071.
        Stack shape : SUB.
        Start symbol: <undetermined>. *)

  | MenhirState072 : (('s, 'r) _menhir_cell1_SQRT, 'r) _menhir_state
    (** State 072.
        Stack shape : SQRT.
        Start symbol: <undetermined>. *)

  | MenhirState076 : (('s, 'r) _menhir_cell1_PROJ _menhir_cell0_INT, 'r) _menhir_state
    (** State 076.
        Stack shape : PROJ INT.
        Start symbol: <undetermined>. *)

  | MenhirState077 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 077.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState080 : (('s, 'r) _menhir_cell1_FSUB, 'r) _menhir_state
    (** State 080.
        Stack shape : FSUB.
        Start symbol: <undetermined>. *)

  | MenhirState088 : (('s, 'r) _menhir_cell1_CONST, 'r) _menhir_state
    (** State 088.
        Stack shape : CONST.
        Start symbol: <undetermined>. *)

  | MenhirState089 : ((('s, 'r) _menhir_cell1_CONST, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 089.
        Stack shape : CONST LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState091 : (('s, 'r) _menhir_cell1_COLCOL, 'r) _menhir_state
    (** State 091.
        Stack shape : COLCOL.
        Start symbol: <undetermined>. *)

  | MenhirState094 : (('s, 'r) _menhir_cell1_APPLY _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 094.
        Stack shape : APPLY IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState096 : (('s, 'r) _menhir_cell1_ACCESSOR, 'r) _menhir_state
    (** State 096.
        Stack shape : ACCESSOR.
        Start symbol: <undetermined>. *)

  | MenhirState097 : (('s, 'r) _menhir_cell1_ABS, 'r) _menhir_state
    (** State 097.
        Stack shape : ABS.
        Start symbol: <undetermined>. *)

  | MenhirState100 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 100.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState102 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 102.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState104 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 104.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState106 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 106.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState108 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 108.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState110 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 110.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState113 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 113.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState115 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 115.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState117 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 117.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState119 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 119.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState121 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 121.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState126 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 126.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState147 : (('s, 'r) _menhir_cell1_RECOGNIZER, 'r) _menhir_state
    (** State 147.
        Stack shape : RECOGNIZER.
        Start symbol: <undetermined>. *)

  | MenhirState150 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 150.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState151 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 151.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState153 : (('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 153.
        Stack shape : IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState157 : (('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_state
    (** State 157.
        Stack shape : FORALL.
        Start symbol: <undetermined>. *)

  | MenhirState159 : (('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 159.
        Stack shape : IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState161 : ((('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_cell1_DOT, 'r) _menhir_state
    (** State 161.
        Stack shape : FORALL DOT.
        Start symbol: <undetermined>. *)

  | MenhirState165 : (('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_state
    (** State 165.
        Stack shape : EXISTS.
        Start symbol: <undetermined>. *)

  | MenhirState167 : ((('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_cell1_binds, 'r) _menhir_state
    (** State 167.
        Stack shape : EXISTS binds.
        Start symbol: <undetermined>. *)

  | MenhirState170 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 170.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState172 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 172.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState174 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 174.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState175 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 175.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState182 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_eff, 'r) _menhir_state
    (** State 182.
        Stack shape : LPAREN eff.
        Start symbol: <undetermined>. *)

  | MenhirState183 : ((('s, 'r) _menhir_cell1_eff, 'r) _menhir_cell1_VERT, 'r) _menhir_state
    (** State 183.
        Stack shape : eff VERT.
        Start symbol: <undetermined>. *)

  | MenhirState184 : (((('s, 'r) _menhir_cell1_eff, 'r) _menhir_cell1_VERT, 'r) _menhir_cell1_eff, 'r) _menhir_state
    (** State 184.
        Stack shape : eff VERT eff.
        Start symbol: <undetermined>. *)

  | MenhirState185 : ((('s, 'r) _menhir_cell1_eff, 'r) _menhir_cell1_eff, 'r) _menhir_state
    (** State 185.
        Stack shape : eff eff.
        Start symbol: <undetermined>. *)

  | MenhirState189 : ((('s, 'r) _menhir_cell1_term, 'r) _menhir_cell1_eff, 'r) _menhir_state
    (** State 189.
        Stack shape : term eff.
        Start symbol: <undetermined>. *)

  | MenhirState190 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 190.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState192 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 192.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState195 : (('s, 'r) _menhir_cell1_prop, 'r) _menhir_state
    (** State 195.
        Stack shape : prop.
        Start symbol: <undetermined>. *)

  | MenhirState197 : (('s, 'r) _menhir_cell1_prop, 'r) _menhir_state
    (** State 197.
        Stack shape : prop.
        Start symbol: <undetermined>. *)

  | MenhirState199 : (('s, 'r) _menhir_cell1_prop, 'r) _menhir_state
    (** State 199.
        Stack shape : prop.
        Start symbol: <undetermined>. *)

  | MenhirState202 : (('s, 'r) _menhir_cell1_atom_or_term, 'r) _menhir_state
    (** State 202.
        Stack shape : atom_or_term.
        Start symbol: <undetermined>. *)

  | MenhirState205 : (('s, 'r) _menhir_cell1_atom_or_term, 'r) _menhir_state
    (** State 205.
        Stack shape : atom_or_term.
        Start symbol: <undetermined>. *)

  | MenhirState208 : (('s, 'r) _menhir_cell1_prop, 'r) _menhir_state
    (** State 208.
        Stack shape : prop.
        Start symbol: <undetermined>. *)

  | MenhirState210 : (('s, 'r) _menhir_cell1_bind, 'r) _menhir_state
    (** State 210.
        Stack shape : bind.
        Start symbol: <undetermined>. *)

  | MenhirState214 : ((('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_cell1_binds, 'r) _menhir_state
    (** State 214.
        Stack shape : FORALL binds.
        Start symbol: <undetermined>. *)

  | MenhirState225 : ((((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_opsig_ty, 'r) _menhir_cell1_val_ty _menhir_cell0_IDENT, 'r) _menhir_cell1_prop _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 225.
        Stack shape : LPAREN opsig_ty val_ty IDENT prop IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState227 : (((((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_opsig_ty, 'r) _menhir_cell1_val_ty _menhir_cell0_IDENT, 'r) _menhir_cell1_prop _menhir_cell0_IDENT, 'r) _menhir_cell1_prop, 'r) _menhir_state
    (** State 227.
        Stack shape : LPAREN opsig_ty val_ty IDENT prop IDENT prop.
        Start symbol: <undetermined>. *)

  | MenhirState232 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 232.
        Stack shape : LPAREN val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState236 : ((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_val_ty _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 236.
        Stack shape : LPAREN val_ty IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState240 : (((('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_cell1_val_ty _menhir_cell0_IDENT, 'r) _menhir_cell1_prop _menhir_cell0_IDENT, 'r) _menhir_state
    (** State 240.
        Stack shape : LPAREN val_ty IDENT prop IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState245 : (((('s, 'r) _menhir_cell1_LBRA, 'r) _menhir_cell1_IDENT, 'r) _menhir_cell1_val_ty, 'r) _menhir_state
    (** State 245.
        Stack shape : LBRA IDENT val_ty.
        Start symbol: <undetermined>. *)

  | MenhirState254 : (('s, _menhir_box_assertions) _menhir_cell1_INFEFFECTOF _menhir_cell0_IDENT, _menhir_box_assertions) _menhir_state
    (** State 254.
        Stack shape : INFEFFECTOF IDENT.
        Start symbol: assertions. *)

  | MenhirState255 : ((('s, _menhir_box_assertions) _menhir_cell1_INFEFFECTOF _menhir_cell0_IDENT, _menhir_box_assertions) _menhir_cell1_eff, _menhir_box_assertions) _menhir_state
    (** State 255.
        Stack shape : INFEFFECTOF IDENT eff.
        Start symbol: assertions. *)

  | MenhirState260 : (('s, _menhir_box_assertions) _menhir_cell1_FINEFFECTOF _menhir_cell0_IDENT, _menhir_box_assertions) _menhir_state
    (** State 260.
        Stack shape : FINEFFECTOF IDENT.
        Start symbol: assertions. *)

  | MenhirState261 : ((('s, _menhir_box_assertions) _menhir_cell1_FINEFFECTOF _menhir_cell0_IDENT, _menhir_box_assertions) _menhir_cell1_eff, _menhir_box_assertions) _menhir_state
    (** State 261.
        Stack shape : FINEFFECTOF IDENT eff.
        Start symbol: assertions. *)

  | MenhirState264 : (('s, _menhir_box_assertions) _menhir_cell1_assertion, _menhir_box_assertions) _menhir_state
    (** State 264.
        Stack shape : assertion.
        Start symbol: assertions. *)

  | MenhirState266 : ('s, _menhir_box_comp_ty) _menhir_state
    (** State 266.
        Stack shape : .
        Start symbol: comp_ty. *)

  | MenhirState268 : ('s, _menhir_box_constraints) _menhir_state
    (** State 268.
        Stack shape : .
        Start symbol: constraints. *)

  | MenhirState271 : (('s, _menhir_box_constraints) _menhir_cell1_prop, _menhir_box_constraints) _menhir_state
    (** State 271.
        Stack shape : prop.
        Start symbol: constraints. *)

  | MenhirState274 : ('s, _menhir_box_formula) _menhir_state
    (** State 274.
        Stack shape : .
        Start symbol: formula. *)

  | MenhirState278 : ('s, _menhir_box_opt_problems) _menhir_state
    (** State 278.
        Stack shape : .
        Start symbol: opt_problems. *)

  | MenhirState280 : (('s, _menhir_box_opt_problems) _menhir_cell1_IDENT, _menhir_box_opt_problems) _menhir_state
    (** State 280.
        Stack shape : IDENT.
        Start symbol: opt_problems. *)

  | MenhirState289 : ((('s, _menhir_box_opt_problems) _menhir_cell1_IDENT, _menhir_box_opt_problems) _menhir_cell1_COLON, _menhir_box_opt_problems) _menhir_state
    (** State 289.
        Stack shape : IDENT COLON.
        Start symbol: opt_problems. *)

  | MenhirState303 : (('s, _menhir_box_opt_problems) _menhir_cell1_space_constr, _menhir_box_opt_problems) _menhir_state
    (** State 303.
        Stack shape : space_constr.
        Start symbol: opt_problems. *)

  | MenhirState306 : ((('s, _menhir_box_opt_problems) _menhir_cell1_IDENT, _menhir_box_opt_problems) _menhir_cell1_directs, _menhir_box_opt_problems) _menhir_state
    (** State 306.
        Stack shape : IDENT directs.
        Start symbol: opt_problems. *)

  | MenhirState309 : (('s, _menhir_box_opt_problems) _menhir_cell1_direct, _menhir_box_opt_problems) _menhir_state
    (** State 309.
        Stack shape : direct.
        Start symbol: opt_problems. *)

  | MenhirState313 : (('s, _menhir_box_opt_problems) _menhir_cell1_opt_pair, _menhir_box_opt_problems) _menhir_state
    (** State 313.
        Stack shape : opt_pair.
        Start symbol: opt_problems. *)

  | MenhirState315 : ('s, _menhir_box_val_ty_env) _menhir_state
    (** State 315.
        Stack shape : .
        Start symbol: val_ty_env. *)

  | MenhirState317 : (('s, _menhir_box_val_ty_env) _menhir_cell1_IDENT, _menhir_box_val_ty_env) _menhir_state
    (** State 317.
        Stack shape : IDENT.
        Start symbol: val_ty_env. *)

  | MenhirState321 : (('s, _menhir_box_val_ty_env) _menhir_cell1_CONST, _menhir_box_val_ty_env) _menhir_state
    (** State 321.
        Stack shape : CONST.
        Start symbol: val_ty_env. *)

  | MenhirState324 : (('s, _menhir_box_val_ty_env) _menhir_cell1_COLCOL, _menhir_box_val_ty_env) _menhir_state
    (** State 324.
        Stack shape : COLCOL.
        Start symbol: val_ty_env. *)

  | MenhirState327 : (('s, _menhir_box_val_ty_env) _menhir_cell1_val_ty_bind, _menhir_box_val_ty_env) _menhir_state
    (** State 327.
        Stack shape : val_ty_bind.
        Start symbol: val_ty_env. *)


and ('s, 'r) _menhir_cell1_assertion = 
  | MenhirCell1_assertion of 's * ('s, 'r) _menhir_state * (Ident.tvar * Assertion.t)

and ('s, 'r) _menhir_cell1_atom_or_term = 
  | MenhirCell1_atom_or_term of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_bind = 
  | MenhirCell1_bind of 's * ('s, 'r) _menhir_state * (LogicOld.sort_bind)

and ('s, 'r) _menhir_cell1_binds = 
  | MenhirCell1_binds of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_list)

and ('s, 'r) _menhir_cell1_comp_ty = 
  | MenhirCell1_comp_ty of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> Rtype.c)

and ('s, 'r) _menhir_cell1_direct = 
  | MenhirCell1_direct of 's * ('s, 'r) _menhir_state * (Ident.tvar * Assertion.direction)

and ('s, 'r) _menhir_cell1_directs = 
  | MenhirCell1_directs of 's * ('s, 'r) _menhir_state * ((Ident.tvar * Assertion.direction) list)

and ('s, 'r) _menhir_cell1_eff = 
  | MenhirCell1_eff of 's * ('s, 'r) _menhir_state * (bool * string Grammar.RegWordExp.t)

and ('s, 'r) _menhir_cell1_opsig_ty = 
  | MenhirCell1_opsig_ty of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> Rtype.o)

and ('s, 'r) _menhir_cell1_opt_pair = 
  | MenhirCell1_opt_pair of 's * ('s, 'r) _menhir_state * (Ident.tvar * (Ident.tvar * Assertion.direction) list *
  (Ident.tvar * SolSpace.space_flag * int) list)

and ('s, 'r) _menhir_cell1_prop = 
  | MenhirCell1_prop of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_space_constr = 
  | MenhirCell1_space_constr of 's * ('s, 'r) _menhir_state * (Ident.tvar * SolSpace.space_flag * int)

and ('s, 'r) _menhir_cell1_term = 
  | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_val_ty = 
  | MenhirCell1_val_ty of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> Rtype.t)

and ('s, 'r) _menhir_cell1_val_ty_bind = 
  | MenhirCell1_val_ty_bind of 's * ('s, 'r) _menhir_state * (Ident.tvar * Rtype.t)

and ('s, 'r) _menhir_cell1_val_tys_ast = 
  | MenhirCell1_val_tys_ast of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> Rtype.t list)

and ('s, 'r) _menhir_cell1_val_tys_comma = 
  | MenhirCell1_val_tys_comma of 's * ('s, 'r) _menhir_state * (LogicOld.sort_env_map -> Rtype.t list)

and ('s, 'r) _menhir_cell1_ABS = 
  | MenhirCell1_ABS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ACCESSOR = 
  | MenhirCell1_ACCESSOR of 's * ('s, 'r) _menhir_state * (
# 28 "lib/ast/rtypeParser.mly"
       (string * int)
# 717 "lib/ast/rtypeParser.ml"
)

and ('s, 'r) _menhir_cell1_APPLY = 
  | MenhirCell1_APPLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COLCOL = 
  | MenhirCell1_COLCOL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COLON = 
  | MenhirCell1_COLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CONST = 
  | MenhirCell1_CONST of 's * ('s, 'r) _menhir_state * (
# 23 "lib/ast/rtypeParser.mly"
       (string)
# 733 "lib/ast/rtypeParser.ml"
)

and ('s, 'r) _menhir_cell1_DOT = 
  | MenhirCell1_DOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXISTS = 
  | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FINEFFECTOF = 
  | MenhirCell1_FINEFFECTOF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FORALL = 
  | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FSUB = 
  | MenhirCell1_FSUB of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 21 "lib/ast/rtypeParser.mly"
       (string)
# 755 "lib/ast/rtypeParser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 21 "lib/ast/rtypeParser.mly"
       (string)
# 762 "lib/ast/rtypeParser.ml"
)

and ('s, 'r) _menhir_cell1_INFEFFECTOF = 
  | MenhirCell1_INFEFFECTOF of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_INT = 
  | MenhirCell0_INT of 's * (
# 25 "lib/ast/rtypeParser.mly"
       (int)
# 772 "lib/ast/rtypeParser.ml"
)

and ('s, 'r) _menhir_cell1_LBRA = 
  | MenhirCell1_LBRA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROJ = 
  | MenhirCell1_PROJ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RECOGNIZER = 
  | MenhirCell1_RECOGNIZER of 's * ('s, 'r) _menhir_state * (
# 27 "lib/ast/rtypeParser.mly"
       (string)
# 791 "lib/ast/rtypeParser.ml"
)

and ('s, 'r) _menhir_cell1_SQRT = 
  | MenhirCell1_SQRT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SUB = 
  | MenhirCell1_SUB of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TYPEOF = 
  | MenhirCell1_TYPEOF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ToInt = 
  | MenhirCell1_ToInt of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ToReal = 
  | MenhirCell1_ToReal of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VERT = 
  | MenhirCell1_VERT of 's * ('s, 'r) _menhir_state

and _menhir_box_val_ty_env = 
  | MenhirBox_val_ty_env of (Rtype.env) [@@unboxed]

and _menhir_box_opt_problems = 
  | MenhirBox_opt_problems of ((Ident.tvar * (Ident.tvar * Assertion.direction) list *
   (Ident.tvar * SolSpace.space_flag * int) list)
  list) [@@unboxed]

and _menhir_box_formula = 
  | MenhirBox_formula of (LogicOld.Formula.t) [@@unboxed]

and _menhir_box_constraints = 
  | MenhirBox_constraints of (LogicOld.Formula.t list) [@@unboxed]

and _menhir_box_comp_ty = 
  | MenhirBox_comp_ty of (LogicOld.sort_env_map -> Rtype.c) [@@unboxed]

and _menhir_box_assertions = 
  | MenhirBox_assertions of ((Ident.tvar * Assertion.t) list) [@@unboxed]

let _menhir_action_006 =
  fun _3 _6 ->
    (
# 561 "lib/ast/rtypeParser.mly"
                                              (
    Ident.Tvar _3, Assertion.Type (Rtype.aconv_val Map.Poly.empty (_6 Map.Poly.empty))
  )
# 839 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Assertion.t))

let _menhir_action_007 =
  fun _3 _6 ->
    (
# 564 "lib/ast/rtypeParser.mly"
                                                (
    let fin, regexp = _6 in assert fin;
    Ident.Tvar _3, Assertion.FinEff regexp
  )
# 850 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Assertion.t))

let _menhir_action_008 =
  fun _3 _6 ->
    (
# 568 "lib/ast/rtypeParser.mly"
                                                (
    let fin, regexp = _6 in assert (not fin);
    Ident.Tvar _3, Assertion.InfEff regexp
  )
# 861 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Assertion.t))

let _menhir_action_009 =
  fun _1 _2 ->
    (
# 554 "lib/ast/rtypeParser.mly"
                         ( _1 :: _2 )
# 869 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * Assertion.t) list))

let _menhir_action_010 =
  fun () ->
    (
# 555 "lib/ast/rtypeParser.mly"
        ( [] )
# 877 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * Assertion.t) list))

let _menhir_action_011 =
  fun _1 ->
    (
# 310 "lib/ast/rtypeParser.mly"
                                                                        (
    fun _ -> Atom.of_bool_var @@ Ident.Tvar _1
  )
# 887 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_012 =
  fun _1 ->
    (
# 313 "lib/ast/rtypeParser.mly"
         ( fun _ -> Atom.mk_bool _1 )
# 895 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_013 =
  fun () ->
    (
# 314 "lib/ast/rtypeParser.mly"
                       ( fun _ -> Atom.mk_bool true )
# 903 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_014 =
  fun () ->
    (
# 315 "lib/ast/rtypeParser.mly"
                        ( fun _ -> Atom.mk_bool false )
# 911 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_015 =
  fun _1 _3 ->
    (
# 316 "lib/ast/rtypeParser.mly"
                              (
    match Map.Poly.find (get_fenv ()) (Tvar _1) with
    | Some (params, ret_sort, _, _, _) ->
      if Term.is_bool_sort ret_sort then
        let sorts = List.map params ~f:snd in
        fun env ->
        T_bool.mk_eq (Term.mk_fvar_app (Tvar _1) (sorts @ [ret_sort]) (_3 env)) @@
        T_bool.mk_true ()
      else failwith ""
    | None ->
      fun env ->
      let ts = _3 env in
      match Map.Poly.find (Rtype.Env.pred_sort_env_of !Rtype.renv_ref) (Pvar _1) with
      | Some sorts -> Atom.mk_pvar_app (Pvar _1) sorts ts
      | _ -> Atom.mk_pvar_app (Pvar _1) (List.map ts ~f:Term.sort_of) ts
  )
# 934 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_016 =
  fun _1 _3 ->
    (
# 332 "lib/ast/rtypeParser.mly"
                                    ( fun env -> T_bool.mk_eq (_1 env) (_3 env) )
# 942 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_017 =
  fun _1 _3 ->
    (
# 333 "lib/ast/rtypeParser.mly"
                                       ( fun env -> T_bool.mk_neq (_1 env) (_3 env) )
# 950 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_018 =
  fun _1 _3 ->
    (
# 334 "lib/ast/rtypeParser.mly"
                 ( fun env -> T_num.mk_nlt (_1 env) (_3 env) )
# 958 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_019 =
  fun _1 _3 ->
    (
# 335 "lib/ast/rtypeParser.mly"
                 ( fun env -> T_num.mk_ngt (_1 env) (_3 env) )
# 966 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_020 =
  fun _1 _3 ->
    (
# 336 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_nleq (_1 env) (_3 env) )
# 974 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_021 =
  fun _1 _3 ->
    (
# 337 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_ngeq (_1 env) (_3 env) )
# 982 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_022 =
  fun _1 _3 ->
    (
# 338 "lib/ast/rtypeParser.mly"
                                 (
    match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) _1 with
    | Some dt -> fun env -> T_dt.mk_is_cons dt _1 (_3 env)
    | None -> failwith @@ "unknown cons name" ^ _1
  )
# 994 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_023 =
  fun _1 _3 ->
    (
# 345 "lib/ast/rtypeParser.mly"
                (
    let fin, regexp = _3 in
    fun env -> Atom.mk_psym_app (T_sequence.SeqInRegExp (fin, regexp)) [_1 env]
  )
# 1005 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Atom.t))

let _menhir_action_024 =
  fun _1 ->
    (
# 350 "lib/ast/rtypeParser.mly"
         ( fun env -> T_bool.of_atom (_1 env) )
# 1013 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_025 =
  fun _1 ->
    (
# 351 "lib/ast/rtypeParser.mly"
         ( fun env -> _1 env )
# 1021 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_026 =
  fun _1 _3 ->
    (
# 382 "lib/ast/rtypeParser.mly"
                                 (
    let tvar, ty = Ident.Tvar _1, _3 Map.Poly.empty in
    tvar, Rtype.sort_of_val ty
  )
# 1032 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_bind))

let _menhir_action_027 =
  fun _1 ->
    (
# 379 "lib/ast/rtypeParser.mly"
         ( [_1] )
# 1040 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_list))

let _menhir_action_028 =
  fun _1 _2 ->
    (
# 380 "lib/ast/rtypeParser.mly"
               ( _1 :: _2 )
# 1048 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_list))

let _menhir_action_029 =
  fun _1 ->
    (
# 465 "lib/ast/rtypeParser.mly"
           (
    fun env -> Rtype.pure_comp_of_val ~config:!Rtype.cgen_config (_1 env)
  )
# 1058 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.c))

let _menhir_action_030 =
  fun () ->
    (
# 468 "lib/ast/rtypeParser.mly"
             (
    fun _ ->
    { op_sig = ALMap.empty, Some (Ident.mk_fresh_rvar ());
      val_type = Rtype.simple_val_of_sort ~config:!Rtype.cgen_config (Sort.mk_fresh_svar ());
      temp_eff = ((Ident.mk_fresh_tvar (), Formula.mk_true ()), (Ident.mk_fresh_tvar (), Formula.mk_true ()));
      cont_eff = Rtype.EVar (Ident.mk_fresh_evar ()) }
  )
# 1072 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.c))

let _menhir_action_031 =
  fun _10 _2 _4 _6 _8 ->
    (
# 476 "lib/ast/rtypeParser.mly"
                                                                 (
    fun env ->
    let x1 = Ident.Tvar _4 in
    let x2 = Ident.Tvar _8 in
    { op_sig = ALMap.empty(*temporary*), None;
      val_type = _2 env;
      temp_eff = ((x1, _6 (Map.Poly.set env ~key:x1 ~data:(T_sequence.SSequence true))),
                  (x2, _10 (Map.Poly.set env ~key:x2 ~data:(T_sequence.SSequence false))));
      cont_eff = Rtype.Pure }
  )
# 1089 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.c))

let _menhir_action_032 =
  fun _2 _4 ->
    (
# 487 "lib/ast/rtypeParser.mly"
                                         (
    fun env ->
    let t = _2 env in
    { op_sig = ALMap.empty, None;
      val_type = t;
      temp_eff = Rtype.mk_temp_trivial ()(*temporary*);
      cont_eff = _4 env (Rtype.sort_of_val t) }
  )
# 1104 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.c))

let _menhir_action_033 =
  fun _2 _4 _6 ->
    (
# 496 "lib/ast/rtypeParser.mly"
                                                       (
    fun env ->
    let t = _4 env in
    { op_sig = _2 env;
      val_type = t;
      temp_eff = Rtype.mk_temp_trivial ();
      cont_eff = _6 env (Rtype.sort_of_val t) }
  )
# 1119 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.c))

let _menhir_action_034 =
  fun _10 _12 _14 _2 _4 _6 _8 ->
    (
# 505 "lib/ast/rtypeParser.mly"
                                                                                               (
    fun env ->
    let x1 = Ident.Tvar _6 in
    let x2 = Ident.Tvar _10 in
    let t = _4 env in
    { op_sig = _2 env;
      val_type = t;
      temp_eff =
        ((x1, _8 (Map.Poly.set env ~key:x1 ~data:(T_sequence.SSequence true))),
         (x2, _12 (Map.Poly.set env ~key:x1 ~data:(T_sequence.SSequence false))));
      cont_eff = _14 env (Rtype.sort_of_val t) }
  )
# 1138 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.c))

let _menhir_action_035 =
  fun _1 _3 ->
    (
# 548 "lib/ast/rtypeParser.mly"
                               ( _1 Map.Poly.empty :: _3 )
# 1146 "lib/ast/rtypeParser.ml"
     : (LogicOld.Formula.t list))

let _menhir_action_036 =
  fun () ->
    (
# 549 "lib/ast/rtypeParser.mly"
        ( [] )
# 1154 "lib/ast/rtypeParser.ml"
     : (LogicOld.Formula.t list))

let _menhir_action_037 =
  fun () ->
    (
# 452 "lib/ast/rtypeParser.mly"
             ( fun _ _ -> Rtype.Pure )
# 1162 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Sort.t -> Rtype.s))

let _menhir_action_038 =
  fun () ->
    (
# 453 "lib/ast/rtypeParser.mly"
             ( fun _ _ -> Rtype.EVar (Ident.mk_fresh_evar ()) )
# 1170 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Sort.t -> Rtype.s))

let _menhir_action_039 =
  fun _1 _3 ->
    (
# 454 "lib/ast/rtypeParser.mly"
                        (
    fun env _ -> Rtype.Eff ((Rtype.mk_fresh_tvar_with "x"), _1 env, _3 env)
  )
# 1180 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Sort.t -> Rtype.s))

let _menhir_action_040 =
  fun _3 _5 _8 ->
    (
# 457 "lib/ast/rtypeParser.mly"
                                                       (
    fun env sort ->
    let x = Ident.Tvar _3 in
    Rtype.Eff (x, _5 (Map.Poly.set env ~key:x ~data:sort), _8 env)
  )
# 1192 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Sort.t -> Rtype.s))

let _menhir_action_041 =
  fun _3 ->
    (
# 576 "lib/ast/rtypeParser.mly"
                                 ( Tvar _3, Assertion.DUp )
# 1200 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Assertion.direction))

let _menhir_action_042 =
  fun _3 ->
    (
# 577 "lib/ast/rtypeParser.mly"
                                 ( Tvar _3, Assertion.DDown )
# 1208 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Assertion.direction))

let _menhir_action_043 =
  fun _1 ->
    (
# 579 "lib/ast/rtypeParser.mly"
           ( [_1] )
# 1216 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * Assertion.direction) list))

let _menhir_action_044 =
  fun _1 _3 ->
    (
# 580 "lib/ast/rtypeParser.mly"
                         ( _1 :: _3 )
# 1224 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * Assertion.direction) list))

let _menhir_action_045 =
  fun _3 ->
    (
# 280 "lib/ast/rtypeParser.mly"
                              (
    true, RegWordExp.Symbol _3
  )
# 1234 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_046 =
  fun _3 ->
    (
# 283 "lib/ast/rtypeParser.mly"
                                  (
    true, RegWordExp.Repeat (RegWordExp.Symbol _3)
  )
# 1244 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_047 =
  fun _3 ->
    (
# 286 "lib/ast/rtypeParser.mly"
                                  (
    false, RegWordExp.RepeatInf (RegWordExp.Symbol _3)
  )
# 1254 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_048 =
  fun _2 ->
    (
# 289 "lib/ast/rtypeParser.mly"
                      ( _2 )
# 1262 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_049 =
  fun _2 ->
    (
# 290 "lib/ast/rtypeParser.mly"
                          (
    let fin, regexp = _2 in assert fin; true, RegWordExp.Repeat regexp
  )
# 1272 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_050 =
  fun _2 ->
    (
# 293 "lib/ast/rtypeParser.mly"
                          (
    let fin, regexp = _2 in assert fin; false, RegWordExp.RepeatInf regexp
  )
# 1282 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_051 =
  fun _1 _2 ->
    (
# 296 "lib/ast/rtypeParser.mly"
            (
    let fin1, regexp1 = _1 in
    let fin2, regexp2 = _2 in
    assert fin1;
    fin2, RegWordExp.Concat (regexp1, regexp2)
  )
# 1295 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_052 =
  fun _1 _3 ->
    (
# 302 "lib/ast/rtypeParser.mly"
                 (
    let fin1, regexp1 = _1 in
    let fin2, regexp2 = _3 in
    assert (fin1 = fin2);
    fin1, RegWordExp.Alter (regexp1, regexp2)
  )
# 1308 "lib/ast/rtypeParser.ml"
     : (bool * string Grammar.RegWordExp.t))

let _menhir_action_053 =
  fun _1 ->
    (
# 388 "lib/ast/rtypeParser.mly"
             ( _1 Map.Poly.empty )
# 1316 "lib/ast/rtypeParser.ml"
     : (LogicOld.Formula.t))

let _menhir_action_054 =
  fun _1 _3 ->
    (
# 446 "lib/ast/rtypeParser.mly"
                            ( fun env -> ALMap.singleton _1 (_3 env) )
# 1324 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> (string, Rtype.t) Common.Util.ALMap.t))

let _menhir_action_055 =
  fun _1 _3 _5 ->
    (
# 447 "lib/ast/rtypeParser.mly"
                                    (
    fun env -> ALMap.add_exn ~key:_1 ~data:(_3 env) (_5 env)
  )
# 1334 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> (string, Rtype.t) Common.Util.ALMap.t))

let _menhir_action_056 =
  fun () ->
    (
# 442 "lib/ast/rtypeParser.mly"
           ( fun _ -> (ALMap.empty, None) )
# 1342 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.o))

let _menhir_action_057 =
  fun () ->
    (
# 443 "lib/ast/rtypeParser.mly"
              ( fun _ -> (ALMap.empty, None) )
# 1350 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.o))

let _menhir_action_058 =
  fun _2 ->
    (
# 444 "lib/ast/rtypeParser.mly"
                ( fun env -> (_2 env, None) )
# 1358 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.o))

let _menhir_action_059 =
  fun _1 ->
    (
# 582 "lib/ast/rtypeParser.mly"
          ( Tvar _1, [], [] )
# 1366 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * (Ident.tvar * Assertion.direction) list *
  (Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_060 =
  fun _1 _3 ->
    (
# 583 "lib/ast/rtypeParser.mly"
                        ( Tvar _1, _3, [] )
# 1375 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * (Ident.tvar * Assertion.direction) list *
  (Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_061 =
  fun _1 _3 _5 ->
    (
# 584 "lib/ast/rtypeParser.mly"
                                            ( Tvar _1, _3, _5 )
# 1384 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * (Ident.tvar * Assertion.direction) list *
  (Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_062 =
  fun _1 _4 ->
    (
# 585 "lib/ast/rtypeParser.mly"
                                    ( Tvar _1, [], _4 )
# 1393 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * (Ident.tvar * Assertion.direction) list *
  (Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_063 =
  fun _1 _2 ->
    (
# 587 "lib/ast/rtypeParser.mly"
                          ( _1 :: _2 )
# 1402 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * (Ident.tvar * Assertion.direction) list *
   (Ident.tvar * SolSpace.space_flag * int) list)
  list))

let _menhir_action_064 =
  fun () ->
    (
# 588 "lib/ast/rtypeParser.mly"
        ( [] )
# 1412 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * (Ident.tvar * Assertion.direction) list *
   (Ident.tvar * SolSpace.space_flag * int) list)
  list))

let _menhir_action_065 =
  fun _2 ->
    (
# 354 "lib/ast/rtypeParser.mly"
                       ( _2 )
# 1422 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_066 =
  fun _1 ->
    (
# 355 "lib/ast/rtypeParser.mly"
         ( fun env -> Typeinf.typeinf_formula ~print @@ Formula.mk_atom (_1 env) )
# 1430 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_067 =
  fun _2 ->
    (
# 356 "lib/ast/rtypeParser.mly"
             ( fun env -> Formula.mk_neg (_2 env) )
# 1438 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_068 =
  fun _1 _3 ->
    (
# 357 "lib/ast/rtypeParser.mly"
                  ( fun env -> Formula.mk_and (_1 env) (_3 env) )
# 1446 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_069 =
  fun _1 _3 ->
    (
# 358 "lib/ast/rtypeParser.mly"
                 ( fun env -> Formula.mk_or (_1 env) (_3 env) )
# 1454 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_070 =
  fun _1 _3 ->
    (
# 359 "lib/ast/rtypeParser.mly"
                  ( fun env -> Formula.mk_imply (_1 env) (_3 env) )
# 1462 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_071 =
  fun _1 _3 ->
    (
# 360 "lib/ast/rtypeParser.mly"
                  ( fun env -> Formula.mk_iff (_1 env) (_3 env) )
# 1470 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_072 =
  fun _2 _4 ->
    (
# 365 "lib/ast/rtypeParser.mly"
                          (
    fun env ->
    let env' = List.fold _2 ~init:env ~f:(fun env (x, s) -> Map.Poly.set env ~key:x ~data:s) in
    Formula.forall _2 (_4 env')
  )
# 1482 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_073 =
  fun _2 _4 ->
    (
# 370 "lib/ast/rtypeParser.mly"
                          (
    fun env ->
    let env' = List.fold _2 ~init:env ~f:(fun env (x, s) -> Map.Poly.set env ~key:x ~data:s) in
    Formula.exists _2 (_4 env')
  )
# 1494 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_074 =
  fun _3 ->
    (
# 375 "lib/ast/rtypeParser.mly"
                    (
    fun env -> Formula.forall [] (_3 env)
  )
# 1504 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Formula.t))

let _menhir_action_075 =
  fun _1 _3 _5 ->
    (
# 538 "lib/ast/rtypeParser.mly"
                              ( Tvar _1, SolSpace.space_flag_of _3, _5 )
# 1512 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * SolSpace.space_flag * int))

let _menhir_action_076 =
  fun _1 _3 _5 ->
    (
# 539 "lib/ast/rtypeParser.mly"
                                ( Tvar _1, SolSpace.space_flag_of _3, _5 )
# 1520 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * SolSpace.space_flag * int))

let _menhir_action_077 =
  fun _1 ->
    (
# 541 "lib/ast/rtypeParser.mly"
                 ( [_1] )
# 1528 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_078 =
  fun _1 _3 ->
    (
# 542 "lib/ast/rtypeParser.mly"
                                         ( _1 :: _3 )
# 1536 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_079 =
  fun () ->
    (
# 543 "lib/ast/rtypeParser.mly"
        ( [] )
# 1544 "lib/ast/rtypeParser.ml"
     : ((Ident.tvar * SolSpace.space_flag * int) list))

let _menhir_action_080 =
  fun _2 ->
    (
# 158 "lib/ast/rtypeParser.mly"
                       ( _2 )
# 1552 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_081 =
  fun _2 ->
    (
# 159 "lib/ast/rtypeParser.mly"
                   ( fun env -> T_bool.of_formula @@ _2 env )
# 1560 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_082 =
  fun _1 ->
    (
# 160 "lib/ast/rtypeParser.mly"
          (
    let var = Ident.Tvar _1 in
    fun env ->
      Term.mk_var var @@ try Map.Poly.find_exn env var with Core.Not_found_s _ -> Sort.mk_fresh_svar ()
    (*failwith @@ (Ident.name_of_tvar var) ^ " not found"*) )
# 1572 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_083 =
  fun () ->
    (
# 167 "lib/ast/rtypeParser.mly"
         ( fun _ -> T_bool.make true )
# 1580 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_084 =
  fun () ->
    (
# 168 "lib/ast/rtypeParser.mly"
          ( fun _ -> T_bool.make false )
# 1588 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_085 =
  fun _1 ->
    (
# 169 "lib/ast/rtypeParser.mly"
        ( fun _ -> T_int.from_int _1 )
# 1596 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_086 =
  fun _1 ->
    (
# 170 "lib/ast/rtypeParser.mly"
          ( fun _ -> T_real.mk_real @@ Q.of_float _1 )
# 1604 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_087 =
  fun _2 _4 ->
    (
# 171 "lib/ast/rtypeParser.mly"
                                    (
    let var = Ident.Tvar _2 in
    match Rtype.Env.look_up !Rtype.renv_ref var with
    | Some t ->
      let args, ret = Sort.args_ret_of @@ Rtype.sort_of_val t in
      fun env -> Term.mk_fvar_app var (args @ [ret]) (_4 env)
    | None ->
      match Map.Poly.find (get_fenv ()) var with
      | Some (params, ret_sort, _, _, _) ->
        fun env -> Term.mk_fvar_app var (List.map params ~f:snd @ [ret_sort]) (_4 env)
      | None -> failwith @@ "unbound function variable: " ^ _2
  )
# 1623 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_088 =
  fun _2 ->
    (
# 183 "lib/ast/rtypeParser.mly"
                               ( fun env -> T_num.mk_nneg (_2 env) )
# 1631 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_089 =
  fun _2 ->
    (
# 184 "lib/ast/rtypeParser.mly"
                                ( fun env -> T_real.mk_rneg (_2 env) )
# 1639 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_090 =
  fun _2 ->
    (
# 185 "lib/ast/rtypeParser.mly"
                            ( fun env -> T_int.mk_abs (_2 env) )
# 1647 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_091 =
  fun _2 ->
    (
# 186 "lib/ast/rtypeParser.mly"
                             ( fun env -> T_real.mk_rpower (_2 env) (T_real.mk_real @@ Q.of_float 0.5) )
# 1655 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_092 =
  fun _2 ->
    (
# 187 "lib/ast/rtypeParser.mly"
                              ( fun env -> T_irb.mk_real_to_int (_2 env) )
# 1663 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_093 =
  fun _2 ->
    (
# 188 "lib/ast/rtypeParser.mly"
                               ( fun env -> T_irb.mk_int_to_real (_2 env) )
# 1671 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_094 =
  fun _1 _3 ->
    (
# 189 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_nadd (_1 env) (_3 env) )
# 1679 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_095 =
  fun _1 _3 ->
    (
# 190 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_nsub (_1 env) (_3 env) )
# 1687 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_096 =
  fun _1 _3 ->
    (
# 191 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_nmult (_1 env) (_3 env) )
# 1695 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_097 =
  fun _1 _3 ->
    (
# 192 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_ndiv (_1 env) (_3 env) )
# 1703 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_098 =
  fun _1 _3 ->
    (
# 193 "lib/ast/rtypeParser.mly"
                  ( fun env -> T_num.mk_nmod (_1 env) (_3 env) )
# 1711 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_099 =
  fun _1 _3 ->
    (
# 194 "lib/ast/rtypeParser.mly"
                   ( fun env -> T_real.mk_radd (_1 env) (_3 env) )
# 1719 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_100 =
  fun _1 _3 ->
    (
# 195 "lib/ast/rtypeParser.mly"
                   ( fun env -> T_real.mk_rsub (_1 env) (_3 env) )
# 1727 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_101 =
  fun _1 _3 ->
    (
# 196 "lib/ast/rtypeParser.mly"
                   ( fun env -> T_real.mk_rmult (_1 env) (_3 env) )
# 1735 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_102 =
  fun _1 _3 ->
    (
# 197 "lib/ast/rtypeParser.mly"
                   ( fun env -> T_real.mk_rdiv (_1 env) (_3 env) )
# 1743 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_103 =
  fun _3 _5 ->
    (
# 203 "lib/ast/rtypeParser.mly"
                                      (
    fun env ->
    let t = _5 env in
    match Term.sort_of t with
    | T_tuple.STuple sorts -> T_tuple.mk_tuple_sel sorts t _3
    | _ -> failwith "type error"
  )
# 1757 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_104 =
  fun _1 _3 ->
    (
# 210 "lib/ast/rtypeParser.mly"
                              (
    fun env ->
    let ts = _3 env in
    if String.(_1 = "Tuple")
    then T_tuple.mk_tuple_cons (List.map ~f:Term.sort_of ts) ts
    else
      match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) _1 with
      | Some dt -> T_dt.mk_cons dt _1 ts
      | _ -> failwith @@ "undefined constructor: " ^ _1
  )
# 1774 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_105 =
  fun _1 ->
    (
# 220 "lib/ast/rtypeParser.mly"
          (
    match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) _1 with
    | Some dt -> fun _ -> T_dt.mk_cons dt _1 []
    | _ -> failwith @@ "undefined constructor: " ^ _1
  )
# 1786 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_106 =
  fun _1 _2 ->
    (
# 225 "lib/ast/rtypeParser.mly"
               (
    match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) _1 with
    | Some dt -> fun env -> T_dt.mk_cons dt _1 [_2 env]
    | _ -> failwith @@ "undefined constructor: " ^ _1
  )
# 1798 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_107 =
  fun _1 _3 ->
    (
# 230 "lib/ast/rtypeParser.mly"
                     (
    match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) "::" with
    | Some dt -> fun env -> T_dt.mk_cons dt "::" [_1 env; _3 env]
    | _ -> failwith @@ "undefined constructor: " ^ "::"
  )
# 1810 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_108 =
  fun _3 ->
    (
# 235 "lib/ast/rtypeParser.mly"
                               (
    match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) "::" with
    | Some dt -> fun env -> T_dt.mk_cons dt "::" (_3 env)
    | _ -> failwith @@ "undefined constructor: " ^ "::"
  )
# 1822 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_109 =
  fun _1 _3 ->
    (
# 240 "lib/ast/rtypeParser.mly"
                                (
    let cons_name, n = _1 in
    match DTEnv.look_up_dt_by_cons_name (get_dtenv ()) cons_name with
    | Some dt -> fun env -> T_dt.mk_sel_by_cons dt cons_name n (_3 env)
    | None -> failwith @@ "undefined constructor" ^ cons_name
  )
# 1835 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_110 =
  fun () ->
    (
# 246 "lib/ast/rtypeParser.mly"
            ( fun _ -> Term.mk_fsym_app T_sequence.SeqEpsilon [] )
# 1843 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_111 =
  fun _3 ->
    (
# 247 "lib/ast/rtypeParser.mly"
                              ( fun _ -> Term.mk_fsym_app (T_sequence.SeqSymbol _3) [] )
# 1851 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_112 =
  fun _1 _3 ->
    (
# 248 "lib/ast/rtypeParser.mly"
                       (
    fun env ->
    match Term.sort_of @@ _1 env with
    | T_sequence.SSequence fin ->
      Term.mk_fsym_app (T_sequence.SeqConcat fin) [_1 env; _3 env]
    | _ -> failwith "type error"
  )
# 1865 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t))

let _menhir_action_113 =
  fun _1 ->
    (
# 274 "lib/ast/rtypeParser.mly"
         ( fun env -> [_1 env] )
# 1873 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t list))

let _menhir_action_114 =
  fun _1 _3 ->
    (
# 275 "lib/ast/rtypeParser.mly"
                     ( fun env -> _1 env :: _3 env )
# 1881 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> LogicOld.Term.t list))

let _menhir_action_115 =
  fun _2 ->
    (
# 391 "lib/ast/rtypeParser.mly"
                         ( _2 )
# 1889 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_116 =
  fun _1 ->
    (
# 392 "lib/ast/rtypeParser.mly"
          (
    fun _ ->
    Rtype.simple_val_of_sort ~config:!Rtype.cgen_config @@
    Typeinf.sort_of_name (get_dtenv ()) _1
  )
# 1901 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_117 =
  fun _1 _2 ->
    (
# 397 "lib/ast/rtypeParser.mly"
                                      (
    if String.(_2 = "ref") then
      fun env -> Rtype.mk_rref (_1 env) (Rtype.mk_fresh_trivial_pred ())
    else
      fun env ->
      Rtype.mk_rcompound [_1 env] (Typeinf.sort_of_name (get_dtenv ()) _2) @@
      Rtype.mk_fresh_trivial_pred ()
  )
# 1916 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_118 =
  fun _2 _4 ->
    (
# 405 "lib/ast/rtypeParser.mly"
                                                           (
    fun env ->
    Rtype.mk_rcompound (_2 env) (Typeinf.sort_of_name (get_dtenv ()) _4) @@
    Rtype.mk_fresh_trivial_pred ()
  )
# 1928 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_119 =
  fun _1 _3 ->
    (
# 410 "lib/ast/rtypeParser.mly"
                                                (
    fun env ->
    let t = _1 env in
    let x = Rtype.tvar_of_val t in
    let c = _3 env in
    Rtype.mk_rarrow x t c @@ Rtype.mk_fresh_trivial_pred ()
  )
# 1942 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_120 =
  fun _2 _4 _7 ->
    (
# 417 "lib/ast/rtypeParser.mly"
                                                                          (
    fun env ->
    let x = Ident.Tvar _2 in
    let t = _4 env in
    let c = _7 (Map.Poly.set env ~key:x ~data:(Rtype.sort_of_val t)) in
    Rtype.mk_rarrow x t c @@ Rtype.mk_fresh_trivial_pred ()
  )
# 1956 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_121 =
  fun _1 ->
    (
# 424 "lib/ast/rtypeParser.mly"
                                  (
    fun env ->
    Rtype.mk_rtuple (_1 env) @@ Rtype.mk_fresh_trivial_pred ()
  )
# 1967 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_122 =
  fun _2 _4 _6 ->
    (
# 428 "lib/ast/rtypeParser.mly"
                                           (
    fun env ->
    let x = Ident.Tvar _2 in
    let t = _4 env in
    Rtype.conj_pred_val (x, _6 (Map.Poly.set env ~key:x ~data:(Rtype.sort_of_val t))) t
  )
# 1980 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t))

let _menhir_action_123 =
  fun _1 _3 ->
    (
# 519 "lib/ast/rtypeParser.mly"
                        (
    Ident.Tvar _1, Rtype.set_sort_val ~print Map.Poly.empty (_3 Map.Poly.empty)
  )
# 1990 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Rtype.t))

let _menhir_action_124 =
  fun _1 _3 ->
    (
# 522 "lib/ast/rtypeParser.mly"
                        (
    Ident.Tvar _1, Rtype.set_sort_val ~print Map.Poly.empty (_3 Map.Poly.empty)
  )
# 2000 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Rtype.t))

let _menhir_action_125 =
  fun _3 ->
    (
# 525 "lib/ast/rtypeParser.mly"
                         (
    Ident.Tvar "::", Rtype.set_sort_val ~print Map.Poly.empty (_3 Map.Poly.empty)
  )
# 2010 "lib/ast/rtypeParser.ml"
     : (Ident.tvar * Rtype.t))

let _menhir_action_126 =
  fun _1 _2 ->
    (
# 529 "lib/ast/rtypeParser.mly"
                           (
    let tvar, ty = _1 in
    Rtype.Env.set_ty _2 tvar @@ Rtype.aconv_val Map.Poly.empty ty
  )
# 2021 "lib/ast/rtypeParser.ml"
     : (Rtype.env))

let _menhir_action_127 =
  fun () ->
    (
# 533 "lib/ast/rtypeParser.mly"
        ( Rtype.Env.mk_empty () )
# 2029 "lib/ast/rtypeParser.ml"
     : (Rtype.env))

let _menhir_action_128 =
  fun _1 _3 ->
    (
# 438 "lib/ast/rtypeParser.mly"
                      ( fun env -> [_1 env; _3 env] )
# 2037 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t list))

let _menhir_action_129 =
  fun _1 _3 ->
    (
# 439 "lib/ast/rtypeParser.mly"
                           ( fun env -> _1 env @ [_3 env] )
# 2045 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t list))

let _menhir_action_130 =
  fun _1 _3 ->
    (
# 435 "lib/ast/rtypeParser.mly"
                        ( fun env -> [_1 env; _3 env] )
# 2053 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t list))

let _menhir_action_131 =
  fun _1 _3 ->
    (
# 436 "lib/ast/rtypeParser.mly"
                               ( fun env -> _1 env @ [_3 env] )
# 2061 "lib/ast/rtypeParser.ml"
     : (LogicOld.sort_env_map -> Rtype.t list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ABS ->
        "ABS"
    | ACCESSOR _ ->
        "ACCESSOR"
    | ADD ->
        "ADD"
    | AMP ->
        "AMP"
    | AND ->
        "AND"
    | APPLY ->
        "APPLY"
    | ARROW ->
        "ARROW"
    | AST ->
        "AST"
    | BOOL _ ->
        "BOOL"
    | COLCOL ->
        "COLCOL"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | CONST _ ->
        "CONST"
    | DIV ->
        "DIV"
    | DOT ->
        "DOT"
    | EOF ->
        "EOF"
    | EPSILON ->
        "EPSILON"
    | EQUAL ->
        "EQUAL"
    | EVENT ->
        "EVENT"
    | EXC ->
        "EXC"
    | EXISTS ->
        "EXISTS"
    | FADD ->
        "FADD"
    | FALSE ->
        "FALSE"
    | FDIV ->
        "FDIV"
    | FINEFFECTOF ->
        "FINEFFECTOF"
    | FLOAT _ ->
        "FLOAT"
    | FMUL ->
        "FMUL"
    | FORALL ->
        "FORALL"
    | FSUB ->
        "FSUB"
    | GEQ ->
        "GEQ"
    | GT ->
        "GT"
    | IDENT _ ->
        "IDENT"
    | IDENT_T _ ->
        "IDENT_T"
    | IFF ->
        "IFF"
    | IMP ->
        "IMP"
    | IN ->
        "IN"
    | INFEFFECTOF ->
        "INFEFFECTOF"
    | INT _ ->
        "INT"
    | LBRA ->
        "LBRA"
    | LEQ ->
        "LEQ"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MAXIMIZE ->
        "MAXIMIZE"
    | MINIMIZE ->
        "MINIMIZE"
    | MOD ->
        "MOD"
    | NOT ->
        "NOT"
    | NOTEQUAL ->
        "NOTEQUAL"
    | OR ->
        "OR"
    | PLUSPLUS ->
        "PLUSPLUS"
    | PROJ ->
        "PROJ"
    | QUESTION ->
        "QUESTION"
    | RBRA ->
        "RBRA"
    | RECOGNIZER _ ->
        "RECOGNIZER"
    | RPAREN ->
        "RPAREN"
    | RTRI ->
        "RTRI"
    | SEMICOLON ->
        "SEMICOLON"
    | SEMPTY ->
        "SEMPTY"
    | SQRT ->
        "SQRT"
    | SUB ->
        "SUB"
    | SUBTYPE ->
        "SUBTYPE"
    | TRUE ->
        "TRUE"
    | TYPEOF ->
        "TYPEOF"
    | ToInt ->
        "ToInt"
    | ToReal ->
        "ToReal"
    | VERT ->
        "VERT"
    | WILDCARD ->
        "WILDCARD"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_267 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_comp_ty =
    fun _menhir_stack _v ->
      MenhirBox_comp_ty _v
  
  let _menhir_run_326 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _v ->
      MenhirBox_val_ty_env _v
  
  let rec _menhir_goto_val_ty_env : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_val_ty_env) _menhir_state -> _menhir_box_val_ty_env =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState327 ->
          _menhir_run_328 _menhir_stack _v
      | MenhirState315 ->
          _menhir_run_326 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_328 : type  ttv_stack. (ttv_stack, _menhir_box_val_ty_env) _menhir_cell1_val_ty_bind -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _v ->
      let MenhirCell1_val_ty_bind (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_126 _1 _2 in
      _menhir_goto_val_ty_env _menhir_stack _v _menhir_s
  
  let _menhir_run_319 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_val_ty_env) _menhir_state -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_127 () in
      _menhir_goto_val_ty_env _menhir_stack _v _menhir_s
  
  let _menhir_run_273 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_constraints =
    fun _menhir_stack _v ->
      MenhirBox_constraints _v
  
  let rec _menhir_goto_constraints : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_constraints) _menhir_state -> _menhir_box_constraints =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState268 ->
          _menhir_run_273 _menhir_stack _v
      | MenhirState271 ->
          _menhir_run_272 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_272 : type  ttv_stack. (ttv_stack, _menhir_box_constraints) _menhir_cell1_prop -> _ -> _menhir_box_constraints =
    fun _menhir_stack _v ->
      let MenhirCell1_prop (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_035 _1 _3 in
      _menhir_goto_constraints _menhir_stack _v _menhir_s
  
  let _menhir_run_269 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_constraints) _menhir_state -> _menhir_box_constraints =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_036 () in
      _menhir_goto_constraints _menhir_stack _v _menhir_s
  
  let _menhir_run_263 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_assertions =
    fun _menhir_stack _v ->
      MenhirBox_assertions _v
  
  let rec _menhir_goto_assertions : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_assertions) _menhir_state -> _menhir_box_assertions =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState264 ->
          _menhir_run_265 _menhir_stack _v
      | MenhirState000 ->
          _menhir_run_263 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_265 : type  ttv_stack. (ttv_stack, _menhir_box_assertions) _menhir_cell1_assertion -> _ -> _menhir_box_assertions =
    fun _menhir_stack _v ->
      let MenhirCell1_assertion (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_009 _1 _2 in
      _menhir_goto_assertions _menhir_stack _v _menhir_s
  
  let _menhir_run_262 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_assertions) _menhir_state -> _menhir_box_assertions =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_010 () in
      _menhir_goto_assertions _menhir_stack _v _menhir_s
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_assertions) _menhir_state -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TYPEOF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SUBTYPE ->
                      let _menhir_s = MenhirState005 in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | LBRA ->
                          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | IDENT _v ->
                          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
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
  
  and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState006 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRA (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState007 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_008 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LBRA as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState009 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_116 _1 in
      _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_val_ty : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState324 ->
          _menhir_run_325 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState321 ->
          _menhir_run_322 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState317 ->
          _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState006 ->
          _menhir_run_248 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_244 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState232 ->
          _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState159 ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState266 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState227 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState031 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_325 : type  ttv_stack. ((ttv_stack, _menhir_box_val_ty_env) _menhir_cell1_COLCOL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_val_ty_env) _menhir_state -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL | CONST _ | EOF ->
          let MenhirCell1_COLCOL (_menhir_stack, _menhir_s) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_125 _3 in
          _menhir_goto_val_ty_bind _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_val_ty (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_117 _1 _2 in
      _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_027 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState027 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState015 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_030 () in
      _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_comp_ty : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState266 ->
          _menhir_run_267 _menhir_stack _v
      | MenhirState015 ->
          _menhir_run_243 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState062 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState044 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState227 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_243 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_val_ty (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_119 _1 _3 in
      _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_063 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_comp_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_comp_ty (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_039 _1 _3 in
      _menhir_goto_cont_eff_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_cont_eff_ty : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState044 ->
          _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState227 ->
          _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_230 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_val_ty (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_032 _2 _4 in
          _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_228 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_opsig_ty, ttv_result) _menhir_cell1_val_ty _menhir_cell0_IDENT, ttv_result) _menhir_cell1_prop _menhir_cell0_IDENT, ttv_result) _menhir_cell1_prop -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_prop (_menhir_stack, _, _12) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, _10) = _menhir_stack in
          let MenhirCell1_prop (_menhir_stack, _, _8) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, _6) = _menhir_stack in
          let MenhirCell1_val_ty (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_opsig_ty (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _14 = _v in
          let _v = _menhir_action_034 _10 _12 _14 _2 _4 _6 _8 in
          _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_opsig_ty, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_val_ty (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_opsig_ty (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_033 _2 _4 _6 in
          _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_comp_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IMP ->
          let _menhir_s = MenhirState062 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QUESTION ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState017 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMPTY ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_056 () in
      _menhir_goto_opsig_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_opsig_ty : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_opsig_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RTRI ->
          let _menhir_s = MenhirState056 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RBRA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_057 () in
          _menhir_goto_opsig_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LBRA (_menhir_stack, _menhir_s) in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState019
      | CONST _v ->
          let _menhir_stack = MenhirCell1_LBRA (_menhir_stack, _menhir_s) in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState019
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState022 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState031 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AMP | ARROW | AST | COMMA | DIV | IDENT _ | RPAREN ->
          let _1 = _v in
          let _v = _menhir_action_116 _1 in
          _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_054 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FORALL _menhir_cell0_IDENT, ttv_result) _menhir_cell1_comp_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_comp_ty (_menhir_stack, _, _5) = _menhir_stack in
      let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell1_FORALL (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _8 = _v in
      let _v = _menhir_action_040 _3 _5 _8 in
      _menhir_goto_cont_eff_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_051 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_FORALL _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_comp_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IMP ->
              let _menhir_s = MenhirState053 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | QUESTION ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRA ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_IDENT, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_val_ty (_menhir_stack, _, _4) = _menhir_stack in
      let MenhirCell1_IDENT (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _7 = _v in
      let _v = _menhir_action_120 _2 _4 _7 in
      _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_val_ty_bind : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_val_ty_env) _menhir_state -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_val_ty_bind (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          _menhir_run_319 _menhir_stack MenhirState327
      | CONST _v_1 ->
          _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState327
      | COLCOL ->
          _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_320 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_val_ty_env) _menhir_state -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLCOL ->
          let _menhir_s = MenhirState321 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_323 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_val_ty_env) _menhir_state -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COLCOL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLCOL ->
          let _menhir_s = MenhirState324 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_322 : type  ttv_stack. ((ttv_stack, _menhir_box_val_ty_env) _menhir_cell1_CONST as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_val_ty_env) _menhir_state -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL | CONST _ | EOF ->
          let MenhirCell1_CONST (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_124 _1 _3 in
          _menhir_goto_val_ty_bind _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_318 : type  ttv_stack. ((ttv_stack, _menhir_box_val_ty_env) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_val_ty_env) _menhir_state -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL | CONST _ | EOF ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_123 _1 _3 in
          _menhir_goto_val_ty_bind _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_249 : type  ttv_stack. ((ttv_stack, _menhir_box_assertions) _menhir_cell1_TYPEOF _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_assertions) _menhir_state -> _ -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | FINEFFECTOF | INFEFFECTOF | TYPEOF ->
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_TYPEOF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_006 _3 _6 in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_assertion : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_assertions) _menhir_state -> _ -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_assertion (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TYPEOF ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState264
      | INFEFFECTOF ->
          _menhir_run_250 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState264
      | FINEFFECTOF ->
          _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState264
      | EOF ->
          _menhir_run_262 _menhir_stack MenhirState264
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_250 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_assertions) _menhir_state -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_INFEFFECTOF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SUBTYPE ->
                      let _menhir_s = MenhirState254 in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | EVENT ->
                          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
  
  and _menhir_run_175 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState175 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_176 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | EXC ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _3 = _v in
                      let _v = _menhir_action_047 _3 in
                      _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | AST ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _3 = _v in
                      let _v = _menhir_action_046 _3 in
                      _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | AND | COMMA | DIV | EOF | EQUAL | EVENT | FINEFFECTOF | IFF | IMP | INFEFFECTOF | LPAREN | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | TYPEOF | VERT ->
                      let _3 = _v in
                      let _v = _menhir_action_045 _3 in
                      _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_eff : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState260 ->
          _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState254 ->
          _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState261 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState255 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState189 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState182 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState183 ->
          _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_261 : type  ttv_stack. ((ttv_stack, _menhir_box_assertions) _menhir_cell1_FINEFFECTOF _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_assertions) _menhir_state -> _ -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState261
      | LPAREN ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState261
      | EVENT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState261
      | EOF | FINEFFECTOF | INFEFFECTOF | TYPEOF ->
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_FINEFFECTOF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_007 _3 _6 in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_183 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_eff as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VERT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState183 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_255 : type  ttv_stack. ((ttv_stack, _menhir_box_assertions) _menhir_cell1_INFEFFECTOF _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_assertions) _menhir_state -> _ -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | LPAREN ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | EVENT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | EOF | FINEFFECTOF | INFEFFECTOF | TYPEOF ->
          let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_INFEFFECTOF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_008 _3 _6 in
          _menhir_goto_assertion _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_189 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState189
      | LPAREN ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState189
      | EVENT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState189
      | AND | COMMA | DIV | EOF | EQUAL | IFF | IMP | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_023 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState274 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState268 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState245 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState236 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState225 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState151 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState161 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState167 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState195 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState199 ->
          _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState205 ->
          _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState202 ->
          _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_207 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | EQUAL | NOTEQUAL ->
          let _1 = _v in
          let _v = _menhir_action_024 _1 in
          _menhir_goto_atom_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | AND | COMMA | DIV | EOF | IFF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let _1 = _v in
          let _v = _menhir_action_066 _1 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_atom_or_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState205 ->
          _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState202 ->
          _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState274 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState268 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState245 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState236 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState225 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState151 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState161 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState167 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState195 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState199 ->
          _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_206 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom_or_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom_or_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_016 _1 _3 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_203 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom_or_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom_or_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_017 _1 _3 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_201 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_atom_or_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | NOTEQUAL ->
          let _menhir_s = MenhirState202 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RECOGNIZER _v ->
              _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_s = MenhirState205 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RECOGNIZER _v ->
              _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VERT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState067 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ToReal (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState068 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ToInt (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState069 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_083 () in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState151 ->
          _menhir_run_216 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState192 ->
          _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState190 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState170 ->
          _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState274 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState268 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState245 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState236 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState225 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState161 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState205 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState202 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState199 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState195 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState167 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState147 ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState071 ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState072 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState076 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState077 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState088 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState121 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState108 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState106 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState104 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState102 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_216 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL | NOTEQUAL ->
          let _1 = _v in
          let _v = _menhir_action_025 _1 in
          _menhir_goto_atom_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState100 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SUB (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState071 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SQRT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState072 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROJ (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INT _v ->
              let _menhir_stack = MenhirCell0_INT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COMMA ->
                  let _menhir_s = MenhirState076 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | VERT ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToReal ->
                      _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToInt ->
                      _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SUB ->
                      _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SQRT ->
                      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | PROJ ->
                      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INT _v ->
                      _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | IDENT _v ->
                      _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FSUB ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FLOAT _v ->
                      _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FALSE ->
                      _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EVENT ->
                      _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EPSILON ->
                      _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CONST _v ->
                      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | COLCOL ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | APPLY ->
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ACCESSOR _v ->
                      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ABS ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState077 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_085 _1 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_079 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_082 _1 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_080 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FSUB (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState080 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_086 _1 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_082 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_084 () in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_083 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _3 = _v in
                  let _v = _menhir_action_111 _3 in
                  _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_110 () in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_088 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | ToReal ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | ToInt ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | TRUE ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | SUB ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | SQRT ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | PROJ ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | LPAREN ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, MenhirState088) in
          let _menhir_s = MenhirState089 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | INT _v_5 ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState088
      | IDENT _v_6 ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState088
      | FSUB ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | FLOAT _v_7 ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState088
      | FALSE ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | EVENT ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | EPSILON ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | CONST _v_8 ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState088
      | COLCOL ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | APPLY ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | ACCESSOR _v_9 ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v_9 MenhirState088
      | ABS ->
          let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
      | ADD | AND | AST | COMMA | DIV | EOF | EQUAL | FADD | FDIV | FMUL | GEQ | GT | IFF | IMP | IN | LEQ | LT | MOD | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON ->
          let _1 = _v in
          let _v = _menhir_action_105 _1 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COLCOL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState091 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_APPLY (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_s = MenhirState094 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VERT ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ToReal ->
                  _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ToInt ->
                  _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SUB ->
                  _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | SQRT ->
                  _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | PROJ ->
                  _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IDENT _v ->
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FSUB ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FLOAT _v ->
                  _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FALSE ->
                  _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EVENT ->
                  _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EPSILON ->
                  _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CONST _v ->
                  _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | COLCOL ->
                  _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | APPLY ->
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ACCESSOR _v ->
                  _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | ABS ->
                  _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ACCESSOR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState096 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ABS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState097 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_133 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_term (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_080 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_113 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState113 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState102 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_170 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState170 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_172 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState172 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_174 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState174 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_190 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState190 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_192 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState192 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState115 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState104 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState106 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState117 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState108 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_121 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState121 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState110 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState119 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_193 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | IFF | IMP | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_021 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_191 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | IFF | IMP | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_019 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_173 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | IFF | IMP | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_020 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_171 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | IFF | IMP | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_018 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_169 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GEQ ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | IFF | IMP | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let _1 = _v in
          let _v = _menhir_action_025 _1 in
          _menhir_goto_atom_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_148 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_RECOGNIZER as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RECOGNIZER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_022 _1 _3 in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_142 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ToReal -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ToReal (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_093 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_141 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ToInt -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ToInt (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_092 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_140 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_SUB -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SUB (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_088 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_139 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_SQRT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SQRT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_091 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_137 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_PROJ _menhir_cell0_INT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_INT (_menhir_stack, _3) = _menhir_stack in
          let MenhirCell1_PROJ (_menhir_stack, _menhir_s) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_103 _3 _5 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_136 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SUB ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_135 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_FSUB -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FSUB (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_089 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_134 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_CONST as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_CONST (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_106 _1 _2 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_132 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_CONST, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SUB ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState126 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_125 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _1 = _v in
          let _v = _menhir_action_113 _1 in
          _menhir_goto_terms _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_terms : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState153 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState089 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState091 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState094 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_155 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IDENT -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_015 _1 _3 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_130 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_CONST, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LPAREN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_CONST (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_104 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_128 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_COLCOL -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_COLCOL (_menhir_stack, _menhir_s) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_108 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_127 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_114 _1 _3 in
      _menhir_goto_terms _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_123 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_APPLY _menhir_cell0_IDENT -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_IDENT (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_APPLY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_087 _2 _4 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_122 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EOF | EQUAL | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_107 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COLCOL | COMMA | EOF | EQUAL | FADD | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_094 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_118 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COLCOL | COMMA | EOF | EQUAL | FADD | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_099 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COLCOL | COMMA | EOF | EQUAL | FADD | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_100 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_114 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COLCOL | COMMA | EOF | EQUAL | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_112 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_111 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_096 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_109 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_097 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_107 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_102 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_105 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_101 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_103 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_098 _1 _3 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_101 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COLCOL | COMMA | EOF | EQUAL | FADD | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let MenhirCell1_term (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_095 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ACCESSOR as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ACCESSOR (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_109 _1 _3 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUSPLUS ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FSUB ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FMUL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FDIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | FADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLCOL ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ABS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ABS (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_090 _2 in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_143 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_013 () in
              _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | ADD | AND | AST | COLCOL | COMMA | DIV | EOF | EQUAL | FADD | FDIV | FMUL | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | MOD | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let _v = _menhir_action_083 () in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_146 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_RECOGNIZER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState147 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_150 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState150 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_151 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState151 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_152 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | ToReal ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | ToInt ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | TRUE ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | SUB ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | SQRT ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | RPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v in
              let _v = _menhir_action_011 _1 in
              _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | PROJ ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | LPAREN ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | INT _v_0 ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState153
          | IDENT _v_1 ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState153
          | FSUB ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | FLOAT _v_2 ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState153
          | FALSE ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | EVENT ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | EPSILON ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | CONST _v_3 ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState153
          | COLCOL ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | APPLY ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | ACCESSOR _v_4 ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState153
          | ABS ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
          | _ ->
              _eRR ())
      | ADD | AND | AST | COLCOL | COMMA | DIV | EOF | EQUAL | FADD | FDIV | FMUL | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | MOD | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let _1 = _v in
          let _v = _menhir_action_082 _1 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_157 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState157 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOT ->
          let _menhir_stack = MenhirCell1_DOT (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState161 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RECOGNIZER _v ->
              _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FORALL ->
              _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_158 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState159 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_162 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_014 () in
              _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | ADD | AND | AST | COLCOL | COMMA | DIV | EOF | EQUAL | FADD | FDIV | FMUL | FSUB | GEQ | GT | IFF | IMP | IN | LEQ | LT | MOD | NOTEQUAL | OR | PLUSPLUS | RBRA | RPAREN | SEMICOLON | SUB | VERT ->
          let _v = _menhir_action_084 () in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_165 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState165 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_168 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_012 _1 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_prop : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState274 ->
          _menhir_run_275 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState268 ->
          _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState245 ->
          _menhir_run_246 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_241 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState236 ->
          _menhir_run_237 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState225 ->
          _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState151 ->
          _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState161 ->
          _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_209 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState199 ->
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState195 ->
          _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState167 ->
          _menhir_run_194 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_275 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_formula) _menhir_state -> _ -> _menhir_box_formula =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_053 _1 in
          MenhirBox_formula _v
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_197 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_prop -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState197 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_208 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_prop -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState208 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_195 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_prop -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState195 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_199 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_prop -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState199 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_270 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_constraints) _menhir_state -> _ -> _menhir_box_constraints =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_s = MenhirState271 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RECOGNIZER _v ->
              _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FORALL ->
              _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EOF ->
              _menhir_run_269 _menhir_stack _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | OR ->
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_246 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LBRA, ttv_result) _menhir_cell1_IDENT, ttv_result) _menhir_cell1_val_ty as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_val_ty (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_IDENT (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LBRA (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_122 _2 _4 _6 in
          _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_241 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_ty _menhir_cell0_IDENT, ttv_result) _menhir_cell1_prop _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _8) = _menhir_stack in
          let MenhirCell1_prop (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, _4) = _menhir_stack in
          let MenhirCell1_val_ty (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _10 = _v in
          let _v = _menhir_action_031 _10 _2 _4 _6 _8 in
          _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_237 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_ty _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState240 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | VERT ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToReal ->
                      _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToInt ->
                      _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SUB ->
                      _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SQRT ->
                      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RECOGNIZER _v ->
                      _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | PROJ ->
                      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | NOT ->
                      _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INT _v ->
                      _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | IDENT _v ->
                      _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FSUB ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FORALL ->
                      _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FLOAT _v ->
                      _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FALSE ->
                      _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EXISTS ->
                      _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EVENT ->
                      _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EPSILON ->
                      _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CONST _v ->
                      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | COLCOL ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BOOL _v ->
                      _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | APPLY ->
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ACCESSOR _v ->
                      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ABS ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_226 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_opsig_ty, ttv_result) _menhir_cell1_val_ty _menhir_cell0_IDENT, ttv_result) _menhir_cell1_prop _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_s = MenhirState227 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WILDCARD ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUESTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_037 () in
      _menhir_goto_cont_eff_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IMP ->
          let _v = _menhir_action_030 () in
          _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | RPAREN ->
          let _v = _menhir_action_038 () in
          _menhir_goto_cont_eff_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState047 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMPTY ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState050 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | QUESTION ->
                      _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBRA ->
                      _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IDENT _v ->
                      _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_222 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_opsig_ty, ttv_result) _menhir_cell1_val_ty _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState225 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | VERT ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToReal ->
                      _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToInt ->
                      _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SUB ->
                      _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SQRT ->
                      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RECOGNIZER _v ->
                      _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | PROJ ->
                      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | NOT ->
                      _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INT _v ->
                      _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | IDENT _v ->
                      _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FSUB ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FORALL ->
                      _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FLOAT _v ->
                      _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FALSE ->
                      _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EXISTS ->
                      _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EVENT ->
                      _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EPSILON ->
                      _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CONST _v ->
                      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | COLCOL ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BOOL _v ->
                      _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | APPLY ->
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ACCESSOR _v ->
                      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ABS ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_220 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_VERT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_VERT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_081 _2 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_219 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_NOT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DIV | EOF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_067 _2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_217 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_065 _2 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_215 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_FORALL, ttv_result) _menhir_cell1_binds as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DIV | EOF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_binds (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_FORALL (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_072 _2 _4 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_212 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_FORALL, ttv_result) _menhir_cell1_DOT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DIV | EOF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_DOT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_FORALL (_menhir_stack, _menhir_s) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_074 _3 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_209 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DIV | EOF | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_070 _1 _3 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_200 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DIV | EOF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_068 _1 _3 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_198 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DIV | EOF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_069 _1 _3 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_196 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_prop as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DIV | EOF | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_prop (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_071 _1 _3 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_194 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_EXISTS, ttv_result) _menhir_cell1_binds as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IFF ->
          let _menhir_stack = MenhirCell1_prop (_menhir_stack, _menhir_s, _v) in
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DIV | EOF | IMP | OR | RBRA | RPAREN | SEMICOLON | VERT ->
          let MenhirCell1_binds (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_EXISTS (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_073 _2 _4 in
          _menhir_goto_prop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_204 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_024 _1 in
      _menhir_goto_atom_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_185 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_eff as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | LPAREN ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | EVENT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | AND | COMMA | DIV | EOF | EQUAL | FINEFFECTOF | IFF | IMP | INFEFFECTOF | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | TYPEOF ->
          let MenhirCell1_eff (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_051 _1 _2 in
          _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_184 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_eff, ttv_result) _menhir_cell1_VERT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
      | EVENT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
      | AND | COMMA | DIV | EOF | EQUAL | FINEFFECTOF | IFF | IMP | INFEFFECTOF | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | TYPEOF | VERT ->
          let MenhirCell1_VERT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_eff (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_052 _1 _3 in
          _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_182 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState182
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EXC ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
              let _2 = _v in
              let _v = _menhir_action_050 _2 in
              _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | AST ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
              let _2 = _v in
              let _v = _menhir_action_049 _2 in
              _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | AND | COMMA | DIV | EOF | EQUAL | EVENT | FINEFFECTOF | IFF | IMP | INFEFFECTOF | LPAREN | NOTEQUAL | OR | RBRA | RPAREN | SEMICOLON | TYPEOF | VERT ->
              let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
              let _2 = _v in
              let _v = _menhir_action_048 _2 in
              _menhir_goto_eff _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | LPAREN ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState182
      | EVENT ->
          let _menhir_stack = MenhirCell1_eff (_menhir_stack, _menhir_s, _v) in
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState182
      | _ ->
          _eRR ()
  
  and _menhir_run_256 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_assertions) _menhir_state -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FINEFFECTOF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SUBTYPE ->
                      let _menhir_s = MenhirState260 in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                      | EVENT ->
                          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
  
  and _menhir_run_248 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | COMMA ->
          _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_val_ty (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_115 _2 in
      _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_232 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState232 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_244 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LBRA, ttv_result) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          let _menhir_s = MenhirState245 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERT ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToReal ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ToInt ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SUB ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SQRT ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RECOGNIZER _v ->
              _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PROJ ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FSUB ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FORALL ->
              _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FLOAT _v ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EVENT ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EPSILON ->
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CONST _v ->
              _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COLCOL ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BOOL _v ->
              _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | APPLY ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ACCESSOR _v ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ABS ->
              _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | IDENT _v_7 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7
      | AST ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_233 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_ty as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | RPAREN ->
          let MenhirCell1_val_ty (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_130 _1 _3 in
          _menhir_goto_val_tys_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_val_tys_comma : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_2, _4) = (_v, _v_0) in
              let _v = _menhir_action_118 _2 _4 in
              _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | COMMA ->
          let _menhir_stack = MenhirCell1_val_tys_comma (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState040 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_160 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_026 _1 _3 in
          let _1 = _v in
          let _v = _menhir_action_027 _1 in
          _menhir_goto_binds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_binds : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState157 ->
          _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState210 ->
          _menhir_run_211 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState165 ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_213 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_binds (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState214 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_211 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_bind -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_bind (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_028 _1 _2 in
      _menhir_goto_binds _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_166 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_binds (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState167 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_opsig_ty as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | DIV ->
          let _menhir_s = MenhirState058 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WILDCARD ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUESTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AST ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState066 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | VERT ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToReal ->
                      _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToInt ->
                      _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SUB ->
                      _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SQRT ->
                      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RECOGNIZER _v ->
                      _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | PROJ ->
                      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | NOT ->
                      _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INT _v ->
                      _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | IDENT _v ->
                      _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FSUB ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FORALL ->
                      _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FLOAT _v ->
                      _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FALSE ->
                      _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EXISTS ->
                      _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EVENT ->
                      _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EPSILON ->
                      _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CONST _v ->
                      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | COLCOL ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BOOL _v ->
                      _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | APPLY ->
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ACCESSOR _v ->
                      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ABS ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IDENT _v_0 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | DIV ->
          let _menhir_s = MenhirState044 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WILDCARD ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUESTION ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | COMMA ->
          _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AST ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  let _menhir_s = MenhirState236 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | VERT ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToReal ->
                      _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ToInt ->
                      _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | TRUE ->
                      _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SUB ->
                      _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | SQRT ->
                      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RECOGNIZER _v ->
                      _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | PROJ ->
                      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | NOT ->
                      _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LPAREN ->
                      _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INT _v ->
                      _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | IDENT _v ->
                      _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FSUB ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FORALL ->
                      _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | FLOAT _v ->
                      _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | FALSE ->
                      _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EXISTS ->
                      _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EVENT ->
                      _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EPSILON ->
                      _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | CONST _v ->
                      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | COLCOL ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BOOL _v ->
                      _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | APPLY ->
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ACCESSOR _v ->
                      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ABS ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_val_tys_comma as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | RPAREN ->
          let MenhirCell1_val_tys_comma (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_131 _1 _3 in
          _menhir_goto_val_tys_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP | COLCOL | COMMA | CONST _ | DIV | DOT | EOF | FINEFFECTOF | IMP | INFEFFECTOF | RBRA | RPAREN | TYPEOF | VERT ->
          let _1 = _v in
          let _v = _menhir_action_029 _1 in
          _menhir_goto_comp_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ARROW ->
              let _menhir_s = MenhirState034 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | QUESTION ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRA ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IDENT _v_1 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | AST ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_val_ty as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP | AST | COLCOL | COMMA | CONST _ | DIV | DOT | EOF | FINEFFECTOF | IMP | INFEFFECTOF | RBRA | RPAREN | TYPEOF | VERT ->
          let MenhirCell1_val_ty (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_128 _1 _3 in
          _menhir_goto_val_tys_ast _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_val_tys_ast : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AST ->
          let _menhir_stack = MenhirCell1_val_tys_ast (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState012 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRA ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AMP | ARROW | COLCOL | COMMA | CONST _ | DIV | DOT | EOF | FINEFFECTOF | IDENT _ | IMP | INFEFFECTOF | RBRA | RPAREN | TYPEOF | VERT ->
          let _1 = _v in
          let _v = _menhir_action_121 _1 in
          _menhir_goto_val_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_023 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_CONST as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CONST (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_054 _1 _3 in
          _menhir_goto_op_tys _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | COMMA ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState025 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | CONST _v ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AST ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_op_tys : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState019 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_029 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LPAREN, ttv_result) _menhir_cell1_LBRA -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LBRA (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_058 _2 in
      _menhir_goto_opsig_ty _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_CONST, ttv_result) _menhir_cell1_val_ty -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_val_ty (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_CONST (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_055 _1 _3 _5 in
      _menhir_goto_op_tys _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_013 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_val_tys_ast as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | ARROW ->
          let _menhir_stack = MenhirCell1_val_ty (_menhir_stack, _menhir_s, _v) in
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP | AST | COLCOL | COMMA | CONST _ | DIV | DOT | EOF | FINEFFECTOF | IMP | INFEFFECTOF | RBRA | RPAREN | TYPEOF | VERT ->
          let MenhirCell1_val_tys_ast (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_129 _1 _3 in
          _menhir_goto_val_tys_ast _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_assertions =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPEOF ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INFEFFECTOF ->
          _menhir_run_250 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FINEFFECTOF ->
          _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EOF ->
          _menhir_run_262 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_266 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_comp_ty =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState266 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | QUESTION ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRA ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_268 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_constraints =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState268 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EOF ->
          _menhir_run_269 _menhir_stack _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_274 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_formula =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState274 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VERT ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToReal ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ToInt ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SUB ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SQRT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RECOGNIZER _v ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PROJ ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FSUB ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FLOAT _v ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EVENT ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EPSILON ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CONST _v ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BOOL _v ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | APPLY ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ACCESSOR _v ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ABS ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_312 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _v ->
      MenhirBox_opt_problems _v
  
  let rec _menhir_goto_opt_problems : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState313 ->
          _menhir_run_314 _menhir_stack _v
      | MenhirState278 ->
          _menhir_run_312 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_314 : type  ttv_stack. (ttv_stack, _menhir_box_opt_problems) _menhir_cell1_opt_pair -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _v ->
      let MenhirCell1_opt_pair (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_063 _1 _2 in
      _menhir_goto_opt_problems _menhir_stack _v _menhir_s
  
  let _menhir_run_311 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_064 () in
      _menhir_goto_opt_problems _menhir_stack _v _menhir_s
  
  let rec _menhir_run_279 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState280 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINIMIZE ->
              _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MAXIMIZE ->
              _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COLON ->
              let _menhir_stack = MenhirCell1_COLON (_menhir_stack, _menhir_s) in
              let _menhir_s = MenhirState289 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT_T _v ->
                  _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IDENT _v ->
                  _menhir_run_295 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | EOF ->
                  _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | EOF | IDENT _ ->
          let _1 = _v in
          let _v = _menhir_action_059 _1 in
          _menhir_goto_opt_pair _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_281 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _3 = _v in
                  let _v = _menhir_action_042 _3 in
                  _menhir_goto_direct _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_direct : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_direct (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState309 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINIMIZE ->
              _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MAXIMIZE ->
              _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | COLON | EOF | IDENT _ ->
          let _1 = _v in
          let _v = _menhir_action_043 _1 in
          _menhir_goto_directs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_285 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _3 = _v in
                  let _v = _menhir_action_041 _3 in
                  _menhir_goto_direct _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_directs : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState309 ->
          _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState280 ->
          _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_310 : type  ttv_stack. (ttv_stack, _menhir_box_opt_problems) _menhir_cell1_direct -> _ -> _ -> _ -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_direct (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_044 _1 _3 in
      _menhir_goto_directs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_305 : type  ttv_stack. ((ttv_stack, _menhir_box_opt_problems) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_opt_problems) _menhir_state -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_stack = MenhirCell1_directs (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState306 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT_T _v ->
              _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_295 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | EOF ->
              _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | IDENT _ ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_060 _1 _3 in
          _menhir_goto_opt_pair _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_290 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQUAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | INT _v_1 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_1, _3, _5) = (_v, _v_0, _v_1) in
                      let _v = _menhir_action_076 _1 _3 _5 in
                      _menhir_goto_space_constr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_space_constr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_space_constr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState303 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT_T _v ->
              _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_295 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | EOF ->
              _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | IDENT _ ->
          let _1 = _v in
          let _v = _menhir_action_077 _1 in
          _menhir_goto_space_constrs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_295 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQUAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | INT _v_1 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_1, _3, _5) = (_v, _v_0, _v_1) in
                      let _v = _menhir_action_075 _1 _3 _5 in
                      _menhir_goto_space_constr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_300 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_079 () in
      _menhir_goto_space_constrs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_space_constrs : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState306 ->
          _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState303 ->
          _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState289 ->
          _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_307 : type  ttv_stack. ((ttv_stack, _menhir_box_opt_problems) _menhir_cell1_IDENT, _menhir_box_opt_problems) _menhir_cell1_directs -> _ -> _ -> _ -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_directs (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_061 _1 _3 _5 in
      _menhir_goto_opt_pair _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_opt_pair : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_opt_problems) _menhir_state -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_opt_pair (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState313
      | EOF ->
          _menhir_run_311 _menhir_stack MenhirState313
      | _ ->
          _eRR ()
  
  and _menhir_run_304 : type  ttv_stack. (ttv_stack, _menhir_box_opt_problems) _menhir_cell1_space_constr -> _ -> _ -> _ -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_space_constr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_078 _1 _3 in
      _menhir_goto_space_constrs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_301 : type  ttv_stack. ((ttv_stack, _menhir_box_opt_problems) _menhir_cell1_IDENT, _menhir_box_opt_problems) _menhir_cell1_COLON -> _ -> _ -> _ -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_COLON (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_062 _1 _4 in
      _menhir_goto_opt_pair _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_278 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_opt_problems =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState278 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | EOF ->
          _menhir_run_311 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_315 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_val_ty_env =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState315 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLCOL ->
              let _menhir_s = MenhirState317 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRA ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | EOF ->
          _menhir_run_319 _menhir_stack _menhir_s
      | CONST _v ->
          _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | COLCOL ->
          _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let val_ty_env =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_val_ty_env v = _menhir_run_315 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let opt_problems =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_opt_problems v = _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let formula =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_formula v = _menhir_run_274 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let constraints =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_constraints v = _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let comp_ty =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_comp_ty v = _menhir_run_266 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let assertions =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_assertions v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
