defmodule ThingsWeLike.CategoryController do
  use ThingsWeLike.Web, :controller

  def index(conn, _params) do
    json conn, [%{name: "Gumboo"}]
  end
end
