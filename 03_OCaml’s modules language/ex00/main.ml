let rec print_all = function
	| [] -> ()
	| color :: rest ->
			print_endline
				(Color.toString color ^ " -> " ^ Color.toStringVerbose color);
			print_all rest

let () =
	print_endline "\nTesting Color.all:";
	print_all Color.all;
	print_endline "\nTesting direct calls:";
	print_endline (Color.toString Color.Spade);
	print_endline (Color.toString Color.Heart);
	print_endline (Color.toStringVerbose Color.Diamond);
	print_endline (Color.toStringVerbose Color.Club)
