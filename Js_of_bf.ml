open Core
open Lexing

let parse_with_error lexbuf = Parser.prog Lexer.read lexbuf

let rec parse_and_compile lexbuf =
  match parse_with_error lexbuf with
  | Some _ ->
    print_endline "Done...";
    parse_and_compile lexbuf
  | None -> ()

let loop filename () =
  let inx = In_channel.create filename in
  let lexbuf = Lexing.from_channel inx in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
  parse_and_compile lexbuf;
  In_channel.close inx

let () =
  Command.basic_spec ~summary:"Compile a Brainf*ck program"
    Command.Spec.(empty +> anon ("filename" %: string))
    loop
  |> Command.run