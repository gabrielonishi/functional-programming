(* 
Escreva uma função que calcula um hash simples: h(x) = (x^2 mod n) 

n precisa ser um número primo grande
*)

let n = 3 ;;

let f x = x * x mod n ;;

Printf.printf "%d\n" (f 3)