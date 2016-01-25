defmodule ThingsWeLike.PageController do
  use ThingsWeLike.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
