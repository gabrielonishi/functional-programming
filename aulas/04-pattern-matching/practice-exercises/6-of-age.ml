type person = {name: string; age : int; country : string ;} ;;

let of_age person =
  if person.age >= 18 then true
  else false ;;

let alice = { name = "Alice"; age = 9; country = "Japan" } ;;
let raul = { age = 40 ; name = "Raul"; country = "Brazil" } ;;


Printf.printf "Alice %b\n" (of_age alice) ;;
Printf.printf "Raul %b\n" (of_age raul) ;;