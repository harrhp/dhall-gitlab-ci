let Prelude = ./prelude.dhall

let Complex =
      { Type = { matrix : List (Prelude.Map.Type Text (List Text)) }
      , default = {=}
      }

let Variants = < Degree : Natural | Complex : Complex.Type >

in  { Variants, Complex }
