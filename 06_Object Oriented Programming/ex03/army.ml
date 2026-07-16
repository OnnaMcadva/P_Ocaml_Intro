class ['a] army =
  object (self)
    val mutable members : 'a list = []

    method get_members = members

    method add (member : 'a) =
      members <- member :: members

    method delete =
      match members with
      | [] -> ()
      | _ :: tail -> members <- tail
  end
