let max_tuple t =
  let a, b = t in
    if a > b then Printf.printf "a > b\n"
    else if a == b then Printf.printf "a = b\n"
    else Printf.printf "a < b\n" ;;
  
max_tuple (1, 3) ;;
max_tuple (1, 1) ;;
max_tuple (12, 4) ;;
