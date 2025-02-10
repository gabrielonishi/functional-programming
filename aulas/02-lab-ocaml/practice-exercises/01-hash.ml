(* 
Escreva uma função que calcula um hash simples: h(x) = (x^2 mod n) 

n precisa ser um número primo grande
*)

let h x n = x * x mod n in
  let x = 3 in
    let n = 3 in
      Printf.printf "h(%d) = %d quando n = %d\n" x (h x n) n