open Core
open Lexing

let compile bf = BF.to_js bf

let parse lexbuf = Parser.prog Lexer.read lexbuf

let parse_and_compile lexbuf =
  match parse lexbuf with
  | Some bf ->
    print_endline (compile bf);
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