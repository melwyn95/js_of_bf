%token <int> PLUS
%token <int> MINUS
%token <int> MOVE_LEFT
%token <int> MOVE_RIGHT
%token OPEN_SQUARE_BRACE
%token CLOSE_SQUARE_BRACE
%token DOT
%token COMMA
%token EOF

%start <(BF.t list) option> prog

%%

prog: 
    | bf = list_instr EOF { Some bf }
    | EOF                 { None } ;

list_instr:
    instrs = list(instr) { instrs } ;

instr: 
    | p = PLUS                                                    { Incr_Cell p }
    | m = MINUS                                                   { Decr_Cell m }
    | DOT                                                         { Output }
    | COMMA                                                       { Input }
    | l = MOVE_LEFT                                               { Incr_Ptr l }
    | r = MOVE_RIGHT                                              { Decr_Ptr r } 
    | OPEN_SQUARE_BRACE; instrs = list_instr; CLOSE_SQUARE_BRACE { Loop instrs } ;