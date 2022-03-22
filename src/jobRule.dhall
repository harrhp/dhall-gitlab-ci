let Prelude = ./prelude.dhall

let When = < on_success | on_failure | always | manual | delayed | never >

in  { Type =
        { `if` : Optional Text
        , changes : Optional (List Text)
        , when : Optional When
        , exists : Optional (List Text)
        , allow_failure : Optional Bool
        , variables : Optional (Prelude.Map.Type Text Text)
        }
    , default =
      { `if` = None Text
      , changes = None (List Text)
      , when = None When
      , exists = None (List Text)
      , allow_failure = None Bool
      , variables = None (Prelude.Map.Type Text Text)
      }
    , When
    }
