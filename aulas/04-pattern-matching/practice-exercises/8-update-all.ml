let rec update_all lst old_val new_val = 
  match lst with
  | [] -> []
  | h :: t -> 
    if h = old_val then new_val :: update_all t old_val new_val
    else h :: update_all t old_val new_val ;;

let rec print_list lst =
  match lst with
  | [] -> Printf.printf "\n"
  | h :: t -> Printf.printf "%d; " h; print_list t ;;

let lst1 = [1; 2; 3; 2; 4] ;;

Printf.printf "Antes: " ;;
print_list lst1;;

Printf.printf "Depois: " ;;
print_list (update_all lst1 2 9) ;;