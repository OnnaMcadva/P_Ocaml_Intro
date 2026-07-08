let rec print_all = function
	| [] -> ()
	| color :: rest ->
			print_endline
				(Color.toString color ^ " -> " ^ Color.toStringVerbose color);
			print_all rest

let () =
	print_endline "\n\x1b[4;32mTesting Color.all:\x1b[0m";
	print_all Color.all;
	print_endline "\n\x1b[4;32mTesting direct calls:\x1b[0m";
	print_endline (Color.toString Color.Spade);
	print_endline (Color.toString Color.Heart);
	print_endline (Color.toStringVerbose Color.Diamond);
	print_endline (Color.toStringVerbose Color.Club)
