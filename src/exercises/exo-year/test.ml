open Test_lib
open Learnocaml_report

let q_nbjour =
  let mois = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12] in
  let ans = [1000; 1100; 1900; 1904; 2000; 2004; 2010; 2018; 2020; 2100] in
  test_function_against_solution
    (* no random cases: *)
    ~gen:0
    (* all (failwith "_", invalid_arg "_") exn are accepted: *)
    ~test:(test_eq_exn (fun ea _ ->
               match ea with
               | Failure _ | Invalid_argument _ -> true
               | _ -> false))
    (* function type: *)
    [%funty: int -> int -> int]
    (* function name: *)
    "nbjour"
    (* the syntax "@:!!" is explained in test_lib.mli *)
    (List.map (fun m -> m @:!! 2012) mois
     @ List.map (fun y -> 2 @:!! y) ans
     @ List.map (fun m -> m @:!! 2020) [0; 13])

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    Section ([ Text "Fonction:" ; Code "nbjour" ], q_nbjour );
  ]
