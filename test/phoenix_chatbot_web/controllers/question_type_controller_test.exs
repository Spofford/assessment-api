defmodule PhoenixChatbotWeb.QuestionTypeControllerTest do
  use PhoenixChatbotWeb.ConnCase

  alias PhoenixChatbot.QuestionSets
  alias PhoenixChatbot.QuestionSets.QuestionType

  @create_attrs %{name: "some name", question_id: "some question_id"}
  @update_attrs %{name: "some updated name", question_id: "some updated question_id"}
  @invalid_attrs %{name: nil, question_id: nil}

  def fixture(:question_type) do
    {:ok, question_type} = QuestionSets.create_question_type(@create_attrs)
    question_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all question_types", %{conn: conn} do
      conn = get conn, question_type_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create question_type" do
    test "renders question_type when data is valid", %{conn: conn} do
      conn = post conn, question_type_path(conn, :create), question_type: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, question_type_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name",
        "question_id" => "some question_id"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, question_type_path(conn, :create), question_type: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update question_type" do
    setup [:create_question_type]

    test "renders question_type when data is valid", %{conn: conn, question_type: %QuestionType{id: id} = question_type} do
      conn = put conn, question_type_path(conn, :update, question_type), question_type: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, question_type_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name",
        "question_id" => "some updated question_id"}
    end

    test "renders errors when data is invalid", %{conn: conn, question_type: question_type} do
      conn = put conn, question_type_path(conn, :update, question_type), question_type: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete question_type" do
    setup [:create_question_type]

    test "deletes chosen question_type", %{conn: conn, question_type: question_type} do
      conn = delete conn, question_type_path(conn, :delete, question_type)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, question_type_path(conn, :show, question_type)
      end
    end
  end

  defp create_question_type(_) do
    question_type = fixture(:question_type)
    {:ok, question_type: question_type}
  end
end
