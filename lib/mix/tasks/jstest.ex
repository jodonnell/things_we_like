defmodule Mix.Tasks.Jstest do
  use Mix.Task

  @shortdoc "Run js tests"

  def run(_args) do
    Mix.shell.cmd "./node_modules/karma/bin/karma start"
  end
end
