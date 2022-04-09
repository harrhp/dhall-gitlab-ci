let Prelude = ./prelude.dhall

let Job = ./job.dhall

let Workflow = ./workflow.dhall

let Variable = ./ciVariable.dhall

let Include = ./include.dhall

let Ci =
      { workflow : Optional Workflow.Type
      , jobs : Prelude.Map.Type Text Job.Type
      , stages : Optional (List Text)
      , variables : Optional (Prelude.Map.Type Text Variable.Type)
      , include : Optional (List Include.Variants)
      }

let CiVariants =
      < Workflow : Optional Workflow.Type
      | Job : Job.Type
      | Stage : Optional (List Text)
      | Variables : Optional (Prelude.Map.Type Text Variable.Type)
      | Include : Optional (List Include.Variants)
      >

in  { Type = Ci
    , default =
      { workflow = None Workflow.Type
      , stages = None (List Text)
      , variables = None (Prelude.Map.Type Text Variable.Type)
      , include = None (List Include.Variants)
      }
    , Job
    , Workflow
    , Variable
    , Include
    , normalize =
        \(ci : Ci) ->
            toMap
              { workflow = CiVariants.Workflow ci.workflow
              , stages = CiVariants.Stage ci.stages
              , variables = CiVariants.Variables ci.variables
              , include = CiVariants.Include ci.include
              }
          # Prelude.Map.map
              Text
              Job.Type
              CiVariants
              (\(job : Job.Type) -> CiVariants.Job job)
              ci.jobs
    }
