let Artifacts = { Type = { artifact : Text, job : Text }, default = {=} }

let Local = { Type = { local : Text }, default = {=} }

let Template = { Type = { template : Text }, default = {=} }

let Project =
      { Type = { project : Text, file : Text, ref : Optional Text }
      , default.ref = None Text
      }

let Variants =
      < Artifacts : Artifacts.Type
      | Local : Local.Type
      | Template : Template.Type
      | Project : Project.Type
      >

in  { Variants, Artifacts, Local, Template, Project }
