
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

 

tape.output()
tape.incr_cell(33)
tape.move_right(1)
tape.incr_cell(30)
tape.incr_cell(31)
tape.move_right(1)
tape.incr_cell(10)
tape.move_right(1)
tape.incr_cell(7)
tape.move_right(1)
tape.move_right(1)
tape.incr_cell(1)
tape.move_left(2)
while (tape.get_cell() > 0) { 
tape.move_right(1)
tape.incr_cell(48)
tape.output()
tape.decr_cell(48)
tape.move_left(4)
tape.output()
tape.decr_cell(1)
tape.output()
tape.move_right(1)
tape.output()
tape.move_left(1)
tape.output()
tape.incr_cell(1)
tape.move_right(5)
tape.move_right(1)
tape.move_right(1)
tape.incr_cell(10)
tape.move_left(2)
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(1)
tape.decr_cell(1)
while (tape.get_cell() > 0) { 
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(2)
 }
tape.move_right(1)
while (tape.get_cell() > 0) { 
tape.incr_cell(1)
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
tape.move_left(1)
tape.incr_cell(1)
tape.move_right(1)
 }
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(2)
 }
tape.move_left(6)
 }
tape.move_right(1)
while (tape.get_cell() > 0) { 
tape.move_left(1)
tape.incr_cell(1)
tape.move_right(1)
tape.decr_cell(1)
 }
tape.move_right(1)
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
 }
tape.move_right(2)
tape.move_right(1)
tape.incr_cell(10)
tape.move_left(1)
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
tape.move_right(1)
tape.decr_cell(1)
while (tape.get_cell() > 0) { 
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(2)
 }
tape.move_right(1)
while (tape.get_cell() > 0) { 
tape.incr_cell(1)
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
tape.move_left(1)
tape.incr_cell(1)
tape.move_right(1)
 }
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(2)
 }
tape.move_left(5)
 }
tape.move_right(1)
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
 }
tape.move_right(2)
while (tape.get_cell() > 0) { 
tape.incr_cell(48)
tape.output()
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
 }
 }
tape.move_left(1)
while (tape.get_cell() > 0) { 
tape.incr_cell(48)
tape.output()
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
 }
 }
tape.move_left(3)
tape.incr_cell(48)
tape.output()
while (tape.get_cell() > 0) { 
tape.decr_cell(1)
 }
tape.move_left(6)
tape.output()
tape.move_right(2)
tape.incr_cell(1)
tape.move_right(1)
while (tape.get_cell() > 0) { 
tape.move_right(2)
tape.incr_cell(1)
tape.move_left(2)
tape.decr_cell(1)
 }
tape.move_right(2)
while (tape.get_cell() > 0) { 
tape.move_left(3)
while (tape.get_cell() > 0) { 
tape.move_right(1)
tape.incr_cell(1)
tape.move_right(1)
tape.incr_cell(1)
tape.move_left(2)
tape.decr_cell(1)
 }
tape.move_right(2)
while (tape.get_cell() > 0) { 
tape.move_left(2)
tape.incr_cell(1)
tape.move_right(2)
tape.decr_cell(1)
 }
tape.move_right(1)
tape.decr_cell(1)
 }
tape.move_left(4)
tape.decr_cell(1)
 } 

tape.flush()
