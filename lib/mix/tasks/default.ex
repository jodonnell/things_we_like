defmodule Mix.Tasks.Default do
  use Mix.Task

  @shortdoc "Runs all the tests and the linter"

  @moduledoc """
  Runs all the tests and the linter
  """

  def project do
    [default_task: "run"]
  end

  def run(_args) do
    #Mix.env :test
    Mix.Task.run "jslint", []
    Mix.Task.run "test", []
  end
end
