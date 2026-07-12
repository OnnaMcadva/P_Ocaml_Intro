module type FRACTIONNAL_BITS = sig
  val bits : int
end

module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val gte : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool
  val eqs : t -> t -> bool
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module Make (B : FRACTIONNAL_BITS) : FIXED = struct
  let scale = 1 lsl B.bits
  type t = int

  let round_float f =
    if f >= 0. then truncate (f +. 0.5)
    else truncate (f -. 0.5)

  let of_float f = round_float (f *. float scale)
  let of_int i = i * scale
  let to_float x = float x /. float scale
  let to_int x = x / scale
  let to_string x = string_of_float (to_float x)

  let zero = 0
  let one = scale

  let succ x = x + scale
  let pred x = x - scale

  let min x y = if x < y then x else y
  let max x y = if x > y then x else y

  let gth x y = x > y
  let lth x y = x < y
  let gte x y = x >= y
  let lte x y = x <= y
  let eqp x y = x == y
  let eqs x y = x = y

  let add x y = x + y
  let sub x y = x - y
  let mul x y = (x * y) / scale
  let div x y =
    if y = 0 then failwith "Division by zero"
    else (x * scale + y / 2) / y

  let foreach start stop f =
    let rec loop cur =
      if cur > stop then ()
      else (f cur; loop (cur + 1))
    in
    loop start
end

module Fixed4 = Make (struct let bits = 4 end)
module Fixed8 = Make (struct let bits = 8 end)

let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach Fixed4.zero Fixed4.one (fun f -> print_endline (Fixed4.to_string f))

(* EXTRA TESTS *)
module Fixed2 = Make (struct let bits = 2 end)

let () =
  Printf.printf "\n\x1b[4;32m<> Additional tests <>\x1b[0m\n";
  let a = Fixed2.of_float 1.5 in
  let b = Fixed2.of_float 2.25 in
  Printf.printf "a = %s\n" (Fixed2.to_string a);
  Printf.printf "b = %s\n" (Fixed2.to_string b);
  Printf.printf "a + b = %s\n" (Fixed2.to_string (Fixed2.add a b));
  Printf.printf "a - b = %s\n" (Fixed2.to_string (Fixed2.sub a b));
  Printf.printf "a * b = %s\n" (Fixed2.to_string (Fixed2.mul a b));
  Printf.printf "a / b = %s\n" (Fixed2.to_string (Fixed2.div a b));
  Printf.printf "succ a = %s\n" (Fixed2.to_string (Fixed2.succ a));
  Printf.printf "pred a = %s\n" (Fixed2.to_string (Fixed2.pred a));
  Printf.printf "min a b = %s\n" (Fixed2.to_string (Fixed2.min a b));
  Printf.printf "max a b = %s\n" (Fixed2.to_string (Fixed2.max a b));
  Printf.printf "gth a b = %b\n" (Fixed2.gth a b);
  Printf.printf "lth a b = %b\n" (Fixed2.lth a b);
  Printf.printf "gte a b = %b\n" (Fixed2.gte a b);
  Printf.printf "lte a b = %b\n" (Fixed2.lte a b);
  Printf.printf "eqp a a = %b\n" (Fixed2.eqp a a);
  Printf.printf "eqs a a = %b\n" (Fixed2.eqs a a);
  Printf.printf "to_int a = %d\n" (Fixed2.to_int a);
  Printf.printf "foreach from 0.0 to 1.0 step 0.25:\n";
  Fixed2.foreach Fixed2.zero Fixed2.one (fun x -> Printf.printf "  %s\n" (Fixed2.to_string x))
