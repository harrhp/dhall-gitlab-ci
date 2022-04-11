# Dhall schema for gitlab-ci.yaml

## Installation
```dhall
let Ci = https://raw.githubusercontent.com/harrhp/dhall-gitlab-ci/main/src/ci.dhall
```
Make sure to add [integrity check](https://docs.dhall-lang.org/discussions/Safety-guarantees.html#code-injection) to the remote import

## How to use

```dhall
# .gitlab-ci.dhall

let Ci = https://raw.githubusercontent.com/harrhp/dhall-gitlab-ci/main/src/ci.dhall

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
```

Run transformation utility
```shell
dhall-to-yaml-ng --file .gitlab-ci.dhall --output .gitlab-ci.yml
```

Output
```yml
# .gitlab-ci.yml

build:
  artifacts:
    paths:
    - output/
  script:
  - echo build
deploy:
  needs:
  - artifacts: true
    job: build
  script:
  - echo deploy
```