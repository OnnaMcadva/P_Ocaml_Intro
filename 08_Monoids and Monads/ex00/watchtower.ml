module Watchtower =
struct
  type hour = int
  
  let zero : hour = 12

  let add (h1 : hour) (h2 : hour) : hour =
    let res = (h1 + h2) mod 12 in
    if res = 0 then 12 else if res < 0 then res + 12 else res

  let sub (h1 : hour) (h2 : hour) : hour =
    let res = (h1 - h2) mod 12 in
    if res = 0 then 12 else if res < 0 then res + 12 else res
end

let () =

  let open_print h = print_endline (string_of_int h) in
  
  print_string "Zero: "; open_print Watchtower.zero;
  print_string "11 + 2 = "; open_print (Watchtower.add 11 2);
  print_string "12 + 12 = "; open_print (Watchtower.add 12 12);
  print_string "3 - 5 = "; open_print (Watchtower.sub 3 5);
  print_string "12 - 1 = "; open_print (Watchtower.sub 12 1);
