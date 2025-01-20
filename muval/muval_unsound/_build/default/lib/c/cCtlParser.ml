
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | VOID
    | UNSIGNED
    | STRING of (
# 30 "lib/c/cCtlParser.mly"
       (string)
# 18 "lib/c/cCtlParser.ml"
  )
    | SHARPINCLUDE
    | SHARPDEFINE
    | SEMI
    | RPAREN
    | RETURN
    | RBLOCK
    | PREDSYM of (
# 28 "lib/c/cCtlParser.mly"
       (Ast.LogicOld.pred_sym)
# 29 "lib/c/cCtlParser.ml"
  )
    | PLUSPLUS
    | PHI
    | OR
    | NOT
    | NONDET
    | MOD
    | MINUSMINUS
    | MINUS
    | MAIN
    | LPAREN
    | LNONDET
    | LBLOCK
    | INTL of (
# 29 "lib/c/cCtlParser.mly"
       (int)
# 46 "lib/c/cCtlParser.ml"
  )
    | INT
    | INIT
    | IF
    | ID of (
# 30 "lib/c/cCtlParser.mly"
       (string)
# 54 "lib/c/cCtlParser.ml"
  )
    | EQUAL
    | EOF
    | ELSE
    | DOCHECK
    | DIV
    | CORON
    | COR
    | COMMA
    | CIMP
    | CEG
    | CEF
    | CAP
    | CAND
    | CAG
    | CAF
    | BREAK
    | BODY
    | ASTERISK
    | ASSUME
    | AND
    | ADD
  
end

include MenhirBasics

# 1 "lib/c/cCtlParser.mly"
  
  open Ast
  open Ast.LogicOld
  open CSyntax

  let rec stmt_of_statements = function
      [] -> Statement.mk_nop ()
    | stmt :: [] -> stmt
    | stmt :: tail -> Statement.mk_compound stmt (stmt_of_statements tail)

  let mk_fun_nondet funname params =
    FunDecl.mk_fun_nondet funname params
    (* FunDecl.mk_fun_int funname params (Statement.mk_return_nondet ()) *)

