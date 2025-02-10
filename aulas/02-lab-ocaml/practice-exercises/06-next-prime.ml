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

let next_prime n =
  let rec inner x =
    if is_prime x then x else inner (x + 1)
  in inner (n + 1) ;;

Printf.printf "%d\n" (next_prime 3) ;;
Printf.printf "%d\n" (next_prime 4) ;;
Printf.printf "%d\n" (next_prime 5) ;;