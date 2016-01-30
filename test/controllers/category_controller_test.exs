defmodule ThingsWeLike.CategoryControllerTest do
  use ThingsWeLike.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/api/category"
    assert json_response(conn, 200) == [%{"name" => "Gumboo"}]
  end
end
