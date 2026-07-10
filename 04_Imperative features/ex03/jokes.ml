let read_lines filename =
  let chan = open_in filename in
  let lines = ref [] in
  (try
     while true do
       let line = input_line chan in
       lines := line :: !lines
     done
   with End_of_file -> ());
  close_in chan;
  List.rev !lines

let () =
  Random.self_init ();
  if Array.length Sys.argv = 2 then
    try
      let lines_list = read_lines Sys.argv.(1) in

      let jokes = Array.of_list lines_list in

      if Array.length jokes > 0 then
        let random_index = Random.int (Array.length jokes) in
        print_endline jokes.(random_index)
      else
        print_endline "Error: Jokes file is empty."
    with
    | _ -> print_endline "Error: Cannot read file."
  else
    print_endline "Usage: ./jokes [filename]"
