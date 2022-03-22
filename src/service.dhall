let Service =
      { name : Text
      , alias : Optional Text
      , entrypoint : Optional (List Text)
      , command : Optional (List Text)
      }

in  { Type = Service
    , default =
      { alias = None Text
      , entrypoint = None (List Text)
      , command = None (List Text)
      }
    }
