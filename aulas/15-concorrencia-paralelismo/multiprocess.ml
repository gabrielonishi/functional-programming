(* Carregando as bibliotecas necessárias *)
open Domainslib
open Digestif  (* Para usar sha256 *)
open Printf

(* Simula um cálculo CPU-bound usando sha256 *)
let boil_eggs i msg =
  printf "Boiling eggs %d...\n%!" i;
  ignore (SHA256.digest_bytes msg);  (* Simula trabalho pesado *)
  i
let () =
  let pool = Task.setup_pool ~num_domains:3 () in
  let results_array = Array.make 3 (-1) in
  let msg = Bytes.make (100_000_000 * 16) 'A' in
  Task.run pool (fun () ->
    Task.parallel_for pool ~start:0 ~finish:2 ~body:(fun i ->
      results_array.(i) <- boil_eggs i msg
    )
  );

  let results = Array.to_list results_array in
  printf "Result: [%s]\n%!" (String.concat "; " (List.map string_of_int results));

  (* Clean up the pool *)
  printf "Tearing down pool...\n%!";
  Task.teardown_pool pool;