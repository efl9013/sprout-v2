%{
open Ast 

exception Parse_failure of string

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
%token EOF NEWLINE PROTEOF
%token INIT_HEADER FINAL_HEADER REGISTER_HEADER

%start protocol
%type <Ast.symbolic_protocol> protocol
%type <int> initial_state 
%type <(Ast.variable * int) list> register_assignments
%type <Ast.variable * int> register_assignment
%type <Ast.symbolic_transition list> transitions 
%type <Ast.symbolic_transition> transition 
%type <int list> final_states 
%type <int list> final_state 
%type <Ast.formula> formula 
%type <Ast.expr> expr

%left OR
%left AND
%right NOT                 
%left PLUS MINUS          
%left TIMES DIV    

%%

protocol:
  | INIT_HEADER initial_state NEWLINE REGISTER_HEADER register_assignments NEWLINE transitions NEWLINE FINAL_HEADER final_states NEWLINE PROTEOF EOF
    { make_symbolic_protocol 
        (List.sort_uniq compare ($2 :: [] @ (List.map (fun t -> t.Ast.pre) $7) @ (List.map (fun t -> t.Ast.post) $7)))
        (List.sort_uniq compare (List.map fst $5))
        $7
        $2
        $5
        [] }
  | error { raise (Parse_failure "CRASH!") }

initial_state:
  | LPAREN INT RPAREN { $2 }

register_assignments: 
  | /* empty */ { [] }
  | register_assignment { [$1] }
  | register_assignments COMMA register_assignment { $1 @ [$3] }

register_assignment:
  | IDENT EQUALS INT { ($1, $3) }

transitions:
  | /* empty */ { [] }
  | transition NEWLINE transitions { $1 :: $3 }

transition:
  | LPAREN INT RPAREN IDENT ARROW IDENT COLON IDENT LBRACE formula RBRACE LPAREN INT RPAREN
    { make_symbolic_transition $2 $4 $6 $8 $10 $13 }

final_states:
  | /* empty */ { [] }  
  | LPAREN INT RPAREN { [$2] }  
  | final_states COMMA final_state { $1 @ $3 } 

final_state:
  | LPAREN INT RPAREN { [$2] }

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
