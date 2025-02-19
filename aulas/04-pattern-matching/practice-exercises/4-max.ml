let compare a b =
  if a >= b then a
  else b ;;

let rec max lst =
  match lst with
  | [] -> failwith "Empty list"
  | [x] -> x
  | h :: t -> compare h (max t) ;;

let lst1 = [1; 2; 3; 4] ;;
let lst2 = [300; 12; 3; -5; 2459] ;;

Printf.printf "Era pra ser 4, foi %d\n" (max(lst1)) ;;
Printf.printf "Era pra ser 2459, foi %d\n" (max(lst2)) ;;