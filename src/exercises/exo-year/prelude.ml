(* Prélude - pas besoin de recopier ce code *)
let bissextile annee =
  annee mod 4 = 0 && annee mod 100 <> 0 || annee mod 400 = 0
