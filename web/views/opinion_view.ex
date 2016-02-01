defmodule ThingsWeLike.OpinionView do
  use ThingsWeLike.Web, :view

  def render("index.json", %{opinions: opinions}) do
    %{data: render_many(opinions, ThingsWeLike.OpinionView, "opinion.json")}
  end

  def render("show.json", %{opinion: opinion}) do
    %{data: render_one(opinion, ThingsWeLike.OpinionView, "opinion.json")}
  end

  def render("opinion.json", %{opinion: opinion}) do
    %{id: opinion.id,
      name: opinion.name,
      like: opinion.like,
      category_id: opinion.category_id}
  end
end
