module Card = struct
	module Color = struct
		type t = Spade | Heart | Diamond | Club

		let all = [Spade; Heart; Diamond; Club]

		let toString = function
			| Spade -> "S"
			| Heart -> "H"
			| Diamond -> "D"
			| Club -> "C"

		let toStringVerbose = function
			| Spade -> "Spade"
			| Heart -> "Heart"
			| Diamond -> "Diamond"
			| Club -> "Club"
	end

	module Value = struct
		type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

		let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

		let toInt = function
			| T2 -> 1
			| T3 -> 2
			| T4 -> 3
			| T5 -> 4
			| T6 -> 5
			| T7 -> 6
			| T8 -> 7
			| T9 -> 8
			| T10 -> 9
			| Jack -> 10
			| Queen -> 11
			| King -> 12
			| As -> 13

		let toString = function
			| T2 -> "2"
			| T3 -> "3"
			| T4 -> "4"
			| T5 -> "5"
			| T6 -> "6"
			| T7 -> "7"
			| T8 -> "8"
			| T9 -> "9"
			| T10 -> "10"
			| Jack -> "J"
			| Queen -> "Q"
			| King -> "K"
			| As -> "A"

		let toStringVerbose = function
			| T2 -> "2"
			| T3 -> "3"
			| T4 -> "4"
			| T5 -> "5"
			| T6 -> "6"
			| T7 -> "7"
			| T8 -> "8"
			| T9 -> "9"
			| T10 -> "10"
			| Jack -> "Jack"
			| Queen -> "Queen"
			| King -> "King"
			| As -> "As"

		let next = function
			| T2 -> T3
			| T3 -> T4
			| T4 -> T5
			| T5 -> T6
			| T6 -> T7
			| T7 -> T8
			| T8 -> T9
			| T9 -> T10
			| T10 -> Jack
			| Jack -> Queen
			| Queen -> King
			| King -> As
			| As -> invalid_arg "Value.next"

		let previous = function
			| T2 -> invalid_arg "Value.previous"
			| T3 -> T2
			| T4 -> T3
			| T5 -> T4
			| T6 -> T5
			| T7 -> T6
			| T8 -> T7
			| T9 -> T8
			| T10 -> T9
			| Jack -> T10
			| Queen -> Jack
			| King -> Queen
			| As -> King
	end

	type t = Value.t * Color.t

	let newCard value color = (value, color)

	let allSpades = List.map (fun value -> newCard value Color.Spade) Value.all
	let allHearts = List.map (fun value -> newCard value Color.Heart) Value.all
	let allDiamonds = List.map (fun value -> newCard value Color.Diamond) Value.all
	let allClubs = List.map (fun value -> newCard value Color.Club) Value.all
	let all = allSpades @ allHearts @ allDiamonds @ allClubs

	let getValue (value, _) = value
	let getColor (_, color) = color

	let toString (value, color) = Value.toString value ^ Color.toString color

	let toStringVerbose (value, color) =
		Printf.sprintf "Card(%s, %s)" (Value.toStringVerbose value) (Color.toStringVerbose color)

	let compare first second =
		let value_compare = Stdlib.compare (getValue first) (getValue second) in
		if value_compare <> 0 then value_compare else Stdlib.compare (getColor first) (getColor second)

	let max first second =
		if compare first second < 0 then second else first

	let min first second =
		if compare first second > 0 then second else first

	let best = function
		| [] -> invalid_arg "Card.best"
		| first :: rest ->
			List.fold_left
				(fun best_card card ->
					if Value.toInt (getValue card) > Value.toInt (getValue best_card)
					then card
					else best_card)
				first rest

	let isOf card color = getColor card = color
	let isSpade card = isOf card Color.Spade
	let isHeart card = isOf card Color.Heart
	let isDiamond card = isOf card Color.Diamond
	let isClub card = isOf card Color.Club
end

type t = Card.t list

let insert_random card deck =
	let rec aux prefix index = function
		| [] -> List.rev_append prefix [card]
		| head :: tail when index = 0 -> List.rev_append prefix (card :: head :: tail)
		| head :: tail -> aux (head :: prefix) (index - 1) tail
	 in
	aux [] (Random.int (List.length deck + 1)) deck

let newDeck () =
	List.fold_left (fun deck card -> insert_random card deck) [] Card.all

let toStringList deck = List.map Card.toString deck
let toStringListVerbose deck = List.map Card.toStringVerbose deck

let drawCard = function
	| [] -> raise (Failure "Deck.drawCard: empty deck")
	| card :: rest -> card, rest