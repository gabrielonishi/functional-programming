(* 

3. Escreva uma função que calcula a soma dos dígitos de um número

*)
 
let rec sum_digits x = 
  if x == 0 then 0
  else 
    if x < 0 then 
      sum_digits (-x)
    else 
      x mod 10 + (sum_digits (x / 10)) ;;

let x = 1234 in
  Printf.printf "sum_digits(%d) = %d\n" x (sum_digits x) ;;
