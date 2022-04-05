let When = < on_success | on_failure | always >

let Policy = < pull | push | pull-push >

let Key =
      let Complex =
            { Type = { files : List Text, prefix : Optional Text }
            , default.prefix = None Text
            }

      in  { Variants = < Value : Text >, Complex }

let Cache =
      { paths : Optional (List Text)
      , untracked : Optional Bool
      , when : Optional When
      , policy : Optional Policy
      , key : Key.Variants
      }

in  { Type = Cache
    , default =
      { paths = None (List Text)
      , untracked = None Bool
      , when = None When
      , policy = None Policy
      }
    , Key
    , When
    }
