
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

 

tape.incr_cell(8)
while (tape.get_cell() > 0) { 
tape.move_right(1)
tape.incr_cell(4)
while (tape.get_cell() > 0) { 
tape.move_right(1)
tape.incr_cell(2)
tape.move_right(1)
tape.incr_cell(3)
tape.move_right(1)
tape.incr_cell(3)
tape.move_right(1)
tape.incr_cell(1)
tape.move_left(4)
tape.decr_cell(1)
 }
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(1)
tape.decr_cell(1)
tape.move_right(2)
tape.incr_cell(1)
while (tape.get_cell() > 0) { 
tape.move_left(1)
 }
tape.move_left(1)
tape.decr_cell(1)
 }
tape.move_right(2)
tape.output()
tape.move_right(1)
tape.decr_cell(3)
tape.output()
tape.incr_cell(7)
tape.output()
tape.output()
tape.incr_cell(3)
tape.output()
tape.move_right(2)
tape.output()
tape.move_left(1)
tape.decr_cell(1)
tape.output()
tape.move_left(1)
tape.output()
tape.incr_cell(3)
tape.output()
tape.decr_cell(6)
tape.output()
tape.decr_cell(8)
tape.output()
tape.move_right(2)
tape.incr_cell(1)
tape.output()
tape.move_right(1)
tape.incr_cell(2)
tape.output() 

console.log(tape.flush())
