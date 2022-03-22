let Ci = ../src/ci.dhall

let jobs =
      toMap
        { build = Ci.Job::{
          , script = Some [ "echo build" ]
          , artifacts = Some Ci.Job.Artifacts::{ paths = Some [ "output/" ] }
          }
        , deploy = Ci.Job::{
          , script = Some [ "echo deploy" ]
          , needs = Some
            [ Ci.Job.Needs.Variants.LocalJob
                Ci.Job.Needs.LocalJob::{ job = "build", artifacts = Some True }
            ]
          }
        }

in  Ci.normalize Ci::{ jobs }
