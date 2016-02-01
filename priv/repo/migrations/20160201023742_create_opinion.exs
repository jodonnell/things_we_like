defmodule ThingsWeLike.Repo.Migrations.CreateOpinion do
  use Ecto.Migration

  def change do
    create table(:opinions) do
      add :name, :string
      add :like, :boolean, default: false
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps
    end
    create index(:opinions, [:category_id])

  end
end
