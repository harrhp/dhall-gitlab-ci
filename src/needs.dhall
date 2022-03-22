let LocalJob =
      { Type =
          { job : Text, artifacts : Optional Bool, optional : Optional Bool }
      , default = { artifacts = None Bool, optional = None Bool }
      }

let ParentPipeline =
      { Type = { job : Text, artifacts : Optional Bool, pipeline : Text }
      , default.artifacts = None Bool
      }

let Variants =
      < LocalJob : LocalJob.Type | ParentPipeline : ParentPipeline.Type >

in  { Variants, LocalJob, ParentPipeline }
