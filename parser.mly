%token <string> PLUS
%token <string> MINUS
%token <string> MOVE_LEFT
%token <string> MOVE_RIGHT
%token OPEN_SQUARE_BRACE
%token CLOSE_SQUARE_BRACE
%token DOT
%token COMMA
%token EOF

%start <(BF.t list) option> prog

%%

prog: 
    | bf = list_instr { Some bf }
    | EOF             { None } ;

list_instr:
    instrs = list(instr) { instrs } ;

instr: 
    | p = PLUS                                                    { Incr_Cell (String.length p) }
    | m = MINUS                                                   { Decr_Cell (String.length m) }
    | DOT                                                         { Output }
    | COMMA                                                       { Input }
    | l = MOVE_LEFT                                               { Incr_Ptr (String.length l) }
    | r = MOVE_RIGHT                                              { Decr_Ptr (String.length r) } 
    | OPEN_SQUARE_BRACE; instrs = list_instr ; CLOSE_SQUARE_BRACE { Loop instrs } ;