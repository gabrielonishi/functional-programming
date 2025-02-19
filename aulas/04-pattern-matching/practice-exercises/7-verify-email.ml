type person = {
  name: string;
  age: int;
  country: string;
  email: string;
} ;;

let raul = {
  name = "Raul";
  age = 40;
  country = "Brazil";
  email = "rauligs@insper.edu.br";
} ;;

let alice = {
  name = "Alice";
  age = 9;
  country = "Japan";
  email = "";
} ;;

let verify_email p =
  match p with
  | {email = ""; _ } -> false
  | _ -> true ;;

Printf.printf "Raul %b\n" (verify_email raul) ;;
Printf.printf "Alice %b\n" (verify_email alice) ;;