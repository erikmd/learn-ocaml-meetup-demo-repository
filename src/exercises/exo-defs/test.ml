open Report
open Test_lib

let () = nbmults := !nbmults - 3 (* solution *) ;;

let () = nbconcs := !nbconcs - 5 (* solution *) ;;

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  let sanity_report2 =
    ast_check_structure
      ~on_pattern:(function
          | [%pat? ( * )] -> [ Message ([ Text "Ne redéfinissez pas " ; Code "( * )" ; Text ". SVP, ne le faites pas." ], Failure)]
          | [%pat? ( ^ )] -> [ Message ([ Text "Ne redéfinissez pas " ; Code "(^)" ; Text ". SVP, ne le faites pas." ], Failure)]
          | _ -> [])
      ~on_open:(forbid_syntax "open")
      ~on_include:(forbid_syntax "include")
      ~on_function_call:(fun (expr, _) -> restrict_expr "function" [ [%expr ( * )]; [%expr ( ^ )] ] expr)
      code_ast |> List.sort compare in
  if snd (Report.result sanity_report2) then
    sanity_report2
  else
    [ Section ([ Code "x_pow_8"],
      [ Message ([ Text "Cette fois-ci, " ; Code "x" ; Text "est" ;
                   Code (string_of_int x) ; Text "."], Important) ] @
      test_variable_against_solution [%ty: int] "x_pow_8" @
      [ Message ([ Text "Testons combien de fois vous avez multiplié."], Informative) ] @
      test_ref [%ty: int] nbmults 3) ] @
    [ Section ([ Code "phrase"],
      [ Message ([ Text "Cette fois-ci, " ; Code "mot" ; Text "est" ;
                   Code (Printf.sprintf "%S" mot) ; Text "."], Important) ] @
      test_variable_against_solution [%ty: string] "phrase" @
      [ Message ([ Text "Testons combien de fois vous avez concaténé."], Informative) ] @
      test_ref [%ty: int] nbconcs 5) ]
