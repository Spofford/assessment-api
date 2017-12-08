defmodule PhoenixChatbot.AssessmentTest do
  use PhoenixChatbot.DataCase

  alias PhoenixChatbot.Assessment

  describe "tests" do
    alias PhoenixChatbot.Assessment.Test

    @valid_attrs %{completed_at: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{completed_at: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{completed_at: nil}

    def test_fixture(attrs \\ %{}) do
      {:ok, test} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assessment.create_test()

      test
    end

    test "list_tests/0 returns all tests" do
      test = test_fixture()
      assert Assessment.list_tests() == [test]
    end

    test "get_test!/1 returns the test with given id" do
      test = test_fixture()
      assert Assessment.get_test!(test.id) == test
    end

    test "create_test/1 with valid data creates a test" do
      assert {:ok, %Test{} = test} = Assessment.create_test(@valid_attrs)
      assert test.completed_at == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_test/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assessment.create_test(@invalid_attrs)
    end

    test "update_test/2 with valid data updates the test" do
      test = test_fixture()
      assert {:ok, test} = Assessment.update_test(test, @update_attrs)
      assert %Test{} = test
      assert test.completed_at == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_test/2 with invalid data returns error changeset" do
      test = test_fixture()
      assert {:error, %Ecto.Changeset{}} = Assessment.update_test(test, @invalid_attrs)
      assert test == Assessment.get_test!(test.id)
    end

    test "delete_test/1 deletes the test" do
      test = test_fixture()
      assert {:ok, %Test{}} = Assessment.delete_test(test)
      assert_raise Ecto.NoResultsError, fn -> Assessment.get_test!(test.id) end
    end

    test "change_test/1 returns a test changeset" do
      test = test_fixture()
      assert %Ecto.Changeset{} = Assessment.change_test(test)
    end
  end

  describe "orders" do
    alias PhoenixChatbot.Assessment.QuestionOrder

    @valid_attrs %{order: 42, question_id: "some question_id", test_id: "some test_id"}
    @update_attrs %{order: 43, question_id: "some updated question_id", test_id: "some updated test_id"}
    @invalid_attrs %{order: nil, question_id: nil, test_id: nil}

    def question_order_fixture(attrs \\ %{}) do
      {:ok, question_order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assessment.create_question_order()

      question_order
    end

    test "list_orders/0 returns all orders" do
      question_order = question_order_fixture()
      assert Assessment.list_orders() == [question_order]
    end

    test "get_question_order!/1 returns the question_order with given id" do
      question_order = question_order_fixture()
      assert Assessment.get_question_order!(question_order.id) == question_order
    end

    test "create_question_order/1 with valid data creates a question_order" do
      assert {:ok, %QuestionOrder{} = question_order} = Assessment.create_question_order(@valid_attrs)
      assert question_order.order == 42
      assert question_order.question_id == "some question_id"
      assert question_order.test_id == "some test_id"
    end

    test "create_question_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assessment.create_question_order(@invalid_attrs)
    end

    test "update_question_order/2 with valid data updates the question_order" do
      question_order = question_order_fixture()
      assert {:ok, question_order} = Assessment.update_question_order(question_order, @update_attrs)
      assert %QuestionOrder{} = question_order
      assert question_order.order == 43
      assert question_order.question_id == "some updated question_id"
      assert question_order.test_id == "some updated test_id"
    end

    test "update_question_order/2 with invalid data returns error changeset" do
      question_order = question_order_fixture()
      assert {:error, %Ecto.Changeset{}} = Assessment.update_question_order(question_order, @invalid_attrs)
      assert question_order == Assessment.get_question_order!(question_order.id)
    end

    test "delete_question_order/1 deletes the question_order" do
      question_order = question_order_fixture()
      assert {:ok, %QuestionOrder{}} = Assessment.delete_question_order(question_order)
      assert_raise Ecto.NoResultsError, fn -> Assessment.get_question_order!(question_order.id) end
    end

    test "change_question_order/1 returns a question_order changeset" do
      question_order = question_order_fixture()
      assert %Ecto.Changeset{} = Assessment.change_question_order(question_order)
    end
  end

  describe "surveys" do
    alias PhoenixChatbot.Assessment.Survey

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def survey_fixture(attrs \\ %{}) do
      {:ok, survey} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assessment.create_survey()

      survey
    end

    test "list_surveys/0 returns all surveys" do
      survey = survey_fixture()
      assert Assessment.list_surveys() == [survey]
    end

    test "get_survey!/1 returns the survey with given id" do
      survey = survey_fixture()
      assert Assessment.get_survey!(survey.id) == survey
    end

    test "create_survey/1 with valid data creates a survey" do
      assert {:ok, %Survey{} = survey} = Assessment.create_survey(@valid_attrs)
    end

    test "create_survey/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assessment.create_survey(@invalid_attrs)
    end

    test "update_survey/2 with valid data updates the survey" do
      survey = survey_fixture()
      assert {:ok, survey} = Assessment.update_survey(survey, @update_attrs)
      assert %Survey{} = survey
    end

    test "update_survey/2 with invalid data returns error changeset" do
      survey = survey_fixture()
      assert {:error, %Ecto.Changeset{}} = Assessment.update_survey(survey, @invalid_attrs)
      assert survey == Assessment.get_survey!(survey.id)
    end

    test "delete_survey/1 deletes the survey" do
      survey = survey_fixture()
      assert {:ok, %Survey{}} = Assessment.delete_survey(survey)
      assert_raise Ecto.NoResultsError, fn -> Assessment.get_survey!(survey.id) end
    end

    test "change_survey/1 returns a survey changeset" do
      survey = survey_fixture()
      assert %Ecto.Changeset{} = Assessment.change_survey(survey)
    end
  end

  describe "orders" do
    alias PhoenixChatbot.Assessment.Order

    @valid_attrs %{order: "some order", survey_id: "some survey_id"}
    @update_attrs %{order: "some updated order", survey_id: "some updated survey_id"}
    @invalid_attrs %{order: nil, survey_id: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assessment.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Assessment.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Assessment.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Assessment.create_order(@valid_attrs)
      assert order.order == "some order"
      assert order.survey_id == "some survey_id"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assessment.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, order} = Assessment.update_order(order, @update_attrs)
      assert %Order{} = order
      assert order.order == "some updated order"
      assert order.survey_id == "some updated survey_id"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Assessment.update_order(order, @invalid_attrs)
      assert order == Assessment.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Assessment.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Assessment.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Assessment.change_order(order)
    end
  end
end
