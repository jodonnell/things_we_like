defmodule ThingsWeLike.OpinionControllerTest do
  use ThingsWeLike.ConnCase

  alias ThingsWeLike.Opinion
  @valid_attrs %{like: true, name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, opinion_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    opinion = Repo.insert! %Opinion{}
    conn = get conn, opinion_path(conn, :show, opinion)
    assert json_response(conn, 200)["data"] == %{"id" => opinion.id,
      "name" => opinion.name,
      "like" => opinion.like,
      "category_id" => opinion.category_id}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, opinion_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, opinion_path(conn, :create), opinion: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Opinion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, opinion_path(conn, :create), opinion: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    opinion = Repo.insert! %Opinion{}
    conn = put conn, opinion_path(conn, :update, opinion), opinion: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Opinion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    opinion = Repo.insert! %Opinion{}
    conn = put conn, opinion_path(conn, :update, opinion), opinion: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    opinion = Repo.insert! %Opinion{}
    conn = delete conn, opinion_path(conn, :delete, opinion)
    assert response(conn, 204)
    refute Repo.get(Opinion, opinion.id)
  end
end
