open Test_lib
open Learnocaml_report

let q_nbjour =
  let prot = [%funty: int -> int -> int] in
  let mois = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12] in
  let ans = [1000; 1100; 1900; 1904; 2000; 2004; 2010; 2018; 2020; 2100] in
  test_function_against_solution ~gen:0 prot "nbjour"
  (* The syntax "@:!!" is explained in
     https://github.com/ocaml-sf/learn-ocaml/blob/master/src/grader/test_lib.mli *)
    (List.map (fun m -> m @:!! 2012) mois @
     List.map (fun y -> 2 @:!! y) ans)

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    Section ([ Text "Fonction:" ; Code "nbjour" ], q_nbjour );
  ]
