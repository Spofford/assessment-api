defmodule PhoenixChatbotWeb.QuestionOrderControllerTest do
  use PhoenixChatbotWeb.ConnCase

  alias PhoenixChatbot.Assessment
  alias PhoenixChatbot.Assessment.QuestionOrder

  @create_attrs %{order: 42, question_id: "some question_id", test_id: "some test_id"}
  @update_attrs %{order: 43, question_id: "some updated question_id", test_id: "some updated test_id"}
  @invalid_attrs %{order: nil, question_id: nil, test_id: nil}

  def fixture(:question_order) do
    {:ok, question_order} = Assessment.create_question_order(@create_attrs)
    question_order
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all orders", %{conn: conn} do
      conn = get conn, question_order_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create question_order" do
    test "renders question_order when data is valid", %{conn: conn} do
      conn = post conn, question_order_path(conn, :create), question_order: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, question_order_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "order" => 42,
        "question_id" => "some question_id",
        "test_id" => "some test_id"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, question_order_path(conn, :create), question_order: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update question_order" do
    setup [:create_question_order]

    test "renders question_order when data is valid", %{conn: conn, question_order: %QuestionOrder{id: id} = question_order} do
      conn = put conn, question_order_path(conn, :update, question_order), question_order: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, question_order_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "order" => 43,
        "question_id" => "some updated question_id",
        "test_id" => "some updated test_id"}
    end

    test "renders errors when data is invalid", %{conn: conn, question_order: question_order} do
      conn = put conn, question_order_path(conn, :update, question_order), question_order: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete question_order" do
    setup [:create_question_order]

    test "deletes chosen question_order", %{conn: conn, question_order: question_order} do
      conn = delete conn, question_order_path(conn, :delete, question_order)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, question_order_path(conn, :show, question_order)
      end
    end
  end

  defp create_question_order(_) do
    question_order = fixture(:question_order)
    {:ok, question_order: question_order}
  end
end
