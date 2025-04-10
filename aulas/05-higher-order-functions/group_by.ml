type order = { id : int; client_id : int; value : int }

let order0 = { id = 0; client_id = 0; value = 10 }
let order1 = { id = 1; client_id = 1; value = 20 }
let order2 = { id = 2; client_id = 0; value = 30 }
let data = [ order0; order1; order2 ]

module SameClientMap = Map.Make (Int)

let group_by key_extractor value_extractor aggregate_handler data = 
  List.fold_left
    (fun map order ->
      let group_key = key_extractor order in
      let current_value = value_extractor order in
      SameClientMap.update group_key
        (function
          | Some existing -> Some (aggregate_handler existing current_value)
          | None -> Some current_value)
        map)
    SameClientMap.empty data

let t =
  group_by
    (fun (o : order) : int -> o.client_id)
    (fun (o : order) : int -> o.value)
    (fun (acc : int) (value : int) : int -> acc + value)
    data

let () =
  SameClientMap.iter
    (fun (key : int) (value : int) ->
      Printf.printf "client_id: %d total: %d\n" key value)
    t
