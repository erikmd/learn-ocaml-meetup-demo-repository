(* Source : MOOC OCaml *)

let x_pow_8 =
  let x_pow_2 = x * x in
  let x_pow_4 = x_pow_2 * x_pow_2 in
  x_pow_4 * x_pow_4

let phrase =
  let wc = mot ^ "," in
  let w2 = wc ^ wc in
  let w4 = w2 ^ w2 in
  let w8 = w4 ^ w4 in
  w8 ^ mot
