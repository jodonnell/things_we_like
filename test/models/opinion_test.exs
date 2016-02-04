defmodule ThingsWeLike.OpinionTest do
  use ThingsWeLike.ModelCase

  alias ThingsWeLike.Opinion

  @valid_attrs %{like: true, name: "some content", category_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Opinion.changeset(%Opinion{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Opinion.changeset(%Opinion{}, @invalid_attrs)
    refute changeset.valid?
  end
end
