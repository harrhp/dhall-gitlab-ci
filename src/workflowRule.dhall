let Prelude = ./prelude.dhall

let When = < always | never >

let Rule =
      { `if` : Optional Text
      , changes : Optional (List Text)
      , when : Optional When
      , exists : Optional (List Text)
      , variables : Optional (Prelude.Map.Type Text Text)
      }

in  { Type = Rule
    , default =
      { `if` = None Text
      , changes = None (List Text)
      , when = None When
      , exists = None (List Text)
      , variables = None (Prelude.Map.Type Text Text)
      }
    , When
    }
