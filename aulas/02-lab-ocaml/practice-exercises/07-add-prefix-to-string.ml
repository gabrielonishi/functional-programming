(* 
7. Escreva uma função que recebe um prefixo e devolve uma função que adiciona o prefixo a qualquer string
 *)

let add_prefix_to_string prefix =
  fun s -> prefix ^ s ;;

let f = add_prefix_to_string "prefixo teste " ;;

Printf.printf "%s" (f "string aleatória \n" );; 