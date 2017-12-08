defmodule PhoenixChatbot.ResponseChoiceController do
  use PhoenixChatbot.Web, :controller

  alias PhoenixChatbot.ResponseChoice

  def create(conn, %{"response_choice" => response_choice_params}) do
    changeset = ResponseChoice.changeset(%ResponseChoice{}, response_choice_params)

    case Repo.insert(changeset) do
      {:ok, response_choice} ->

        conn
        |> put_status(:created)
        |> render("show.json", response_choice: response_choice)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    response_choice = Repo.get!(ResponseChoice, id)
    render(conn, "show.json", response_choice: response_choice)
  end

  def update(conn, %{"id" => id, "response_choice" => response_choice_params}) do
    response_choice = Repo.get!(ResponseChoice, id)
    changeset = ResponseChoice.changeset(response_choice, response_choice_params)

    case Repo.update(changeset) do
      {:ok, response_choice} ->
        render(conn, "show.json", response_choice: response_choice)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    response_choice = Repo.get!(ResponseChoice, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(response_choice)

    send_resp(conn, :no_content, "")
  end
end
