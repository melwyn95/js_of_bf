{
open Lexing
open Parser

exception SyntaxError of string

let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <-
    { pos with pos_bol = lexbuf.lex_curr_pos;
               pos_lnum = pos.pos_lnum + 1
    }
}

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

let plus = '+' +
let minus = '-' +
let gt = '>' +
let lt = '<' +

rule read = 
    parse
    | white   { read lexbuf }
    | newline { next_line lexbuf; read lexbuf }
    | plus    { PLUS (Lexing.lexeme lexbuf) }
    | minus   { MINUS (Lexing.lexeme lexbuf) }
    | gt      { MOVE_RIGHT (Lexing.lexeme lexbuf) }
    | lt      { MOVE_LEFT (Lexing.lexeme lexbuf) }
    | '['     { OPEN_SQUARE_BRACE }
    | ']'     { CLOSE_SQUARE_BRACE }
    | '.'     { DOT }
    | ','     { COMMA }
    | eof     { EOF }
    | _       { read lexbuf }