type t = 
  | Incr_Cell of int
  | Decr_Cell of int
  | Incr_Ptr of int
  | Decr_Ptr of int
  | Loop of t list
  | Input 
  | Output

let prelude = "
function Tape() {
  const tape = Array(30000).fill(0);
  let ptr = 0;
  let buffer = '';
  return {
    move_left: n => ptr -= n,
    move_right: n => ptr += n,
    incr_cell: n => tape[ptr] += n,
    decr_cell: n => tape[ptr] -= n,
    input: () => {/* TODO: implement this */ },
    output: () => buffer += String.fromCharCode(tape[ptr]),
    get_cell: () => tape[ptr],
    flush: () => console.log(buffer)
  }
}
const tape = Tape();

"

let flush = "tape.flush()"

let rec to_js_commands bf = 
  List.fold_left(fun acc bf -> 
    match bf with
  | Incr_Cell n -> acc ^ Printf.sprintf "\ntape.incr_cell(%d)" n
  | Decr_Cell n -> acc ^ Printf.sprintf "\ntape.decr_cell(%d)" n 
  | Incr_Ptr n ->acc ^ Printf.sprintf "\ntape.move_left(%d)" n
  | Decr_Ptr n ->acc ^ Printf.sprintf "\ntape.move_right(%d)" n
  | Input -> acc ^ Printf.sprintf "\ntape.input()" 
  | Output ->acc ^ Printf.sprintf "\ntape.output()" 
  | Loop bf -> acc ^ "\n" ^ Printf.sprintf "while (tape.get_cell() > 0) { %s\n }" (to_js_commands bf)
  ) "" bf

let to_js bf = Printf.sprintf "%s \n%s \n\n%s" prelude (to_js_commands bf) flush
