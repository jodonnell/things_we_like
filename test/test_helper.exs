ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ThingsWeLike.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ThingsWeLike.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ThingsWeLike.Repo)