# 97 "lib/c/cCtlParser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_toplevel) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: toplevel. *)

  | MenhirState005 : (('s, _menhir_box_toplevel) _menhir_cell1_VOID, _menhir_box_toplevel) _menhir_state
    (** State 005.
        Stack shape : VOID.
        Start symbol: toplevel. *)

  | MenhirState007 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 007.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState012 : (('s, _menhir_box_toplevel) _menhir_cell1_MINUS, _menhir_box_toplevel) _menhir_state
    (** State 012.
        Stack shape : MINUS.
        Start symbol: toplevel. *)

  | MenhirState013 : (('s, _menhir_box_toplevel) _menhir_cell1_LPAREN, _menhir_box_toplevel) _menhir_state
    (** State 013.
        Stack shape : LPAREN.
        Start symbol: toplevel. *)

  | MenhirState018 : (('s, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod, _menhir_box_toplevel) _menhir_state
    (** State 018.
        Stack shape : T_intMultDivMod.
        Start symbol: toplevel. *)

  | MenhirState021 : (('s, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod, _menhir_box_toplevel) _menhir_state
    (** State 021.
        Stack shape : T_intMultDivMod.
        Start symbol: toplevel. *)

  | MenhirState023 : (('s, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod, _menhir_box_toplevel) _menhir_state
    (** State 023.
        Stack shape : T_intMultDivMod.
        Start symbol: toplevel. *)

  | MenhirState026 : (('s, _menhir_box_toplevel) _menhir_cell1_T_intAddSub, _menhir_box_toplevel) _menhir_state
    (** State 026.
        Stack shape : T_intAddSub.
        Start symbol: toplevel. *)

  | MenhirState028 : (('s, _menhir_box_toplevel) _menhir_cell1_T_intAddSub, _menhir_box_toplevel) _menhir_state
    (** State 028.
        Stack shape : T_intAddSub.
        Start symbol: toplevel. *)

  | MenhirState042 : (('s, _menhir_box_toplevel) _menhir_cell1_ASSUME, _menhir_box_toplevel) _menhir_state
    (** State 042.
        Stack shape : ASSUME.
        Start symbol: toplevel. *)

  | MenhirState043 : (('s, _menhir_box_toplevel) _menhir_cell1_NOT, _menhir_box_toplevel) _menhir_state
    (** State 043.
        Stack shape : NOT.
        Start symbol: toplevel. *)

  | MenhirState044 : (('s, _menhir_box_toplevel) _menhir_cell1_LPAREN, _menhir_box_toplevel) _menhir_state
    (** State 044.
        Stack shape : LPAREN.
        Start symbol: toplevel. *)

  | MenhirState046 : (('s, _menhir_box_toplevel) _menhir_cell1_T_int _menhir_cell0_PREDSYM, _menhir_box_toplevel) _menhir_state
    (** State 046.
        Stack shape : T_int PREDSYM.
        Start symbol: toplevel. *)

  | MenhirState050 : (('s, _menhir_box_toplevel) _menhir_cell1_FormulaOr, _menhir_box_toplevel) _menhir_state
    (** State 050.
        Stack shape : FormulaOr.
        Start symbol: toplevel. *)

  | MenhirState053 : (('s, _menhir_box_toplevel) _menhir_cell1_FormulaNeg, _menhir_box_toplevel) _menhir_state
    (** State 053.
        Stack shape : FormulaNeg.
        Start symbol: toplevel. *)

  | MenhirState064 : ((('s, _menhir_box_toplevel) _menhir_cell1_ASSUME, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_state
    (** State 064.
        Stack shape : ASSUME Formula.
        Start symbol: toplevel. *)

  | MenhirState065 : (('s, _menhir_box_toplevel) _menhir_cell1_MultipleNondetAssignInit, _menhir_box_toplevel) _menhir_state
    (** State 065.
        Stack shape : MultipleNondetAssignInit.
        Start symbol: toplevel. *)

  | MenhirState066 : (('s, _menhir_box_toplevel) _menhir_cell1_MultipleAssignInit, _menhir_box_toplevel) _menhir_state
    (** State 066.
        Stack shape : MultipleAssignInit.
        Start symbol: toplevel. *)

  | MenhirState073 : (('s, _menhir_box_toplevel) _menhir_cell1_VOID _menhir_cell0_ID, _menhir_box_toplevel) _menhir_state
    (** State 073.
        Stack shape : VOID ID.
        Start symbol: toplevel. *)

  | MenhirState081 : ((('s, _menhir_box_toplevel) _menhir_cell1_VOID _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_Parameters, _menhir_box_toplevel) _menhir_state
    (** State 081.
        Stack shape : VOID ID Parameters.
        Start symbol: toplevel. *)

  | MenhirState085 : (('s, _menhir_box_toplevel) _menhir_cell1_WHILE _menhir_cell0_INTL, _menhir_box_toplevel) _menhir_state
    (** State 085.
        Stack shape : WHILE INTL.
        Start symbol: toplevel. *)

  | MenhirState090 : (('s, _menhir_box_toplevel) _menhir_cell1_LBLOCK, _menhir_box_toplevel) _menhir_state
    (** State 090.
        Stack shape : LBLOCK.
        Start symbol: toplevel. *)

  | MenhirState094 : (('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_state
    (** State 094.
        Stack shape : IF.
        Start symbol: toplevel. *)

  | MenhirState096 : ((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET, _menhir_box_toplevel) _menhir_state
    (** State 096.
        Stack shape : IF LNONDET.
        Start symbol: toplevel. *)

  | MenhirState100 : (('s, _menhir_box_toplevel) _menhir_cell1_WHILE _menhir_cell0_INTL, _menhir_box_toplevel) _menhir_state
    (** State 100.
        Stack shape : WHILE INTL.
        Start symbol: toplevel. *)

  | MenhirState102 : (('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_state
    (** State 102.
        Stack shape : IF.
        Start symbol: toplevel. *)

  | MenhirState104 : ((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET, _menhir_box_toplevel) _menhir_state
    (** State 104.
        Stack shape : IF LNONDET.
        Start symbol: toplevel. *)

  | MenhirState110 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 110.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState112 : (('s, _menhir_box_toplevel) _menhir_cell1_Term, _menhir_box_toplevel) _menhir_state
    (** State 112.
        Stack shape : Term.
        Start symbol: toplevel. *)

  | MenhirState118 : (('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 118.
        Stack shape : ID.
        Start symbol: toplevel. *)

  | MenhirState126 : ((('s, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 126.
        Stack shape : ID ID.
        Start symbol: toplevel. *)

  | MenhirState140 : (('s, _menhir_box_toplevel) _menhir_cell1_ASSUME, _menhir_box_toplevel) _menhir_state
    (** State 140.
        Stack shape : ASSUME.
        Start symbol: toplevel. *)

  | MenhirState145 : (((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET, _menhir_box_toplevel) _menhir_cell1_StatementIfT, _menhir_box_toplevel) _menhir_state
    (** State 145.
        Stack shape : IF LNONDET StatementIfT.
        Start symbol: toplevel. *)

  | MenhirState151 : ((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_state
    (** State 151.
        Stack shape : IF Formula.
        Start symbol: toplevel. *)

  | MenhirState153 : (((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_cell1_StatementIfT, _menhir_box_toplevel) _menhir_state
    (** State 153.
        Stack shape : IF Formula StatementIfT.
        Start symbol: toplevel. *)

  | MenhirState160 : (((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET, _menhir_box_toplevel) _menhir_cell1_StatementIfT, _menhir_box_toplevel) _menhir_state
    (** State 160.
        Stack shape : IF LNONDET StatementIfT.
        Start symbol: toplevel. *)

  | MenhirState163 : ((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_state
    (** State 163.
        Stack shape : IF Formula.
        Start symbol: toplevel. *)

  | MenhirState165 : (((('s, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_cell1_StatementIfT, _menhir_box_toplevel) _menhir_state
    (** State 165.
        Stack shape : IF Formula StatementIfT.
        Start symbol: toplevel. *)

  | MenhirState168 : (('s, _menhir_box_toplevel) _menhir_cell1_Statement, _menhir_box_toplevel) _menhir_state
    (** State 168.
        Stack shape : Statement.
        Start symbol: toplevel. *)

  | MenhirState173 : (('s, _menhir_box_toplevel) _menhir_cell1_Parameter, _menhir_box_toplevel) _menhir_state
    (** State 173.
        Stack shape : Parameter.
        Start symbol: toplevel. *)

  | MenhirState178 : (('s, _menhir_box_toplevel) _menhir_cell1_VOID, _menhir_box_toplevel) _menhir_state
    (** State 178.
        Stack shape : VOID.
        Start symbol: toplevel. *)

  | MenhirState182 : (('s, _menhir_box_toplevel) _menhir_cell1_UNSIGNED, _menhir_box_toplevel) _menhir_state
    (** State 182.
        Stack shape : UNSIGNED.
        Start symbol: toplevel. *)

  | MenhirState188 : (('s, _menhir_box_toplevel) _menhir_cell1_Variable, _menhir_box_toplevel) _menhir_state
    (** State 188.
        Stack shape : Variable.
        Start symbol: toplevel. *)

  | MenhirState200 : (('s, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_state
    (** State 200.
        Stack shape : INT.
        Start symbol: toplevel. *)

  | MenhirState205 : ((('s, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_PHI, _menhir_box_toplevel) _menhir_state
    (** State 205.
        Stack shape : INT PHI.
        Start symbol: toplevel. *)

  | MenhirState207 : (('s, _menhir_box_toplevel) _menhir_cell1_COR, _menhir_box_toplevel) _menhir_state
    (** State 207.
        Stack shape : COR.
        Start symbol: toplevel. *)

  | MenhirState209 : (('s, _menhir_box_toplevel) _menhir_cell1_CIMP, _menhir_box_toplevel) _menhir_state
    (** State 209.
        Stack shape : CIMP.
        Start symbol: toplevel. *)

  | MenhirState211 : (('s, _menhir_box_toplevel) _menhir_cell1_CEG, _menhir_box_toplevel) _menhir_state
    (** State 211.
        Stack shape : CEG.
        Start symbol: toplevel. *)

  | MenhirState213 : (('s, _menhir_box_toplevel) _menhir_cell1_CEF, _menhir_box_toplevel) _menhir_state
    (** State 213.
        Stack shape : CEF.
        Start symbol: toplevel. *)

  | MenhirState215 : (('s, _menhir_box_toplevel) _menhir_cell1_CAP, _menhir_box_toplevel) _menhir_state
    (** State 215.
        Stack shape : CAP.
        Start symbol: toplevel. *)

  | MenhirState219 : (('s, _menhir_box_toplevel) _menhir_cell1_CAND, _menhir_box_toplevel) _menhir_state
    (** State 219.
        Stack shape : CAND.
        Start symbol: toplevel. *)

  | MenhirState221 : (('s, _menhir_box_toplevel) _menhir_cell1_CAG, _menhir_box_toplevel) _menhir_state
    (** State 221.
        Stack shape : CAG.
        Start symbol: toplevel. *)

  | MenhirState223 : (('s, _menhir_box_toplevel) _menhir_cell1_CAF, _menhir_box_toplevel) _menhir_state
    (** State 223.
        Stack shape : CAF.
        Start symbol: toplevel. *)

  | MenhirState229 : ((('s, _menhir_box_toplevel) _menhir_cell1_CAND, _menhir_box_toplevel) _menhir_cell1_Phi, _menhir_box_toplevel) _menhir_state
    (** State 229.
        Stack shape : CAND Phi.
        Start symbol: toplevel. *)

  | MenhirState237 : ((('s, _menhir_box_toplevel) _menhir_cell1_CIMP, _menhir_box_toplevel) _menhir_cell1_Phi, _menhir_box_toplevel) _menhir_state
    (** State 237.
        Stack shape : CIMP Phi.
        Start symbol: toplevel. *)

  | MenhirState241 : ((('s, _menhir_box_toplevel) _menhir_cell1_COR, _menhir_box_toplevel) _menhir_cell1_Phi, _menhir_box_toplevel) _menhir_state
    (** State 241.
        Stack shape : COR Phi.
        Start symbol: toplevel. *)

  | MenhirState255 : ((('s, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_INIT, _menhir_box_toplevel) _menhir_state
    (** State 255.
        Stack shape : INT INIT.
        Start symbol: toplevel. *)

  | MenhirState259 : ((('s, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_state
    (** State 259.
        Stack shape : INT ID.
        Start symbol: toplevel. *)

  | MenhirState282 : ((('s, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_BODY, _menhir_box_toplevel) _menhir_state
    (** State 282.
        Stack shape : INT BODY.
        Start symbol: toplevel. *)

  | MenhirState291 : (('s, _menhir_box_toplevel) _menhir_cell1_Decl, _menhir_box_toplevel) _menhir_state
    (** State 291.
        Stack shape : Decl.
        Start symbol: toplevel. *)


and ('s, 'r) _menhir_cell1_Decl = 
  | MenhirCell1_Decl of 's * ('s, 'r) _menhir_state * (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list)

and ('s, 'r) _menhir_cell1_Formula = 
  | MenhirCell1_Formula of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_FormulaNeg = 
  | MenhirCell1_FormulaNeg of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_FormulaOr = 
  | MenhirCell1_FormulaOr of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Formula.t)

and ('s, 'r) _menhir_cell1_MultipleAssignInit = 
  | MenhirCell1_MultipleAssignInit of 's * ('s, 'r) _menhir_state * (string list * Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_MultipleNondetAssignInit = 
  | MenhirCell1_MultipleNondetAssignInit of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_Parameter = 
  | MenhirCell1_Parameter of 's * ('s, 'r) _menhir_state * (string * Ast.LogicOld.Sort.t)

and ('s, 'r) _menhir_cell1_Parameters = 
  | MenhirCell1_Parameters of 's * ('s, 'r) _menhir_state * ((string * Ast.LogicOld.Sort.t) list)

and ('s, 'r) _menhir_cell1_Phi = 
  | MenhirCell1_Phi of 's * ('s, 'r) _menhir_state * (CSyntax.Ctl.t)

and ('s, 'r) _menhir_cell1_Statement = 
  | MenhirCell1_Statement of 's * ('s, 'r) _menhir_state * (CSyntax.Statement.t)

and ('s, 'r) _menhir_cell1_StatementIfT = 
  | MenhirCell1_StatementIfT of 's * ('s, 'r) _menhir_state * (CSyntax.Statement.t)

and ('s, 'r) _menhir_cell1_T_int = 
  | MenhirCell1_T_int of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_T_intAddSub = 
  | MenhirCell1_T_intAddSub of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_T_intMultDivMod = 
  | MenhirCell1_T_intMultDivMod of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_Term = 
  | MenhirCell1_Term of 's * ('s, 'r) _menhir_state * (Ast.LogicOld.Term.t)

and ('s, 'r) _menhir_cell1_Variable = 
  | MenhirCell1_Variable of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_ASSUME = 
  | MenhirCell1_ASSUME of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_BODY = 
  | MenhirCell1_BODY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CAF = 
  | MenhirCell1_CAF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CAG = 
  | MenhirCell1_CAG of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CAND = 
  | MenhirCell1_CAND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CAP = 
  | MenhirCell1_CAP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CEF = 
  | MenhirCell1_CEF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CEG = 
  | MenhirCell1_CEG of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CIMP = 
  | MenhirCell1_CIMP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_COR = 
  | MenhirCell1_COR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 30 "lib/c/cCtlParser.mly"
       (string)
# 490 "lib/c/cCtlParser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 30 "lib/c/cCtlParser.mly"
       (string)
# 497 "lib/c/cCtlParser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_INIT = 
  | MenhirCell1_INIT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_INT = 
  | MenhirCell1_INT of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_INTL = 
  | MenhirCell0_INTL of 's * (
# 29 "lib/c/cCtlParser.mly"
       (int)
# 513 "lib/c/cCtlParser.ml"
)

and ('s, 'r) _menhir_cell1_LBLOCK = 
  | MenhirCell1_LBLOCK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LNONDET = 
  | MenhirCell1_LNONDET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PHI = 
  | MenhirCell1_PHI of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_PREDSYM = 
  | MenhirCell0_PREDSYM of 's * (
# 28 "lib/c/cCtlParser.mly"
       (Ast.LogicOld.pred_sym)
# 538 "lib/c/cCtlParser.ml"
)

and ('s, 'r) _menhir_cell1_UNSIGNED = 
  | MenhirCell1_UNSIGNED of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VOID = 
  | MenhirCell1_VOID of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_toplevel = 
  | MenhirBox_toplevel of (CSyntax.cctl * CSyntax.Define.t list * CSyntax.FunDecl.t list) [@@unboxed]

let _menhir_action_001 =
  fun () ->
    (
# 137 "lib/c/cCtlParser.mly"
    ( [] )
# 558 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_002 =
  fun args ->
    (
# 138 "lib/c/cCtlParser.mly"
                             ( args )
# 566 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_003 =
  fun t ->
    (
# 141 "lib/c/cCtlParser.mly"
           ( [t] )
# 574 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_004 =
  fun args t ->
    (
# 142 "lib/c/cCtlParser.mly"
                                          ( t :: args )
# 582 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t list))

let _menhir_action_005 =
  fun atom ->
    (
# 275 "lib/c/cCtlParser.mly"
                ( atom )
# 590 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_006 =
  fun decls ->
    (
# 68 "lib/c/cCtlParser.mly"
                  ( None, decls, None, None, [], [] )
# 598 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_007 =
  fun phi ->
    (
# 70 "lib/c/cCtlParser.mly"
                                                            ( Some phi, [], None, None, [], [] )
# 608 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_008 =
  fun inits ->
    (
# 72 "lib/c/cCtlParser.mly"
                                                     ( None, [], Some inits, None, [], [] )
# 618 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_009 =
  fun inits ->
    (
# 73 "lib/c/cCtlParser.mly"
                                                    ( None, [], Some inits, None, [], [] )
# 628 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_010 =
  fun stmts ->
    (
# 74 "lib/c/cCtlParser.mly"
                                                           ( None, [], None, Some (stmt_of_statements stmts), [], [] )
# 638 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_011 =
  fun stmts ->
    (
# 75 "lib/c/cCtlParser.mly"
                                                          ( None, [], None, Some (stmt_of_statements stmts), [], [] )
# 648 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_012 =
  fun () ->
    (
# 77 "lib/c/cCtlParser.mly"
                                         ( None, [], None, None, [], [] )
# 658 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_013 =
  fun s ->
    (
# 79 "lib/c/cCtlParser.mly"
                          (
    if s = "../ctl.h" then
      None, [], None, None, [], []
    else
      raise (SyntaxError "#include is not implemented")
  )
# 673 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_014 =
  fun id value ->
    (
# 86 "lib/c/cCtlParser.mly"
                                 (
    None, [], None, None, [Define.mk_def id value], []
  )
# 685 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_015 =
  fun funname params ->
    (
# 90 "lib/c/cCtlParser.mly"
                                                                                                  (
    None, [], None, None, [], [mk_fun_nondet funname params]
  )
# 697 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_016 =
  fun funname params varname1 varname2 ->
    (
# 95 "lib/c/cCtlParser.mly"
                                                                                                                                     (
    assert (varname1 = varname2);
    None, [], None, None, [], [mk_fun_nondet funname params]
  )
# 710 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_017 =
  fun funname params stmts ->
    (
# 100 "lib/c/cCtlParser.mly"
                                                                                   (
    None, [], None, None, [], [FunDecl.mk_fun_void funname params (stmt_of_statements stmts)]
  )
# 722 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_018 =
  fun funname ->
    (
# 104 "lib/c/cCtlParser.mly"
                                                              (
    None, [], None, None, [], [mk_fun_nondet funname []]
  )
# 734 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_019 =
  fun () ->
    (
# 49 "lib/c/cCtlParser.mly"
    ( None, [], None, None, [], [] )
# 744 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_020 =
  fun d1 d2 ->
    (
# 50 "lib/c/cCtlParser.mly"
                     (
    match d1, d2 with
    | (Some _, _, _, _, _, _), (Some _, _, _, _, _, _) -> raise (SemanticError "function __phi is declared multiple times")
    | (_, _, Some _, _, _, _), (_, _, Some _, _, _, _) -> raise (SemanticError "function init is declared multiple times")
    | (_, _, _, Some _, _, _), (_, _, _, Some _, _, _) -> raise (SemanticError "function body is declared multiple times")
    | (phi1, decls1, init1, body1, defs1, fundecls1), (phi2, decls2, init2, body2, defs2, fundecls2) ->
      let merge a b = match a, b with Some x, _ | _, Some x -> Some x | _ -> None in
      let phi = merge phi1 phi2 in
      let decls = decls1 @ decls2 in
      let init = merge init1 init2 in
      let body = merge body1 body2 in
      let defs = defs1 @ defs2 in
      let fundecls = fundecls1 @ fundecls2 in
      phi, decls, init, body, defs, fundecls
  )
# 768 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t option * CSyntax.Declare.t list *
  CSyntax.Init.t list option * CSyntax.Statement.t option *
  CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_action_021 =
  fun fml ->
    (
# 254 "lib/c/cCtlParser.mly"
                   ( fml )
# 778 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_022 =
  fun left right ->
    (
# 257 "lib/c/cCtlParser.mly"
                                        ( Formula.mk_and left right )
# 786 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_023 =
  fun fml ->
    (
# 258 "lib/c/cCtlParser.mly"
                  ( fml )
# 794 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_024 =
  fun atom ->
    (
# 269 "lib/c/cCtlParser.mly"
              ( Formula.mk_atom atom )
# 802 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_025 =
  fun fml ->
    (
# 270 "lib/c/cCtlParser.mly"
                              ( fml )
# 810 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_026 =
  fun fml ->
    (
# 265 "lib/c/cCtlParser.mly"
                       ( Formula.mk_neg fml )
# 818 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_027 =
  fun fml ->
    (
# 266 "lib/c/cCtlParser.mly"
                    ( fml )
# 826 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_028 =
  fun left right ->
    (
# 261 "lib/c/cCtlParser.mly"
                                       ( Formula.mk_or left right )
# 834 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_029 =
  fun fml ->
    (
# 262 "lib/c/cCtlParser.mly"
                   ( fml )
# 842 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Formula.t))

let _menhir_action_030 =
  fun () ->
    (
# 161 "lib/c/cCtlParser.mly"
    ( [] )
# 850 "lib/c/cCtlParser.ml"
     : (CSyntax.Init.t list))

let _menhir_action_031 =
  fun data inits ->
    (
# 162 "lib/c/cCtlParser.mly"
                                       (
    let varnames, term = data in
    List.fold_left
      (fun inits varname -> Init.mk_assign varname term :: inits)
      inits
      varnames
  )
# 864 "lib/c/cCtlParser.ml"
     : (CSyntax.Init.t list))

let _menhir_action_032 =
  fun inits ->
    (
# 169 "lib/c/cCtlParser.mly"
                                        ( inits )
# 872 "lib/c/cCtlParser.ml"
     : (CSyntax.Init.t list))

let _menhir_action_033 =
  fun fml inits ->
    (
# 170 "lib/c/cCtlParser.mly"
                                                     ( Init.mk_assume fml :: inits )
# 880 "lib/c/cCtlParser.ml"
     : (CSyntax.Init.t list))

let _menhir_action_034 =
  fun term varname ->
    (
# 174 "lib/c/cCtlParser.mly"
                                    ( [varname], term )
# 888 "lib/c/cCtlParser.ml"
     : (string list * Ast.LogicOld.Term.t))

let _menhir_action_035 =
  fun tail varname ->
    (
# 175 "lib/c/cCtlParser.mly"
                                             (
    let varnames, term = tail in
    varname :: varnames, term
  )
# 899 "lib/c/cCtlParser.ml"
     : (string list * Ast.LogicOld.Term.t))

let _menhir_action_036 =
  fun () ->
    (
# 182 "lib/c/cCtlParser.mly"
                                       ()
# 907 "lib/c/cCtlParser.ml"
     : (unit))

let _menhir_action_037 =
  fun () ->
    (
# 183 "lib/c/cCtlParser.mly"
                          ()
# 915 "lib/c/cCtlParser.ml"
     : (unit))

let _menhir_action_038 =
  fun () ->
    (
# 184 "lib/c/cCtlParser.mly"
                                      ()
# 923 "lib/c/cCtlParser.ml"
     : (unit))

let _menhir_action_039 =
  fun sort varname ->
    (
# 133 "lib/c/cCtlParser.mly"
                         ( varname, sort )
# 931 "lib/c/cCtlParser.ml"
     : (string * Ast.LogicOld.Sort.t))

let _menhir_action_040 =
  fun () ->
    (
# 125 "lib/c/cCtlParser.mly"
    ( [] )
# 939 "lib/c/cCtlParser.ml"
     : ((string * Ast.LogicOld.Sort.t) list))

let _menhir_action_041 =
  fun params ->
    (
# 126 "lib/c/cCtlParser.mly"
                               ( params )
# 947 "lib/c/cCtlParser.ml"
     : ((string * Ast.LogicOld.Sort.t) list))

let _menhir_action_042 =
  fun param ->
    (
# 129 "lib/c/cCtlParser.mly"
                    ( [param] )
# 955 "lib/c/cCtlParser.ml"
     : ((string * Ast.LogicOld.Sort.t) list))

let _menhir_action_043 =
  fun param params ->
    (
# 130 "lib/c/cCtlParser.mly"
                                                     ( param :: params )
# 963 "lib/c/cCtlParser.ml"
     : ((string * Ast.LogicOld.Sort.t) list))

let _menhir_action_044 =
  fun phi ->
    (
# 150 "lib/c/cCtlParser.mly"
                              ( Ctl.mk_af phi )
# 971 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_045 =
  fun phi ->
    (
# 151 "lib/c/cCtlParser.mly"
                              ( Ctl.mk_ef phi )
# 979 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_046 =
  fun phi ->
    (
# 152 "lib/c/cCtlParser.mly"
                              ( Ctl.mk_ag phi )
# 987 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_047 =
  fun phi ->
    (
# 153 "lib/c/cCtlParser.mly"
                              ( Ctl.mk_eg phi )
# 995 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_048 =
  fun phi1 phi2 ->
    (
# 154 "lib/c/cCtlParser.mly"
                                               ( Ctl.mk_and phi1 phi2 )
# 1003 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_049 =
  fun phi1 phi2 ->
    (
# 155 "lib/c/cCtlParser.mly"
                                              ( Ctl.mk_or phi1 phi2 )
# 1011 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_050 =
  fun phi1 phi2 ->
    (
# 156 "lib/c/cCtlParser.mly"
                                               ( Ctl.mk_imp phi1 phi2 )
# 1019 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_051 =
  fun fml ->
    (
# 157 "lib/c/cCtlParser.mly"
                                  ( Ctl.mk_ap fml )
# 1027 "lib/c/cCtlParser.ml"
     : (CSyntax.Ctl.t))

let _menhir_action_052 =
  fun stmt ->
    (
# 192 "lib/c/cCtlParser.mly"
                          ( stmt )
# 1035 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_053 =
  fun cond_fml t_stmt ->
    (
# 193 "lib/c/cCtlParser.mly"
                                                       ( Statement.mk_if cond_fml t_stmt (Statement.mk_nop ()) )
# 1043 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_054 =
  fun stmt ->
    (
# 194 "lib/c/cCtlParser.mly"
                                            ( Statement.mk_nondet stmt (Statement.mk_nop ()) )
# 1051 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_055 =
  fun cond_fml f_stmt t_stmt ->
    (
# 195 "lib/c/cCtlParser.mly"
                                                                                ( Statement.mk_if cond_fml t_stmt f_stmt )
# 1059 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_056 =
  fun stmt1 stmt2 ->
    (
# 196 "lib/c/cCtlParser.mly"
                                                                     ( Statement.mk_nondet stmt1 stmt2 )
# 1067 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_057 =
  fun cond_n stmt ->
    (
# 197 "lib/c/cCtlParser.mly"
                                                   (
      if cond_n = 0 then
        Statement.mk_nop ()
      else
        Statement.mk_loop stmt
    )
# 1080 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_058 =
  fun term varname ->
    (
# 216 "lib/c/cCtlParser.mly"
                                    ( Statement.mk_assign varname term )
# 1088 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_059 =
  fun varname ->
    (
# 217 "lib/c/cCtlParser.mly"
                                               ( Statement.mk_nondet_assign varname )
# 1096 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_060 =
  fun varname ->
    (
# 218 "lib/c/cCtlParser.mly"
                                  ( Statement.mk_nondet_assign varname )
# 1104 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_061 =
  fun () ->
    (
# 219 "lib/c/cCtlParser.mly"
               ( Statement.mk_break () )
# 1112 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_062 =
  fun () ->
    (
# 220 "lib/c/cCtlParser.mly"
                     ( Statement.mk_exit () )
# 1120 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_063 =
  fun () ->
    (
# 221 "lib/c/cCtlParser.mly"
                ( Statement.mk_exit () )
# 1128 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_064 =
  fun stmts ->
    (
# 222 "lib/c/cCtlParser.mly"
                                   ( stmt_of_statements stmts )
# 1136 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_065 =
  fun () ->
    (
# 224 "lib/c/cCtlParser.mly"
             ( Statement.mk_nop () )
# 1144 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_066 =
  fun () ->
    (
# 225 "lib/c/cCtlParser.mly"
                               ( Statement.mk_assign "check" (T_int.mk_int Z.one) )
# 1152 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_067 =
  fun fml ->
    (
# 226 "lib/c/cCtlParser.mly"
                                          ( Statement.mk_assume fml )
# 1160 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_068 =
  fun varname ->
    (
# 228 "lib/c/cCtlParser.mly"
                             (
    let tvar = Ident.Tvar varname in
    Statement.mk_assign varname
      (T_int.mk_add
        (Term.mk_var tvar T_int.SInt)
        (T_int.mk_int Z.one))
  )
# 1174 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_069 =
  fun varname ->
    (
# 235 "lib/c/cCtlParser.mly"
                               (
    let tvar = Ident.Tvar varname in
    Statement.mk_assign varname
      (T_int.mk_sub
        (Term.mk_var tvar T_int.SInt)
        (T_int.mk_int Z.one))
  )
# 1188 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_070 =
  fun args funname ->
    (
# 242 "lib/c/cCtlParser.mly"
                                                  (
    Statement.mk_call_voidfun funname args
  )
# 1198 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_071 =
  fun args funname varname ->
    (
# 245 "lib/c/cCtlParser.mly"
                                                                   (
    Statement.mk_call_assign varname funname args
  )
# 1208 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_072 =
  fun () ->
    (
# 249 "lib/c/cCtlParser.mly"
              ( Statement.mk_nop () )
# 1216 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_073 =
  fun stmt ->
    (
# 205 "lib/c/cCtlParser.mly"
                          ( stmt )
# 1224 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_074 =
  fun cond_fml f_stmt t_stmt ->
    (
# 206 "lib/c/cCtlParser.mly"
                                                                                   ( Statement.mk_if cond_fml t_stmt f_stmt )
# 1232 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_075 =
  fun stmt1 stmt2 ->
    (
# 207 "lib/c/cCtlParser.mly"
                                                                        ( Statement.mk_nondet stmt1 stmt2 )
# 1240 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_076 =
  fun cond_n stmt ->
    (
# 208 "lib/c/cCtlParser.mly"
                                                      (
      if cond_n = 0 then
        Statement.mk_nop ()
      else
        Statement.mk_loop stmt
    )
# 1253 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t))

let _menhir_action_077 =
  fun () ->
    (
# 188 "lib/c/cCtlParser.mly"
    ( [] )
# 1261 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t list))

let _menhir_action_078 =
  fun stmt stmts ->
    (
# 189 "lib/c/cCtlParser.mly"
                                    ( stmt :: stmts )
# 1269 "lib/c/cCtlParser.ml"
     : (CSyntax.Statement.t list))

let _menhir_action_079 =
  fun op t1 t2 ->
    (
# 308 "lib/c/cCtlParser.mly"
                                 ( Atom.mk_app (Predicate.mk_psym op) [t1; t2] )
# 1277 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Atom.t))

let _menhir_action_080 =
  fun t ->
    (
# 284 "lib/c/cCtlParser.mly"
                  ( t )
# 1285 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_081 =
  fun t ->
    (
# 287 "lib/c/cCtlParser.mly"
                      ( t )
# 1293 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_082 =
  fun t1 t2 ->
    (
# 288 "lib/c/cCtlParser.mly"
                                          ( T_int.mk_add t1 t2 )
# 1301 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_083 =
  fun t1 t2 ->
    (
# 289 "lib/c/cCtlParser.mly"
                                            ( T_int.mk_sub t1 t2 )
# 1309 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_084 =
  fun t ->
    (
# 302 "lib/c/cCtlParser.mly"
                          ( t )
# 1317 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_085 =
  fun n ->
    (
# 303 "lib/c/cCtlParser.mly"
           ( T_int.from_int n )
# 1325 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_086 =
  fun varname ->
    (
# 304 "lib/c/cCtlParser.mly"
               ( Term.mk_var (Ident.Tvar varname) T_int.SInt )
# 1333 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_087 =
  fun t ->
    (
# 292 "lib/c/cCtlParser.mly"
               ( t )
# 1341 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_088 =
  fun t1 t2 ->
    (
# 293 "lib/c/cCtlParser.mly"
                                            ( T_int.mk_mult t1 t2 )
# 1349 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_089 =
  fun t1 t2 ->
    (
# 294 "lib/c/cCtlParser.mly"
                                       ( T_int.mk_div t1 t2 )
# 1357 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_090 =
  fun t1 t2 ->
    (
# 295 "lib/c/cCtlParser.mly"
                                       ( T_int.mk_mod t1 t2 )
# 1365 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_091 =
  fun t ->
    (
# 298 "lib/c/cCtlParser.mly"
                ( t )
# 1373 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_092 =
  fun t ->
    (
# 299 "lib/c/cCtlParser.mly"
                     ( T_int.mk_neg t )
# 1381 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_093 =
  fun t ->
    (
# 281 "lib/c/cCtlParser.mly"
            ( t )
# 1389 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Term.t))

let _menhir_action_094 =
  fun () ->
    (
# 145 "lib/c/cCtlParser.mly"
        ( T_int.SInt )
# 1397 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Sort.t))

let _menhir_action_095 =
  fun () ->
    (
# 146 "lib/c/cCtlParser.mly"
                 ( T_int.SRefInt )
# 1405 "lib/c/cCtlParser.ml"
     : (Ast.LogicOld.Sort.t))

let _menhir_action_096 =
  fun varnames ->
    (
# 110 "lib/c/cCtlParser.mly"
                                                                       (
      List.map (fun varname -> Declare.mk_int varname) varnames
    )
# 1415 "lib/c/cCtlParser.ml"
     : (CSyntax.Declare.t list))

let _menhir_action_097 =
  fun varnames ->
    (
# 110 "lib/c/cCtlParser.mly"
                                                                       (
      List.map (fun varname -> Declare.mk_int varname) varnames
    )
# 1425 "lib/c/cCtlParser.ml"
     : (CSyntax.Declare.t list))

let _menhir_action_098 =
  fun varname ->
    (
# 120 "lib/c/cCtlParser.mly"
               ( [varname] )
# 1433 "lib/c/cCtlParser.ml"
     : (string list))

let _menhir_action_099 =
  fun () ->
    (
# 121 "lib/c/cCtlParser.mly"
            ( [] )
# 1441 "lib/c/cCtlParser.ml"
     : (string list))

let _menhir_action_100 =
  fun varnames ->
    (
# 116 "lib/c/cCtlParser.mly"
                      ( varnames )
# 1449 "lib/c/cCtlParser.ml"
     : (string list))

let _menhir_action_101 =
  fun varnames varnames1 ->
    (
# 117 "lib/c/cCtlParser.mly"
                                                ( varnames1 @ varnames )
# 1457 "lib/c/cCtlParser.ml"
     : (string list))

let _menhir_action_102 =
  fun d ->
    (
# 38 "lib/c/cCtlParser.mly"
                (
      match d with
        None, _, _, _, _, _ -> raise (SemanticError "function __phi is not declared")
        | _, _, None, _, _, _ -> raise (SemanticError "function init is not declared")
        | _, _, _, None, _, _ -> raise (SemanticError "function body is not declared")
        | Some phi, decls, Some init, Some body, defs, fundecls ->
          (phi, decls, init, body), defs, fundecls
    )
# 1472 "lib/c/cCtlParser.ml"
     : (CSyntax.cctl * CSyntax.Define.t list * CSyntax.FunDecl.t list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADD ->
        "ADD"
    | AND ->
        "AND"
    | ASSUME ->
        "ASSUME"
    | ASTERISK ->
        "ASTERISK"
    | BODY ->
        "BODY"
    | BREAK ->
        "BREAK"
    | CAF ->
        "CAF"
    | CAG ->
        "CAG"
    | CAND ->
        "CAND"
    | CAP ->
        "CAP"
    | CEF ->
        "CEF"
    | CEG ->
        "CEG"
    | CIMP ->
        "CIMP"
    | COMMA ->
        "COMMA"
    | COR ->
        "COR"
    | CORON ->
        "CORON"
    | DIV ->
        "DIV"
    | DOCHECK ->
        "DOCHECK"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | INIT ->
        "INIT"
    | INT ->
        "INT"
    | INTL _ ->
        "INTL"
    | LBLOCK ->
        "LBLOCK"
    | LNONDET ->
        "LNONDET"
    | LPAREN ->
        "LPAREN"
    | MAIN ->
        "MAIN"
    | MINUS ->
        "MINUS"
    | MINUSMINUS ->
        "MINUSMINUS"
    | MOD ->
        "MOD"
    | NONDET ->
        "NONDET"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PHI ->
        "PHI"
    | PLUSPLUS ->
        "PLUSPLUS"
    | PREDSYM _ ->
        "PREDSYM"
    | RBLOCK ->
        "RBLOCK"
    | RETURN ->
        "RETURN"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | SHARPDEFINE ->
        "SHARPDEFINE"
    | SHARPINCLUDE ->
        "SHARPINCLUDE"
    | STRING _ ->
        "STRING"
    | UNSIGNED ->
        "UNSIGNED"
    | VOID ->
        "VOID"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_289 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _v ->
      let d = _v in
      let _v = _menhir_action_102 d in
      MenhirBox_toplevel _v
  
  let rec _menhir_run_292 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Decl -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _v ->
      let MenhirCell1_Decl (_menhir_stack, _menhir_s, d1) = _menhir_stack in
      let d2 = _v in
      let _v = _menhir_action_020 d1 d2 in
      _menhir_goto_Decls _menhir_stack _v _menhir_s
  
  and _menhir_goto_Decls : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState291 ->
          _menhir_run_292 _menhir_stack _v
      | MenhirState000 ->
          _menhir_run_289 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VOID (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INIT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBLOCK ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | ID _v ->
                          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState005
                      | ASSUME ->
                          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
                      | RBLOCK ->
                          let _v = _menhir_action_030 () in
                          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT ->
                  _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
              | RPAREN ->
                  let _v_0 = _menhir_action_040 () in
                  _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState073
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | BODY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBLOCK ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | WHILE ->
                          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | RETURN ->
                          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | LBLOCK ->
                          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | INTL _ ->
                          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | IF ->
                          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | ID _v ->
                          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState178
                      | DOCHECK ->
                          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | BREAK ->
                          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | ASSUME ->
                          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState178
                      | RBLOCK ->
                          let _v = _menhir_action_077 () in
                          _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _v
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
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NONDET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SEMI ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let MenhirCell1_ID (_menhir_stack, _menhir_s, _) = _menhir_stack in
                      let _v = _menhir_action_036 () in
                      _menhir_goto_MultipleNondetAssignInit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
      | LNONDET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_ID (_menhir_stack, _menhir_s, _) = _menhir_stack in
              let _v = _menhir_action_037 () in
              _menhir_goto_MultipleNondetAssignInit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState007
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, MenhirState007, _v) in
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
          | ADD | ASTERISK | DIV | MINUS | MOD | SEMI ->
              let (_menhir_s, varname) = (MenhirState007, _v) in
              let _v = _menhir_action_086 varname in
              _menhir_goto_T_intAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_MultipleNondetAssignInit : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState255 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_065 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_MultipleNondetAssignInit (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState065
      | ASSUME ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState065
      | RBLOCK ->
          let _v_1 = _menhir_action_030 () in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ASSUME (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState042 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState043 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState012 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState013 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_085 n in
      _menhir_goto_T_intAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_T_intAtom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_091 t in
      _menhir_goto_T_intNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_T_intNeg : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState012 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState023 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState215 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState028 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_032 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_092 t in
      _menhir_goto_T_intNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_024 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_088 t1 t2 in
      _menhir_goto_T_intMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_T_intMultDivMod : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState028 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState215 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_029 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intAddSub as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASTERISK ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COMMA | MINUS | OR | PREDSYM _ | RPAREN | SEMI ->
          let MenhirCell1_T_intAddSub (_menhir_stack, _menhir_s, t1) = _menhir_stack in
          let t2 = _v in
          let _v = _menhir_action_082 t1 t2 in
          _menhir_goto_T_intAddSub _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState018 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let varname = _v in
      let _v = _menhir_action_086 varname in
      _menhir_goto_T_intAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_021 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState021 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState023 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_T_intAddSub : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          let _menhir_stack = MenhirCell1_T_intAddSub (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState026 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ADD ->
          let _menhir_stack = MenhirCell1_T_intAddSub (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState028 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | COMMA | OR | PREDSYM _ | RPAREN | SEMI ->
          let t = _v in
          let _v = _menhir_action_080 t in
          _menhir_goto_T_int _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_T_int : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState215 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_int (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PREDSYM _v_0 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_int -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _menhir_stack = MenhirCell0_PREDSYM (_menhir_stack, _v) in
      let _menhir_s = MenhirState046 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_int _menhir_cell0_PREDSYM -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_PREDSYM (_menhir_stack, op) = _menhir_stack in
      let MenhirCell1_T_int (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_079 op t1 t2 in
      let atom = _v in
      let _v = _menhir_action_005 atom in
      let atom = _v in
      let _v = _menhir_action_024 atom in
      _menhir_goto_FormulaAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_FormulaAtom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let fml = _v in
      let _v = _menhir_action_027 fml in
      _menhir_goto_FormulaNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_FormulaNeg : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState043 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState215 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let fml = _v in
      let _v = _menhir_action_026 fml in
      _menhir_goto_FormulaNeg _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_FormulaNeg (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState053 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | RPAREN ->
          let fml = _v in
          let _v = _menhir_action_029 fml in
          _menhir_goto_FormulaOr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState044 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _v ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_FormulaOr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState215 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_054 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_FormulaNeg -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FormulaNeg (_menhir_stack, _menhir_s, left) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_028 left right in
      _menhir_goto_FormulaOr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_FormulaOr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState050 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let fml = _v in
          let _v = _menhir_action_023 fml in
          _menhir_goto_FormulaAnd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_FormulaAnd : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState215 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState094 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState102 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState140 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState042 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState044 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState050 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_058 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let fml = _v in
      let _v = _menhir_action_021 fml in
      _menhir_goto_Formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_Formula : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState215 ->
          _menhir_run_216 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState094 ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState102 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState140 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState042 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState044 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_216 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CAP -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_CAP (_menhir_stack, _menhir_s) = _menhir_stack in
      let fml = _v in
      let _v = _menhir_action_051 fml in
      _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Phi : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState205 ->
          _menhir_run_244 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState241 ->
          _menhir_run_242 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState207 ->
          _menhir_run_240 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState237 ->
          _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState209 ->
          _menhir_run_236 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState211 ->
          _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState213 ->
          _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState229 ->
          _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState219 ->
          _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState221 ->
          _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState223 ->
          _menhir_run_224 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_244 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_PHI -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RBLOCK ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_PHI (_menhir_stack, _) = _menhir_stack in
              let MenhirCell1_INT (_menhir_stack, _menhir_s) = _menhir_stack in
              let phi = _v in
              let _v = _menhir_action_007 phi in
              _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_Decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState291
      | UNSIGNED ->
          _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState291
      | SHARPINCLUDE ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState291
      | SHARPDEFINE ->
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState291
      | INT ->
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState291
      | EOF ->
          let _v_0 = _menhir_action_019 () in
          _menhir_run_292 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_181 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UNSIGNED (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT ->
          let _menhir_s = MenhirState182 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LNONDET ->
              _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_183 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_099 () in
      _menhir_goto_Variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Variable : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_Variable (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState188 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LNONDET ->
              _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SEMI ->
          let varnames = _v in
          let _v = _menhir_action_100 varnames in
          _menhir_goto_Variables _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_184 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let varname = _v in
      let _v = _menhir_action_098 varname in
      _menhir_goto_Variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Variables : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState200 ->
          _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState188 ->
          _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState182 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_285 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_INT -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_INT (_menhir_stack, _menhir_s) = _menhir_stack in
      let varnames = _v in
      let _v = _menhir_action_097 varnames in
      _menhir_goto_VarDecl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_VarDecl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let decls = _v in
      let _v = _menhir_action_006 decls in
      _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_189 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Variable -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Variable (_menhir_stack, _menhir_s, varnames1) = _menhir_stack in
      let varnames = _v in
      let _v = _menhir_action_101 varnames varnames1 in
      _menhir_goto_Variables _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_185 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_UNSIGNED -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UNSIGNED (_menhir_stack, _menhir_s) = _menhir_stack in
      let varnames = _v in
      let _v = _menhir_action_096 varnames in
      _menhir_goto_VarDecl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_190 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_013 s in
          _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_192 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | NONDET ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | RPAREN ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let funname = _v in
                              let _v = _menhir_action_018 funname in
                              _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | INTL _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (value, id) = (_v_0, _v) in
              let _v = _menhir_action_014 id value in
              _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_200 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PHI ->
          let _menhir_stack = MenhirCell1_INT (_menhir_stack, _menhir_s) in
          let _menhir_stack = MenhirCell1_PHI (_menhir_stack, MenhirState200) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBLOCK ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | RETURN ->
                          let _menhir_s = MenhirState205 in
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | COR ->
                              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CIMP ->
                              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CEG ->
                              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CEF ->
                              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CAP ->
                              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CAND ->
                              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CAG ->
                              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | CAF ->
                              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | MAIN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBLOCK ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | RBLOCK ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _v = _menhir_action_012 () in
                          _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | LNONDET ->
          let _menhir_stack = MenhirCell1_INT (_menhir_stack, _menhir_s) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState200
      | INIT ->
          let _menhir_stack = MenhirCell1_INT (_menhir_stack, _menhir_s) in
          let _menhir_stack = MenhirCell1_INIT (_menhir_stack, MenhirState200) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBLOCK ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | ID _v ->
                          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState255
                      | ASSUME ->
                          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
                      | RBLOCK ->
                          let _v = _menhir_action_030 () in
                          _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | ID _v ->
          let _menhir_stack = MenhirCell1_INT (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, MenhirState200, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT ->
                  _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState259
              | RPAREN ->
                  let _v_0 = _menhir_action_040 () in
                  _menhir_run_260 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
              | _ ->
                  _eRR ())
          | COMMA | SEMI ->
              let (_menhir_s, varname) = (MenhirState200, _v) in
              let _v = _menhir_action_098 varname in
              _menhir_goto_Variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | BODY ->
          let _menhir_stack = MenhirCell1_INT (_menhir_stack, _menhir_s) in
          let _menhir_stack = MenhirCell1_BODY (_menhir_stack, MenhirState200) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LBLOCK ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | WHILE ->
                          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | RETURN ->
                          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | LBLOCK ->
                          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | INTL _ ->
                          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | IF ->
                          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | ID _v ->
                          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState282
                      | DOCHECK ->
                          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | BREAK ->
                          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | ASSUME ->
                          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState282
                      | RBLOCK ->
                          let _v = _menhir_action_077 () in
                          _menhir_run_283 _menhir_stack _menhir_lexbuf _menhir_lexer _v
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
  
  and _menhir_run_206 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState207 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_208 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CIMP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState209 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_210 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CEG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState211 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_212 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CEF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState213 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_214 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CAP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState215 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_218 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CAND (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState219 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_220 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CAG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState221 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_222 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CAF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState223 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_256 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_INIT -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_INIT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_INT (_menhir_stack, _menhir_s) = _menhir_stack in
      let inits = _v in
      let _v = _menhir_action_009 inits in
      _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASTERISK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_095 () in
          _menhir_goto_Type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _ ->
          let _v = _menhir_action_094 () in
          _menhir_goto_Type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_Type : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (varname, sort) = (_v_0, _v) in
          let _v = _menhir_action_039 sort varname in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_stack = MenhirCell1_Parameter (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState173 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INT ->
                  _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | RPAREN ->
              let param = _v in
              let _v = _menhir_action_042 param in
              _menhir_goto_ParametersOneOrMore _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_ParametersOneOrMore : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState173 ->
          _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState259 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState073 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_174 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Parameter -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Parameter (_menhir_stack, _menhir_s, param) = _menhir_stack in
      let params = _v in
      let _v = _menhir_action_043 param params in
      _menhir_goto_ParametersOneOrMore _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_078 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let params = _v in
      let _v = _menhir_action_041 params in
      _menhir_goto_Parameters _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_Parameters : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState259 ->
          _menhir_run_260 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState073 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_260 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBLOCK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RETURN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NONDET ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | LPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | RPAREN ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | SEMI ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | RBLOCK ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  let MenhirCell1_ID (_menhir_stack, _, funname) = _menhir_stack in
                                  let MenhirCell1_INT (_menhir_stack, _menhir_s) = _menhir_stack in
                                  let params = _v in
                                  let _v = _menhir_action_015 funname params in
                                  _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | ID _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQUAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | NONDET ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | LPAREN ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | RPAREN ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | SEMI ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | RETURN ->
                                      let _tok = _menhir_lexer _menhir_lexbuf in
                                      (match (_tok : MenhirBasics.token) with
                                      | ID _v_1 ->
                                          let _tok = _menhir_lexer _menhir_lexbuf in
                                          (match (_tok : MenhirBasics.token) with
                                          | SEMI ->
                                              let _tok = _menhir_lexer _menhir_lexbuf in
                                              (match (_tok : MenhirBasics.token) with
                                              | RBLOCK ->
                                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                                  let MenhirCell1_ID (_menhir_stack, _, funname) = _menhir_stack in
                                                  let MenhirCell1_INT (_menhir_stack, _menhir_s) = _menhir_stack in
                                                  let (params, varname2, varname1) = (_v, _v_1, _v_0) in
                                                  let _v = _menhir_action_016 funname params varname1 varname2 in
                                                  _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                                              | _ ->
                                                  _eRR ())
                                          | _ ->
                                              _eRR ())
                                      | _ ->
                                          _eRR ())
                                  | _ ->
                                      _eRR ())
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
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
  
  and _menhir_run_079 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_VOID _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_Parameters (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBLOCK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | RETURN ->
              _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | LBLOCK ->
              _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | INTL _ ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | IF ->
              _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | ID _v_1 ->
              _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState081
          | DOCHECK ->
              _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | BREAK ->
              _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | ASSUME ->
              _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | RBLOCK ->
              let _v_2 = _menhir_action_077 () in
              _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTL _v ->
              let _menhir_stack = MenhirCell0_INTL (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _menhir_s = MenhirState085 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WHILE ->
                      _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RETURN ->
                      _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBLOCK ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INTL _ ->
                      _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IF ->
                      _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ID _v ->
                      _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | DOCHECK ->
                      _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BREAK ->
                      _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ASSUME ->
                      _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_063 () in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | INTL _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_062 () in
              _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_StatementGeneral : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState282 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState178 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState165 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState163 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState100 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState151 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState153 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState104 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState145 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_161 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let stmt = _v in
      let _v = _menhir_action_052 stmt in
      _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Statement : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState282 ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState178 ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState163 ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState151 ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState165 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState153 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState096 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState104 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState160 ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState145 ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_168 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Statement (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | IF ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | ID _v_1 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState168
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
      | RBLOCK ->
          let _v_2 = _menhir_action_077 () in
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBLOCK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | IF ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState090
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState090
      | RBLOCK ->
          let _v = _menhir_action_077 () in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_072 () in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState094 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LNONDET ->
              let _menhir_stack = MenhirCell1_LNONDET (_menhir_stack, _menhir_s) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _menhir_s = MenhirState096 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WHILE ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RETURN ->
                      _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBLOCK ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INTL _ ->
                      _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IF ->
                      _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ID _v ->
                      _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | DOCHECK ->
                      _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BREAK ->
                      _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ASSUME ->
                      _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTL _v ->
              let _menhir_stack = MenhirCell0_INTL (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _menhir_s = MenhirState100 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WHILE ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RETURN ->
                      _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBLOCK ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INTL _ ->
                      _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IF ->
                      _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ID _v ->
                      _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | DOCHECK ->
                      _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BREAK ->
                      _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ASSUME ->
                      _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState102 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LNONDET ->
              let _menhir_stack = MenhirCell1_LNONDET (_menhir_stack, _menhir_s) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  let _menhir_s = MenhirState104 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | WHILE ->
                      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | RETURN ->
                      _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | LBLOCK ->
                      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | INTL _ ->
                      _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | IF ->
                      _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ID _v ->
                      _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | DOCHECK ->
                      _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | BREAK ->
                      _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ASSUME ->
                      _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PLUSPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let varname = _v in
              let _v = _menhir_action_068 varname in
              _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | MINUSMINUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let varname = _v in
              let _v = _menhir_action_069 varname in
              _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | LPAREN ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
          | INTL _v_0 ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState110
          | ID _v_1 ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState110
          | RPAREN ->
              let _v_2 = _menhir_action_001 () in
              _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
          | _ ->
              _eRR ())
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NONDET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RPAREN ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | SEMI ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let varname = _v in
                          let _v = _menhir_action_059 varname in
                          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | MINUS ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | LPAREN ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
          | LNONDET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SEMI ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let varname = _v in
                  let _v = _menhir_action_060 varname in
                  _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | INTL _v_3 ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState118
          | ID _v_4 ->
              let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAREN ->
                  let _menhir_stack = MenhirCell1_ID (_menhir_stack, MenhirState118, _v_4) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | MINUS ->
                      _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
                  | LPAREN ->
                      _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState126
                  | INTL _v_5 ->
                      _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState126
                  | ID _v_6 ->
                      _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState126
                  | RPAREN ->
                      let _v_7 = _menhir_action_001 () in
                      _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7
                  | _ ->
                      _eRR ())
              | ADD | ASTERISK | DIV | MINUS | MOD | SEMI ->
                  let (_menhir_s, varname) = (MenhirState118, _v_4) in
                  let _v = _menhir_action_086 varname in
                  _menhir_goto_T_intAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | CORON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_065 () in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, funname) = _menhir_stack in
          let args = _v in
          let _v = _menhir_action_070 args funname in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_127 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _, funname) = _menhir_stack in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, varname) = _menhir_stack in
          let args = _v in
          let _v = _menhir_action_071 args funname varname in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_133 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SEMI ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_066 () in
                  _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_137 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_061 () in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_139 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ASSUME (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_s = MenhirState140 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_166 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LBLOCK -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LBLOCK (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmts = _v in
      let _v = _menhir_action_064 stmts in
      _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_169 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Statement -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Statement (_menhir_stack, _menhir_s, stmt) = _menhir_stack in
      let stmts = _v in
      let _v = _menhir_action_078 stmt stmts in
      _menhir_goto_Statements _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_Statements : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState282 ->
          _menhir_run_283 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState178 ->
          _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState081 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState168 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState090 ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_283 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_INT, _menhir_box_toplevel) _menhir_cell1_BODY -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_BODY (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_INT (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmts = _v in
      let _v = _menhir_action_011 stmts in
      _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_179 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_VOID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_VOID (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmts = _v in
      let _v = _menhir_action_010 stmts in
      _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_170 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_VOID _menhir_cell0_ID, _menhir_box_toplevel) _menhir_cell1_Parameters -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_Parameters (_menhir_stack, _, params) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, funname) = _menhir_stack in
      let MenhirCell1_VOID (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmts = _v in
      let _v = _menhir_action_017 funname params stmts in
      _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_158 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_WHILE _menhir_cell0_INTL -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_INTL (_menhir_stack, cond_n) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmt = _v in
      let _v = _menhir_action_057 cond_n stmt in
      _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_156 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_Formula (_menhir_stack, _, cond_fml) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let t_stmt = _v in
      let _v = _menhir_action_053 cond_fml t_stmt in
      _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_155 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_cell1_StatementIfT -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_StatementIfT (_menhir_stack, _, t_stmt) = _menhir_stack in
      let MenhirCell1_Formula (_menhir_stack, _, cond_fml) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let f_stmt = _v in
      let _v = _menhir_action_055 cond_fml f_stmt t_stmt in
      _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_149 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LNONDET (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmt = _v in
      let _v = _menhir_action_054 stmt in
      _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_148 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET, _menhir_box_toplevel) _menhir_cell1_StatementIfT -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_StatementIfT (_menhir_stack, _, stmt1) = _menhir_stack in
      let MenhirCell1_LNONDET (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmt2 = _v in
      let _v = _menhir_action_056 stmt1 stmt2 in
      _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_147 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ASSUME | BREAK | DOCHECK | ID _ | IF | INTL _ | LBLOCK | RBLOCK | RETURN | WHILE ->
          let stmt = _v in
          let _v = _menhir_action_052 stmt in
          _menhir_goto_Statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ELSE ->
          let stmt = _v in
          let _v = _menhir_action_073 stmt in
          _menhir_goto_StatementIfT _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_StatementIfT : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState163 ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState096 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState100 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState153 ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState151 ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState145 ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState104 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_164 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_StatementIfT (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState165 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_159 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_StatementIfT (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState160 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_157 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_WHILE _menhir_cell0_INTL -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_INTL (_menhir_stack, cond_n) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmt = _v in
      let _v = _menhir_action_076 cond_n stmt in
      _menhir_goto_StatementIfT _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_154 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula, _menhir_box_toplevel) _menhir_cell1_StatementIfT -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_StatementIfT (_menhir_stack, _, t_stmt) = _menhir_stack in
      let MenhirCell1_Formula (_menhir_stack, _, cond_fml) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let f_stmt = _v in
      let _v = _menhir_action_074 cond_fml f_stmt t_stmt in
      _menhir_goto_StatementIfT _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_152 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_Formula as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_StatementIfT (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState153 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_146 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET, _menhir_box_toplevel) _menhir_cell1_StatementIfT -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_StatementIfT (_menhir_stack, _, stmt1) = _menhir_stack in
      let MenhirCell1_LNONDET (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let stmt2 = _v in
      let _v = _menhir_action_075 stmt1 stmt2 in
      _menhir_goto_StatementIfT _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_144 : type  ttv_stack. (((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF, _menhir_box_toplevel) _menhir_cell1_LNONDET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_StatementIfT (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState145 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_242 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_COR, _menhir_box_toplevel) _menhir_cell1_Phi -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Phi (_menhir_stack, _, phi1) = _menhir_stack in
          let MenhirCell1_COR (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi2 = _v in
          let _v = _menhir_action_049 phi1 phi2 in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_240 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_COR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Phi (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_s = MenhirState241 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_238 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_CIMP, _menhir_box_toplevel) _menhir_cell1_Phi -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Phi (_menhir_stack, _, phi1) = _menhir_stack in
          let MenhirCell1_CIMP (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi2 = _v in
          let _v = _menhir_action_050 phi1 phi2 in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_236 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_CIMP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Phi (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_s = MenhirState237 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_234 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CEG -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CEG (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi = _v in
          let _v = _menhir_action_047 phi in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_232 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CEF -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CEF (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi = _v in
          let _v = _menhir_action_045 phi in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_230 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_CAND, _menhir_box_toplevel) _menhir_cell1_Phi -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_Phi (_menhir_stack, _, phi1) = _menhir_stack in
          let MenhirCell1_CAND (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi2 = _v in
          let _v = _menhir_action_048 phi1 phi2 in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_228 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_CAND as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_Phi (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_s = MenhirState229 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COR ->
              _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CIMP ->
              _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEG ->
              _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CEF ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAP ->
              _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAND ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAG ->
              _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CAF ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_226 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CAG -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CAG (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi = _v in
          let _v = _menhir_action_046 phi in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_224 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_CAF -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CAF (_menhir_stack, _menhir_s) = _menhir_stack in
          let phi = _v in
          let _v = _menhir_action_044 phi in
          _menhir_goto_Phi _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_162 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_Formula (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState163 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_150 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_Formula (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState151 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBLOCK ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTL _ ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DOCHECK ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BREAK ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASSUME ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_141 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ASSUME -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ASSUME (_menhir_stack, _menhir_s) = _menhir_stack in
          let fml = _v in
          let _v = _menhir_action_067 fml in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ASSUME as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_Formula (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState064
          | ASSUME ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | RBLOCK ->
              let _v_1 = _menhir_action_030 () in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ASSUME, _menhir_box_toplevel) _menhir_cell1_Formula -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Formula (_menhir_stack, _, fml) = _menhir_stack in
      let MenhirCell1_ASSUME (_menhir_stack, _menhir_s) = _menhir_stack in
      let inits = _v in
      let _v = _menhir_action_033 fml inits in
      _menhir_goto_Init _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_Init : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState255 ->
          _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState005 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState064 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState065 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState066 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_VOID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_VOID (_menhir_stack, _menhir_s) = _menhir_stack in
      let inits = _v in
      let _v = _menhir_action_008 inits in
      _menhir_goto_Decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_MultipleNondetAssignInit -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_MultipleNondetAssignInit (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let inits = _v in
      let _v = _menhir_action_032 inits in
      _menhir_goto_Init _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_MultipleAssignInit -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_MultipleAssignInit (_menhir_stack, _menhir_s, data) = _menhir_stack in
      let inits = _v in
      let _v = _menhir_action_031 data inits in
      _menhir_goto_Init _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_059 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let fml = _v in
      let _v = _menhir_action_025 fml in
      _menhir_goto_FormulaAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_057 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_FormulaOr -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_FormulaOr (_menhir_stack, _menhir_s, left) = _menhir_stack in
      let right = _v in
      let _v = _menhir_action_022 left right in
      _menhir_goto_FormulaAnd _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_045 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_int (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PREDSYM _v_0 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN, _menhir_box_toplevel) _menhir_cell1_T_int -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_T_int (_menhir_stack, _, t) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_084 t in
      _menhir_goto_T_intAtom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_093 t in
      _menhir_goto_Term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_Term : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState118 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState126 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_130 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, varname) = _menhir_stack in
          let term = _v in
          let _v = _menhir_action_058 term varname in
          _menhir_goto_StatementGeneral _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_111 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_Term (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState112 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MINUS ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTL _v ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let t = _v in
          let _v = _menhir_action_003 t in
          _menhir_goto_ArguementsOneOrMore _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_ArguementsOneOrMore : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState126 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState110 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState112 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let args = _v in
      let _v = _menhir_action_002 args in
      _menhir_goto_Arguements _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_Arguements : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState110 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_113 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_Term -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Term (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let args = _v in
      let _v = _menhir_action_004 args t in
      _menhir_goto_ArguementsOneOrMore _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_036 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ID (_menhir_stack, _menhir_s, varname) = _menhir_stack in
          let term = _v in
          let _v = _menhir_action_034 term varname in
          _menhir_goto_MultipleAssignInit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_MultipleAssignInit : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState255 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_MultipleAssignInit (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState066
      | ASSUME ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | RBLOCK ->
          let _v_1 = _menhir_action_030 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, varname) = _menhir_stack in
      let tail = _v in
      let _v = _menhir_action_035 tail varname in
      _menhir_goto_MultipleAssignInit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_T_int (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ((ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intAddSub as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASTERISK ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COMMA | MINUS | OR | PREDSYM _ | RPAREN | SEMI ->
          let MenhirCell1_T_intAddSub (_menhir_stack, _menhir_s, t1) = _menhir_stack in
          let t2 = _v in
          let _v = _menhir_action_083 t1 t2 in
          _menhir_goto_T_intAddSub _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MOD ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ASTERISK ->
          let _menhir_stack = MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, _v) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ADD | AND | COMMA | MINUS | OR | PREDSYM _ | RPAREN | SEMI ->
          let t = _v in
          let _v = _menhir_action_081 t in
          _menhir_goto_T_intAddSub _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_089 t1 t2 in
      _menhir_goto_T_intMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_019 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_T_intMultDivMod -> _ -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_T_intMultDivMod (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_090 t1 t2 in
      _menhir_goto_T_intMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_toplevel) _menhir_state -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_087 t in
      _menhir_goto_T_intMultDivMod _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_039 : type  ttv_stack. (ttv_stack, _menhir_box_toplevel) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_038 () in
      _menhir_goto_MultipleNondetAssignInit _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_toplevel =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | UNSIGNED ->
          _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | SHARPINCLUDE ->
          _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | SHARPDEFINE ->
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | INT ->
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF ->
          let _v = _menhir_action_019 () in
          _menhir_run_289 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let toplevel =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_toplevel v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
