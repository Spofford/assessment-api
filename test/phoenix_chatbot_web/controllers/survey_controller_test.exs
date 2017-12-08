defmodule PhoenixChatbotWeb.SurveyControllerTest do
  use PhoenixChatbotWeb.ConnCase

  alias PhoenixChatbot.Assessment
  alias PhoenixChatbot.Assessment.Survey

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:survey) do
    {:ok, survey} = Assessment.create_survey(@create_attrs)
    survey
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all surveys", %{conn: conn} do
      conn = get conn, survey_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create survey" do
    test "renders survey when data is valid", %{conn: conn} do
      conn = post conn, survey_path(conn, :create), survey: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, survey_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, survey_path(conn, :create), survey: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update survey" do
    setup [:create_survey]

    test "renders survey when data is valid", %{conn: conn, survey: %Survey{id: id} = survey} do
      conn = put conn, survey_path(conn, :update, survey), survey: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, survey_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, survey: survey} do
      conn = put conn, survey_path(conn, :update, survey), survey: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete survey" do
    setup [:create_survey]

    test "deletes chosen survey", %{conn: conn, survey: survey} do
      conn = delete conn, survey_path(conn, :delete, survey)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, survey_path(conn, :show, survey)
      end
    end
  end

  defp create_survey(_) do
    survey = fixture(:survey)
    {:ok, survey: survey}
  end
end
