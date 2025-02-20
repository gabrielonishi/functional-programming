type movies = {
  id: int;
  name: string;
  genre: string;
} ;;

let mv1 = {id=1 ; name="Superbad"; genre="Comedy"} ;;
let mv2 = {id=2 ; name="About Time"; genre="Romance"} ;;
let mv3 = {id=3 ; name="Office Space"; genre="Comedy"} ;;
let mv4 = {id=4 ; name="Alien"; genre="Thriller"} ;;
let mv5 = {id=5 ; name="Psycho"; genre="Thriller"} ;;
let mv6 = {id=6 ; name="Crazy, Stupid, Love"; genre="Comedy"} ;;
let mv7 = {id=7 ; name="The Notebook"; genre="Romance"} ;;

let db = [mv1; mv2; mv3; mv4; mv5; mv6; mv7] ;;

let group_by extract_keys_func extract_values_func aggr_func lst =
  let map_db = StringMap.empty in
  

let extract_name = (fun x -> x.name) ;;
let extract_value = (fun x -> x.genre) ;;

