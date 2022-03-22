let DeploymentTier = < production | staging | testing | development | other >

let Action = < start | prepare | stop >

in  { Type =
        { name : Text
        , url : Optional Text
        , on_stop : Optional Text
        , action : Optional Action
        , auto_stop_in : Optional Text
        , deployment_tier : Optional DeploymentTier
        }
    , default.deployment_tier = None DeploymentTier
    , DeploymentTier
    }
