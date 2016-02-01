defmodule ThingsWeLike.Opinion do
  use ThingsWeLike.Web, :model

  schema "opinions" do
    field :name, :string
    field :like, :boolean, default: false
    belongs_to :category, ThingsWeLike.Category

    timestamps
  end

  @required_fields ~w(name like)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
