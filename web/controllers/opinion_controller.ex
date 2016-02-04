defmodule ThingsWeLike.OpinionController do
  use ThingsWeLike.Web, :controller

  alias ThingsWeLike.Opinion
  alias ThingsWeLike.Category

  plug :scrub_params, "opinion" when action in [:create, :update]

  import Ecto.Query, only: [from: 2]

  def index(conn, params) do
    opinions = if Map.has_key? params, "category" do
      filtered_opinions(params["category"])
    else
      Repo.all(Opinion)
    end

    render(conn, "index.json", opinions: opinions)
  end

  def create(conn, params) do
    category_id = get_category_id_by_name(params["category"])
    opinion_params = Map.merge params["opinion"], %{"category_id" => category_id}
    changeset = Opinion.changeset(%Opinion{}, opinion_params)

    case Repo.insert(changeset) do
      {:ok, opinion} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", opinion_path(conn, :show, opinion))
        |> render("show.json", opinion: opinion)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ThingsWeLike.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    opinion = Repo.get!(Opinion, id)
    render(conn, "show.json", opinion: opinion)
  end

  def delete(conn, %{"id" => id}) do
    opinion = Repo.get!(Opinion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(opinion)

    send_resp(conn, :no_content, "")
  end

  defp get_category_id_by_name(name) do
    Repo.get_by!(Category, name: name).id
  end

  defp filtered_opinions(category) do
    category_id = get_category_id_by_name(category)

    query = from o in Opinion, where: o.category_id == ^category_id
    Repo.all(query)
  end

end
