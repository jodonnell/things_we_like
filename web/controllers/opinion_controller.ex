defmodule ThingsWeLike.OpinionController do
  use ThingsWeLike.Web, :controller

  alias ThingsWeLike.Opinion

  plug :scrub_params, "opinion" when action in [:create, :update]

  def index(conn, _params) do
    opinions = Repo.all(Opinion)
    render(conn, "index.json", opinions: opinions)
  end

  def create(conn, %{"opinion" => opinion_params}) do
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

  def update(conn, %{"id" => id, "opinion" => opinion_params}) do
    opinion = Repo.get!(Opinion, id)
    changeset = Opinion.changeset(opinion, opinion_params)

    case Repo.update(changeset) do
      {:ok, opinion} ->
        render(conn, "show.json", opinion: opinion)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ThingsWeLike.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    opinion = Repo.get!(Opinion, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(opinion)

    send_resp(conn, :no_content, "")
  end
end
