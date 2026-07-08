let rec print_string_list = function
	| [] -> ()
	| [last] -> print_endline last
	| head :: tail ->
		print_string (head ^ "; ");
		print_string_list tail

let show_deck label deck =
	print_endline label;
	print_string_list (Deck.toStringList deck)

let show_deck_verbose label deck =
	print_endline label;
	print_string_list (Deck.toStringListVerbose deck)

let test_draw deck =
	let card, rest = Deck.drawCard deck in
	print_endline ("First card: " ^ Deck.Card.toStringVerbose card);
	print_endline
		("Remaining cards: "
		^ Printf.sprintf "%d" (List.length (Deck.toStringList rest)))

let test_card_modules () =
	let value = Deck.Card.Value.As in
	let color = Deck.Card.Color.Spade in
	let card = Deck.Card.newCard value color in
	print_endline (Deck.Card.toString card);
	print_endline (Deck.Card.toStringVerbose card);
	print_endline (Deck.Card.Value.toString (Deck.Card.Value.previous value));
	print_endline (Deck.Card.Color.toStringVerbose color)

let () =
	Random.self_init ();
	let deck1 = Deck.newDeck () in
	let deck2 = Deck.newDeck () in
	show_deck "Deck 1:" deck1;
	show_deck_verbose "Deck 1 verbose:" deck1;
	show_deck "Deck 2:" deck2;
	test_draw deck1;
	test_card_modules ()