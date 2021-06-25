{
open Lexing
open Parser

let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <-
    { pos with pos_bol = lexbuf.lex_curr_pos;
               pos_lnum = pos.pos_lnum + 1
    }
}

let newline = '\r' | '\n' | "\r\n"

let plus = '+' +
let minus = '-' +
let gt = '>' +
let lt = '<' +

rule read = 
    parse
    | newline { next_line lexbuf; read lexbuf }
    | plus    as p { PLUS (String.length p) }
    | minus   as m { MINUS (String.length m) }
    | gt      as g { MOVE_RIGHT (String.length g) }
    | lt      as l { MOVE_LEFT (String.length l) }
    | '['     { OPEN_SQUARE_BRACE }
    | ']'     { CLOSE_SQUARE_BRACE }
    | '.'     { DOT }
    | ','     { COMMA }
    | eof     { EOF }
    | _       { read lexbuf }