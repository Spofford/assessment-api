defmodule PhoenixChatbot.ResponseController do
  use PhoenixChatbot.Web, :controller

  alias PhoenixChatbot.Response

  def create(conn, %{"response" => response_params}) do
    changeset = Response.changeset(%Response{}, response_params)

    case Repo.insert(changeset) do
      {:ok, response} ->

        conn
        |> put_status(:created)
        |> render("show.json", response: response)
      {:error, changeset} ->

        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    response = Repo.get!(Response, id)
    render(conn, "show.json", response: response)
  end

  def delete(conn, %{"id" => id}) do
    response = Repo.get!(Response, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(response)

    send_resp(conn, :no_content, "")
  end
end
