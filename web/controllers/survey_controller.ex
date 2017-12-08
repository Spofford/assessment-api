defmodule PhoenixChatbot.SurveyController do
  use PhoenixChatbot.Web, :controller

  alias PhoenixChatbot.Survey

  def create(conn, %{"survey" => survey_params}) do
    changeset = Survey.changeset(%Survey{}, survey_params)

    case Repo.insert(changeset) do
      {:ok, survey} ->

        conn
        |> put_status(:created)
        |> render("show.json", survey: survey)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    survey = Repo.get!(Survey, id)
    render(conn, "show.json", survey: survey)
  end

  def delete(conn, %{"id" => id}) do
    survey = Repo.get!(Survey, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(survey)

    send_resp(conn, :no_content, "")
  end
end
