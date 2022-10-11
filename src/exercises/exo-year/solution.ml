(* Source : TP ILU-1 de l'UT3 *)

let nbjour mois annee =
  match mois with
  | 1 | 3 | 5 | 7 | 8 | 10 | 12 -> 31
  | 2 -> if bissextile annee then 29 else 28
  | 4 | 6 | 9 | 11 -> 30
  | _ -> failwith "nbjour"
