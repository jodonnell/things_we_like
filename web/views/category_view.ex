defmodule ThingsWeLike.CategoryView do
  use ThingsWeLike.Web, :view

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, ThingsWeLike.CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, ThingsWeLike.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      name: category.name}
  end
end
