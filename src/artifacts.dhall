let When = < on_success | on_failure | always >

let Reports =
      { Type = { dotenv : Optional (List Text), junit : Optional (List Text) }
      , default = { dotenv = None (List Text), junit = None (List Text) }
      }

let Artifacts =
      { name : Optional Text
      , paths : Optional (List Text)
      , exclude : Optional (List Text)
      , expire_in : Optional Text
      , expose_as : Optional Text
      , public : Optional Bool
      , reports : Optional Reports.Type
      , untracked : Optional Bool
      , when : Optional When
      }

in  { Type = Artifacts
    , default =
      { name = None Text
      , paths = None (List Text)
      , exclude = None (List Text)
      , expire_in = None Text
      , expose_as = None Text
      , public = None Bool
      , reports = None Reports.Type
      , untracked = None Bool
      , when = None When
      }
    , Reports
    }
