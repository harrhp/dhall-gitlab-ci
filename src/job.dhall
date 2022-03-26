let Prelude = ./prelude.dhall

let Image = ./image.dhall

let Rule = ./jobRule.dhall

let Environment = ./environment.dhall

let Artifacts = ./artifacts.dhall

let Needs = ./needs.dhall

let Service = ./service.dhall

let Trigger = ./trigger.dhall

let AllowFailure = ./jobAllowFailure.dhall

let Retry = ./jobRetry.dhall

let Parallel = ./jobParallel.dhall

let Cache = ./jobCache.dhall

let Job =
      { image : Optional Image.Type
      , stage : Optional Text
      , script : Optional (List Text)
      , rules : Optional (List Rule.Type)
      , needs : Optional (List Needs.Variants)
      , resource_group : Optional Text
      , environment : Optional Environment.Type
      , artifacts : Optional Artifacts.Type
      , services : Optional (List Service.Type)
      , trigger : Optional Trigger.Type
      , when : Optional Rule.When
      , after_script : Optional (List Text)
      , before_script : Optional (List Text)
      , allow_failure : Optional AllowFailure.Variants
      , tags : Optional (List Text)
      , timeout : Optional Text
      , interruptible : Optional Bool
      , retry : Optional Retry.Type
      , variables : Optional (Prelude.Map.Type Text Text)
      , parallel : Optional Parallel.Variants
      , cache : Optional (List Cache.Type)
      }

in  { Type = Job
    , default =
      { image = None Image.Type
      , rules = None (List Rule.Type)
      , needs = None (List Needs.Variants)
      , stage = None Text
      , resource_group = None Text
      , environment = None Environment.Type
      , artifacts = None Artifacts.Type
      , services = None (List Service.Type)
      , script = None (List Text)
      , trigger = None Trigger.Type
      , when = None Rule.When
      , after_script = None (List Text)
      , before_script = None (List Text)
      , allow_failure = None AllowFailure.Variants
      , tags = None (List Text)
      , timeout = None Text
      , interruptible = None Bool
      , retry = None Retry.Type
      , variables = None (Prelude.Map.Type Text Text)
      , parallel = None Parallel.Variants
      , cache = None (List Cache.Type)
      }
    , AllowFailure
    , Rule
    , Needs
    , Trigger
    , Environment
    , Image
    , Artifacts
    , Service
    , Retry
    , Parallel
    , Cache
    }
