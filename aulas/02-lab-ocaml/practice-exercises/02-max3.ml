(* 
Escreva uma função que recebe 3 números e retorna o maior 
*)

let compare a b =
  if a >= b then a
  else b ;;

let max3 x y z =
  compare (compare x y) z ;;

let res = max3 4 2 3 in Printf.printf "%d\n" res;;