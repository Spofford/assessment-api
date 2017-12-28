# defmodule PhoenixChatbot.SurveyResponseController do
#  use PhoenixChatbot.Web, :controller

#  alias PhoenixChatbot.SurveyResponse

#  def create(conn, %{"survey_response" => survey_response_params}) do
#    changeset = SurveyResponse.changeset(%SurveyResponse{}, survey_response_params)

#    case Repo.insert(changeset) do
#      {:ok, survey_response} ->

#        conn
#        |> put_status(:created)
#        |> render("show.json", survey_response: survey_response)
#      {:error, changeset} ->
#        conn
#        |> put_status(:unprocessable_entity)
#        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
#    end
#  end

#  def show(conn, %{"id" => id}) do
#    survey_response = Repo.get!(SurveyResponse, id)
#    render(conn, "show.json", survey_response: survey_response)
#  end

#  def update(conn, %{"id" => id, "survey_response" => survey_response_params}) do
#    survey_response = Repo.get!(SurveyResponse, id)
#    changeset = SurveyResponse.changeset(survey_response, survey_response_params)

#    case Repo.update(changeset) do
#      {:ok, survey_response} ->
#        render(conn, "show.json", survey_response: survey_response)
#      {:error, changeset} ->
#        conn
#        |> put_status(:unprocessable_entity)
#        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
#    end
#  end

#  def delete(conn, %{"id" => id}) do
#    survey_response = Repo.get!(SurveyResponse, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
#    Repo.delete!(survey_response)

#    send_resp(conn, :no_content, "")
#  end
# end
