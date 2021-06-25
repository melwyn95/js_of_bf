type t = 
  | Incr_Cell of int
  | Decr_Cell of int
  | Incr_Ptr of int
  | Decr_Ptr of int
  | Loop of t list
  | Input 
  | Output