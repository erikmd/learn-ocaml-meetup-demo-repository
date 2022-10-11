let nbmults = ref 0
let ( * ) x y = incr nbmults ; x * y

let nbconcs = ref 0
let ( ^ ) x y = incr nbconcs ; x ^ y
let mot = [| "ook" ; "plop" ; "burp" ; "blah" ; "bark" |].(Random.int 5)
