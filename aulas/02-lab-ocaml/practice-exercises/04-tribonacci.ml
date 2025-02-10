(* 
4. Escreva uma função que calcula o n-ésimo número de Tribonacci

f(0) -> 0
f(1) -> 1
f(2) -> 1
f(3) -> 2 = 1 + 1 + 0
f(4) -> 4 = 2 + 1 + 1
f(5) -> 7 = 4 + 2 + 1 
*)

let rec trib a =
  if a <= 0 then 0
  else 
    if a <= 2 then 1
    else
      trib (a-1) + trib (a-2) + trib (a - 3) ;;


let test b = b ;;

Printf.printf "trib(%d) = %d\n" 0 (trib 0) ;; 
Printf.printf "trib(%d) = %d\n" 1 (trib 1) ;;
Printf.printf "trib(%d) = %d\n" 2 (trib 2) ;;
Printf.printf "trib(%d) = %d\n" 3 (trib 3) ;;
Printf.printf "trib(%d) = %d\n" 4 (trib 4) ;;
Printf.printf "trib(%d) = %d\n" 5 (trib 5) ;;