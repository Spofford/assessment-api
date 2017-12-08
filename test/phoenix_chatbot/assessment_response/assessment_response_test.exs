defmodule PhoenixChatbot.AssessmentResponseTest do
  use PhoenixChatbot.DataCase

  alias PhoenixChatbot.AssessmentResponse

  describe "survey_responses" do
    alias PhoenixChatbot.AssessmentResponse.SurveyResponse

    @valid_attrs %{completed_at: ~N[2010-04-17 14:00:00.000000], respondent_id: "some respondent_id", survey_id: "some survey_id"}
    @update_attrs %{completed_at: ~N[2011-05-18 15:01:01.000000], respondent_id: "some updated respondent_id", survey_id: "some updated survey_id"}
    @invalid_attrs %{completed_at: nil, respondent_id: nil, survey_id: nil}

    def survey_response_fixture(attrs \\ %{}) do
      {:ok, survey_response} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AssessmentResponse.create_survey_response()

      survey_response
    end

    test "list_survey_responses/0 returns all survey_responses" do
      survey_response = survey_response_fixture()
      assert AssessmentResponse.list_survey_responses() == [survey_response]
    end

    test "get_survey_response!/1 returns the survey_response with given id" do
      survey_response = survey_response_fixture()
      assert AssessmentResponse.get_survey_response!(survey_response.id) == survey_response
    end

    test "create_survey_response/1 with valid data creates a survey_response" do
      assert {:ok, %SurveyResponse{} = survey_response} = AssessmentResponse.create_survey_response(@valid_attrs)
      assert survey_response.completed_at == ~N[2010-04-17 14:00:00.000000]
      assert survey_response.respondent_id == "some respondent_id"
      assert survey_response.survey_id == "some survey_id"
    end

    test "create_survey_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AssessmentResponse.create_survey_response(@invalid_attrs)
    end

    test "update_survey_response/2 with valid data updates the survey_response" do
      survey_response = survey_response_fixture()
      assert {:ok, survey_response} = AssessmentResponse.update_survey_response(survey_response, @update_attrs)
      assert %SurveyResponse{} = survey_response
      assert survey_response.completed_at == ~N[2011-05-18 15:01:01.000000]
      assert survey_response.respondent_id == "some updated respondent_id"
      assert survey_response.survey_id == "some updated survey_id"
    end

    test "update_survey_response/2 with invalid data returns error changeset" do
      survey_response = survey_response_fixture()
      assert {:error, %Ecto.Changeset{}} = AssessmentResponse.update_survey_response(survey_response, @invalid_attrs)
      assert survey_response == AssessmentResponse.get_survey_response!(survey_response.id)
    end

    test "delete_survey_response/1 deletes the survey_response" do
      survey_response = survey_response_fixture()
      assert {:ok, %SurveyResponse{}} = AssessmentResponse.delete_survey_response(survey_response)
      assert_raise Ecto.NoResultsError, fn -> AssessmentResponse.get_survey_response!(survey_response.id) end
    end

    test "change_survey_response/1 returns a survey_response changeset" do
      survey_response = survey_response_fixture()
      assert %Ecto.Changeset{} = AssessmentResponse.change_survey_response(survey_response)
    end
  end

  describe "responses" do
    alias PhoenixChatbot.AssessmentResponse.Response

    @valid_attrs %{question_id: "some question_id", respondent_id: "some respondent_id", response_choice_id: "some response_choice_id", survey_response: "some survey_response"}
    @update_attrs %{question_id: "some updated question_id", respondent_id: "some updated respondent_id", response_choice_id: "some updated response_choice_id", survey_response: "some updated survey_response"}
    @invalid_attrs %{question_id: nil, respondent_id: nil, response_choice_id: nil, survey_response: nil}

    def response_fixture(attrs \\ %{}) do
      {:ok, response} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AssessmentResponse.create_response()

      response
    end

    test "list_responses/0 returns all responses" do
      response = response_fixture()
      assert AssessmentResponse.list_responses() == [response]
    end

    test "get_response!/1 returns the response with given id" do
      response = response_fixture()
      assert AssessmentResponse.get_response!(response.id) == response
    end

    test "create_response/1 with valid data creates a response" do
      assert {:ok, %Response{} = response} = AssessmentResponse.create_response(@valid_attrs)
      assert response.question_id == "some question_id"
      assert response.respondent_id == "some respondent_id"
      assert response.response_choice_id == "some response_choice_id"
      assert response.survey_response == "some survey_response"
    end

    test "create_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AssessmentResponse.create_response(@invalid_attrs)
    end

    test "update_response/2 with valid data updates the response" do
      response = response_fixture()
      assert {:ok, response} = AssessmentResponse.update_response(response, @update_attrs)
      assert %Response{} = response
      assert response.question_id == "some updated question_id"
      assert response.respondent_id == "some updated respondent_id"
      assert response.response_choice_id == "some updated response_choice_id"
      assert response.survey_response == "some updated survey_response"
    end

    test "update_response/2 with invalid data returns error changeset" do
      response = response_fixture()
      assert {:error, %Ecto.Changeset{}} = AssessmentResponse.update_response(response, @invalid_attrs)
      assert response == AssessmentResponse.get_response!(response.id)
    end

    test "delete_response/1 deletes the response" do
      response = response_fixture()
      assert {:ok, %Response{}} = AssessmentResponse.delete_response(response)
      assert_raise Ecto.NoResultsError, fn -> AssessmentResponse.get_response!(response.id) end
    end

    test "change_response/1 returns a response changeset" do
      response = response_fixture()
      assert %Ecto.Changeset{} = AssessmentResponse.change_response(response)
    end
  end
end
