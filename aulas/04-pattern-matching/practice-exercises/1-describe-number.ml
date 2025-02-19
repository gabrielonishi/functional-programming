let describe_number n =
    match n with
    | 1 -> "Um"
    | 2 -> "Dois"
    | 3 -> "Três"
    | 4 -> "Quatro"
    | 5 -> "Cinco"
    | _ -> "Outro" ;;


Printf.printf "%s\n" (describe_number 1) ;;
Printf.printf "%s\n" (describe_number 2) ;;
Printf.printf "%s\n" (describe_number 3) ;;
Printf.printf "%s\n" (describe_number 4) ;;
Printf.printf "%s\n" (describe_number 5) ;;
Printf.printf "%s\n" (describe_number 6) ;;
