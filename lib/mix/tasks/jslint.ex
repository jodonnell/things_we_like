defmodule Mix.Tasks.Jslint do
  use Mix.Task

  @shortdoc "Lints the js"

  @moduledoc """
    Lints the js
  """

  def run(_args) do
    Mix.shell.cmd "./node_modules/.bin/eslint web/static/js/"
  end
end
