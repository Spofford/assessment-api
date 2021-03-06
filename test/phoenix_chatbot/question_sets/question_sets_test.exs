defmodule PhoenixChatbot.QuestionSetsTest do
  use PhoenixChatbot.DataCase

  alias PhoenixChatbot.QuestionSets

  describe "question" do
    alias PhoenixChatbot.QuestionSets.Question

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> QuestionSets.create_question()

      question
    end

    test "list_question/0 returns all question" do
      question = question_fixture()
      assert QuestionSets.list_question() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert QuestionSets.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = QuestionSets.create_question(@valid_attrs)
      assert question.text == "some text"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QuestionSets.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, question} = QuestionSets.update_question(question, @update_attrs)
      assert %Question{} = question
      assert question.text == "some updated text"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = QuestionSets.update_question(question, @invalid_attrs)
      assert question == QuestionSets.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = QuestionSets.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> QuestionSets.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = QuestionSets.change_question(question)
    end
  end

  describe "question_types" do
    alias PhoenixChatbot.QuestionSets.QuestionType

    @valid_attrs %{name: "some name", question_id: "some question_id"}
    @update_attrs %{name: "some updated name", question_id: "some updated question_id"}
    @invalid_attrs %{name: nil, question_id: nil}

    def question_type_fixture(attrs \\ %{}) do
      {:ok, question_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> QuestionSets.create_question_type()

      question_type
    end

    test "list_question_types/0 returns all question_types" do
      question_type = question_type_fixture()
      assert QuestionSets.list_question_types() == [question_type]
    end

    test "get_question_type!/1 returns the question_type with given id" do
      question_type = question_type_fixture()
      assert QuestionSets.get_question_type!(question_type.id) == question_type
    end

    test "create_question_type/1 with valid data creates a question_type" do
      assert {:ok, %QuestionType{} = question_type} = QuestionSets.create_question_type(@valid_attrs)
      assert question_type.name == "some name"
      assert question_type.question_id == "some question_id"
    end

    test "create_question_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QuestionSets.create_question_type(@invalid_attrs)
    end

    test "update_question_type/2 with valid data updates the question_type" do
      question_type = question_type_fixture()
      assert {:ok, question_type} = QuestionSets.update_question_type(question_type, @update_attrs)
      assert %QuestionType{} = question_type
      assert question_type.name == "some updated name"
      assert question_type.question_id == "some updated question_id"
    end

    test "update_question_type/2 with invalid data returns error changeset" do
      question_type = question_type_fixture()
      assert {:error, %Ecto.Changeset{}} = QuestionSets.update_question_type(question_type, @invalid_attrs)
      assert question_type == QuestionSets.get_question_type!(question_type.id)
    end

    test "delete_question_type/1 deletes the question_type" do
      question_type = question_type_fixture()
      assert {:ok, %QuestionType{}} = QuestionSets.delete_question_type(question_type)
      assert_raise Ecto.NoResultsError, fn -> QuestionSets.get_question_type!(question_type.id) end
    end

    test "change_question_type/1 returns a question_type changeset" do
      question_type = question_type_fixture()
      assert %Ecto.Changeset{} = QuestionSets.change_question_type(question_type)
    end
  end

  describe "response_choices" do
    alias PhoenixChatbot.QuestionSets.ResponseChoice

    @valid_attrs %{question_id: "some question_id", text: "some text"}
    @update_attrs %{question_id: "some updated question_id", text: "some updated text"}
    @invalid_attrs %{question_id: nil, text: nil}

    def response_choice_fixture(attrs \\ %{}) do
      {:ok, response_choice} =
        attrs
        |> Enum.into(@valid_attrs)
        |> QuestionSets.create_response_choice()

      response_choice
    end

    test "list_response_choices/0 returns all response_choices" do
      response_choice = response_choice_fixture()
      assert QuestionSets.list_response_choices() == [response_choice]
    end

    test "get_response_choice!/1 returns the response_choice with given id" do
      response_choice = response_choice_fixture()
      assert QuestionSets.get_response_choice!(response_choice.id) == response_choice
    end

    test "create_response_choice/1 with valid data creates a response_choice" do
      assert {:ok, %ResponseChoice{} = response_choice} = QuestionSets.create_response_choice(@valid_attrs)
      assert response_choice.question_id == "some question_id"
      assert response_choice.text == "some text"
    end

    test "create_response_choice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QuestionSets.create_response_choice(@invalid_attrs)
    end

    test "update_response_choice/2 with valid data updates the response_choice" do
      response_choice = response_choice_fixture()
      assert {:ok, response_choice} = QuestionSets.update_response_choice(response_choice, @update_attrs)
      assert %ResponseChoice{} = response_choice
      assert response_choice.question_id == "some updated question_id"
      assert response_choice.text == "some updated text"
    end

    test "update_response_choice/2 with invalid data returns error changeset" do
      response_choice = response_choice_fixture()
      assert {:error, %Ecto.Changeset{}} = QuestionSets.update_response_choice(response_choice, @invalid_attrs)
      assert response_choice == QuestionSets.get_response_choice!(response_choice.id)
    end

    test "delete_response_choice/1 deletes the response_choice" do
      response_choice = response_choice_fixture()
      assert {:ok, %ResponseChoice{}} = QuestionSets.delete_response_choice(response_choice)
      assert_raise Ecto.NoResultsError, fn -> QuestionSets.get_response_choice!(response_choice.id) end
    end

    test "change_response_choice/1 returns a response_choice changeset" do
      response_choice = response_choice_fixture()
      assert %Ecto.Changeset{} = QuestionSets.change_response_choice(response_choice)
    end
  end
end
