let VariableWithDescription =
      { Type = { value : Text, description : Optional Text }
      , default.description = None Text
      }

let Variable = < Value : Text | Complex : VariableWithDescription.Type >

in  { Type = Variable, VariableWithDescription }
