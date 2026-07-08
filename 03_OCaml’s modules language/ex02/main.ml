let print_card card =
	print_endline
		(Card.toString card ^ " | " ^ Card.toStringVerbose card ^ " | "
		^ Printf.sprintf "%d" (Card.Value.toInt (Card.getValue card)))

let rec print_all = function
	| [] -> ()
	| card :: rest ->
		print_card card;
		print_all rest

let test_compare () =
	let first = Card.newCard Card.Value.T7 Card.Color.Spade in
	let second = Card.newCard Card.Value.T7 Card.Color.Heart in
	let third = Card.newCard Card.Value.King Card.Color.Club in
	let tie_best = Card.best [first; second] in
	print_endline "\n\x1b[4;32mTesting compare / min / max:\x1b[0m";
	print_endline (Printf.sprintf "%d" (Card.compare first second));
	print_endline (Card.toString (Card.max first second));
	print_endline (Card.toString (Card.min first second));
	print_endline (Card.toString tie_best);
	print_endline (Card.toString (Card.best [first; second; third]))

let test_predicates () =
	let card = Card.newCard Card.Value.As Card.Color.Diamond in
	print_endline "\n\x1b[4;32mTesting predicates:\x1b[0m";
	print_endline (string_of_bool (Card.isDiamond card));
	print_endline (string_of_bool (Card.isSpade card));
	print_endline (string_of_bool (Card.isOf card Card.Color.Diamond))

let () =
	print_endline "\n\x1b[4;32mTesting Card.all:\x1b[0m";
	print_all Card.all;
	test_compare ();
	test_predicates ()