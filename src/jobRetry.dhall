let When =
      < always
      | unknown_failure
      | script_failure
      | api_failure
      | stuck_or_timeout_failure
      | runner_system_failure
      | runner_unsupported
      | stale_schedule
      | job_execution_timeout
      | archived_failure
      | unmet_prerequisites
      | scheduler_failure
      | data_integrity_failure
      >

in  { Type = { max : Natural, when : Optional (List When) }
    , default.when = None (List When)
    , When
    }
