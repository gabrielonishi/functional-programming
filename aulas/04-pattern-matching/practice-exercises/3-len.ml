let rec len list =
  match list with
  | [] -> 0
  | h :: t -> 1 + len t

let list1 = [0; 1; 2; 3] ;;
let list2 = [] ;;

Printf.printf "Era pra ser 4, foi %d\n" (len list1) ;;
Printf.printf "Era pra ser 0, foi %d\n" (len list2) ;;
