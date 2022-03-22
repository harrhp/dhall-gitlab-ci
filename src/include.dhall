let Artifacts = { Type = { artifact : Text, job : Text }, default = {=} }

let Local = { Type = { local : Text }, default = {=} }

let Template = { Type = { template : Text }, default = {=} }

let Remote = { Type = { remote : Text }, default = {=} }

let Project =
      { Type = { project : Text, file : List Text, ref : Optional Text }
      , default.ref = None Text
      }

let Variants =
      < Local : Local.Type
      | Template : Template.Type
      | Remote : Remote.Type
      | Project : Project.Type
      >

in  { Variants, Artifacts, Local, Template, Project }
