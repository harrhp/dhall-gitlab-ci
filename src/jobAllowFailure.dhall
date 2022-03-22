let ExitCodesVariants = < Single : Integer | Multiple : List Integer >

let ExitCodes =
      { Type = { exit_codes : ExitCodesVariants }
      , default = {=}
      , Variants = ExitCodesVariants
      }

let Variants = < Bool : Bool | ExitCodes : ExitCodes.Type >

in  { Variants, ExitCodes }
