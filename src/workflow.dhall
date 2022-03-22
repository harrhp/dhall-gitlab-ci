let Rule = ./workflowRule.dhall

let Workflow = { rules : List Rule.Type }

in  { Type = Workflow, default = {=}, Rule }
