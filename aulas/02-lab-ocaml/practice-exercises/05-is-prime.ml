(* 
Escreva uma função que verifica se um número é primo
*)

let is_prime x =
  if x <= 2 then 
    false
  else
    let rec inner div =
      if div == 1 
        then true
      else 
        if x mod div == 0 
          then false
        else 
        if (inner (div - 1)) == true 
          then true
        else false
      in
    if inner (x - 1) == true then true
    else false ;;

Printf.printf "%b\n" (is_prime 3) ;;
Printf.printf "%b\n" (is_prime 4) ;;
Printf.printf "%b\n" (is_prime 5) ;;
Printf.printf "%b\n" (is_prime 7) ;;
Printf.printf "%b\n" (is_prime 10091) ;;

  