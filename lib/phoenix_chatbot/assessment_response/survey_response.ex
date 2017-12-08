defmodule PhoenixChatbot.AssessmentResponse.SurveyResponse do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.AssessmentResponse.SurveyResponse


  schema "survey_responses" do
    field :completed_at, :naive_datetime
    field :respondent_id, :string
    field :survey_id, :string

    timestamps()
  end

  @doc false
  def changeset(%SurveyResponse{} = survey_response, attrs) do
    survey_response
    |> cast(attrs, [:survey_id, :respondent_id, :completed_at])
    |> validate_required([:survey_id, :respondent_id, :completed_at])
  end
end
