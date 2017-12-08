defmodule PhoenixChatbotWeb.ResponseControllerTest do
  use PhoenixChatbotWeb.ConnCase

  alias PhoenixChatbot.AssessmentResponse
  alias PhoenixChatbot.AssessmentResponse.Response

  @create_attrs %{question_id: "some question_id", respondent_id: "some respondent_id", response_choice_id: "some response_choice_id", survey_response: "some survey_response"}
  @update_attrs %{question_id: "some updated question_id", respondent_id: "some updated respondent_id", response_choice_id: "some updated response_choice_id", survey_response: "some updated survey_response"}
  @invalid_attrs %{question_id: nil, respondent_id: nil, response_choice_id: nil, survey_response: nil}

  def fixture(:response) do
    {:ok, response} = AssessmentResponse.create_response(@create_attrs)
    response
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all responses", %{conn: conn} do
      conn = get conn, response_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create response" do
    test "renders response when data is valid", %{conn: conn} do
      conn = post conn, response_path(conn, :create), response: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, response_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "question_id" => "some question_id",
        "respondent_id" => "some respondent_id",
        "response_choice_id" => "some response_choice_id",
        "survey_response" => "some survey_response"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, response_path(conn, :create), response: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update response" do
    setup [:create_response]

    test "renders response when data is valid", %{conn: conn, response: %Response{id: id} = response} do
      conn = put conn, response_path(conn, :update, response), response: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, response_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "question_id" => "some updated question_id",
        "respondent_id" => "some updated respondent_id",
        "response_choice_id" => "some updated response_choice_id",
        "survey_response" => "some updated survey_response"}
    end

    test "renders errors when data is invalid", %{conn: conn, response: response} do
      conn = put conn, response_path(conn, :update, response), response: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete response" do
    setup [:create_response]

    test "deletes chosen response", %{conn: conn, response: response} do
      conn = delete conn, response_path(conn, :delete, response)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, response_path(conn, :show, response)
      end
    end
  end

  defp create_response(_) do
    response = fixture(:response)
    {:ok, response: response}
  end
end
