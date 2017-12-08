defmodule PhoenixChatbotWeb.ResponseChoiceControllerTest do
  use PhoenixChatbotWeb.ConnCase

  alias PhoenixChatbot.QuestionSets
  alias PhoenixChatbot.QuestionSets.ResponseChoice

  @create_attrs %{question_id: "some question_id", text: "some text"}
  @update_attrs %{question_id: "some updated question_id", text: "some updated text"}
  @invalid_attrs %{question_id: nil, text: nil}

  def fixture(:response_choice) do
    {:ok, response_choice} = QuestionSets.create_response_choice(@create_attrs)
    response_choice
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all response_choices", %{conn: conn} do
      conn = get conn, response_choice_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create response_choice" do
    test "renders response_choice when data is valid", %{conn: conn} do
      conn = post conn, response_choice_path(conn, :create), response_choice: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, response_choice_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "question_id" => "some question_id",
        "text" => "some text"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, response_choice_path(conn, :create), response_choice: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update response_choice" do
    setup [:create_response_choice]

    test "renders response_choice when data is valid", %{conn: conn, response_choice: %ResponseChoice{id: id} = response_choice} do
      conn = put conn, response_choice_path(conn, :update, response_choice), response_choice: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, response_choice_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "question_id" => "some updated question_id",
        "text" => "some updated text"}
    end

    test "renders errors when data is invalid", %{conn: conn, response_choice: response_choice} do
      conn = put conn, response_choice_path(conn, :update, response_choice), response_choice: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete response_choice" do
    setup [:create_response_choice]

    test "deletes chosen response_choice", %{conn: conn, response_choice: response_choice} do
      conn = delete conn, response_choice_path(conn, :delete, response_choice)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, response_choice_path(conn, :show, response_choice)
      end
    end
  end

  defp create_response_choice(_) do
    response_choice = fixture(:response_choice)
    {:ok, response_choice: response_choice}
  end
end
