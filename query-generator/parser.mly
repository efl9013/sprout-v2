%{
open Ast 

let make_symbolic_transition pre sender receiver comm_var predicate post =
  { pre; sender; receiver; comm_var; predicate; post }

let make_symbolic_protocol states registers transitions initial_state initial_register_assignment final_states =
  { states; registers; transitions; initial_state; initial_register_assignment; final_states }
%}

%token <int> INT
%token <string> IDENT
%token <string> IDENT_PRIME
%token TRUE FALSE AND OR NOT 
%token EQUALS GT LT PLUS MINUS TIMES DIV
%token LPAREN RPAREN LBRACE RBRACE COMMA COLON ARROW 
%token EOF
%token INIT_HEADER FINAL_HEADER REGISTER_HEADER

%start protocol
%type <Ast.symbolic_protocol> protocol
%type <int> state 
%type <(Ast.variable * int) list> register_assignments
%type <Ast.variable * int> register_assignment
%type <Ast.symbolic_transition list> transitions 
%type <Ast.symbolic_transition> transition 
%type <Ast.formula> formula 
%type <Ast.expr> expr

%left OR
%left AND
%right NOT                 
%left PLUS MINUS          
%left TIMES DIV    

%%

protocol:
  | INIT_HEADER; init = state REGISTER_HEADER; regs = register_assignments trans = transitions FINAL_HEADER final = separated_list(COMMA, state) EOF
    { make_symbolic_protocol 
        (List.sort_uniq compare (init :: [] @ (List.map (fun t -> t.Ast.pre) trans) @ (List.map (fun t -> t.Ast.post) trans)))
        (List.sort_uniq compare (List.map fst regs))
        trans
        init
        regs
        final }
(*  | error { raise (Parse_failure "CRASH!") }*)

state:
  | LPAREN INT RPAREN { $2 }

register_assignments: 
  | /* empty */ { [] }
  | register_assignment { [$1] }
  | register_assignments COMMA register_assignment { $1 @ [$3] }

register_assignment:
  | IDENT EQUALS INT { ($1, $3) }

transitions:
  | /* empty */ { [] }
  | transition transitions { $1 :: $2 }

transition:
  | LPAREN INT RPAREN IDENT ARROW IDENT COLON IDENT LBRACE formula RBRACE LPAREN INT RPAREN
    { make_symbolic_transition $2 $4 $6 $8 $10 $13 }

formula:
  | TRUE { Ast.True }
  | FALSE { Ast.False }
  | expr EQUALS expr { Ast.Eq($1, $3) }
  | expr LT expr { Ast.Lt($1, $3) }
  | expr GT expr { Ast.Gt($1, $3) }
  | formula AND formula { Ast.And($1, $3) }
  | formula OR formula { Ast.Or($1, $3) }
  | NOT formula { Ast.Not($2) }
  
expr:
  | INT { Ast.Const $1 }
  | IDENT { Ast.Var $1 }
  | IDENT_PRIME { Ast.VarPrime $1 }
  | expr PLUS expr { Ast.Plus($1, $3) }
  | expr MINUS expr { Ast.Minus($1, $3) }
  | expr TIMES expr { Ast.Times($1, $3) }
  | expr DIV expr { Ast.Div($1, $3) }
  | LPAREN expr RPAREN { $2 } 
