defmodule PhoenixChatbotWeb.SurveyResponseControllerTest do
  use PhoenixChatbotWeb.ConnCase

  alias PhoenixChatbot.AssessmentResponse
  alias PhoenixChatbot.AssessmentResponse.SurveyResponse

  @create_attrs %{completed_at: ~N[2010-04-17 14:00:00.000000], respondent_id: "some respondent_id", survey_id: "some survey_id"}
  @update_attrs %{completed_at: ~N[2011-05-18 15:01:01.000000], respondent_id: "some updated respondent_id", survey_id: "some updated survey_id"}
  @invalid_attrs %{completed_at: nil, respondent_id: nil, survey_id: nil}

  def fixture(:survey_response) do
    {:ok, survey_response} = AssessmentResponse.create_survey_response(@create_attrs)
    survey_response
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all survey_responses", %{conn: conn} do
      conn = get conn, survey_response_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create survey_response" do
    test "renders survey_response when data is valid", %{conn: conn} do
      conn = post conn, survey_response_path(conn, :create), survey_response: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, survey_response_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "completed_at" => ~N[2010-04-17 14:00:00.000000],
        "respondent_id" => "some respondent_id",
        "survey_id" => "some survey_id"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, survey_response_path(conn, :create), survey_response: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update survey_response" do
    setup [:create_survey_response]

    test "renders survey_response when data is valid", %{conn: conn, survey_response: %SurveyResponse{id: id} = survey_response} do
      conn = put conn, survey_response_path(conn, :update, survey_response), survey_response: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, survey_response_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "completed_at" => ~N[2011-05-18 15:01:01.000000],
        "respondent_id" => "some updated respondent_id",
        "survey_id" => "some updated survey_id"}
    end

    test "renders errors when data is invalid", %{conn: conn, survey_response: survey_response} do
      conn = put conn, survey_response_path(conn, :update, survey_response), survey_response: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete survey_response" do
    setup [:create_survey_response]

    test "deletes chosen survey_response", %{conn: conn, survey_response: survey_response} do
      conn = delete conn, survey_response_path(conn, :delete, survey_response)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, survey_response_path(conn, :show, survey_response)
      end
    end
  end

  defp create_survey_response(_) do
    survey_response = fixture(:survey_response)
    {:ok, survey_response: survey_response}
  end
end
