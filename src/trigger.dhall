let Include = ./triggerInclude.dhall

let Strategy = < depend >

let Trigger = { include : List Include.Variants, strategy : Optional Strategy }

in  { Type = Trigger, default.strategy = None Strategy, Strategy, Include }
