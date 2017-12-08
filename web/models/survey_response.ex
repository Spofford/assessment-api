defmodule PhoenixChatbot.SurveyResponse do
  use PhoenixChatbot.Web, :model

  schema "survey_responses" do
    field :completed_at, :utc_datetime
    belongs_to :survey, PhoenixChatbot.Survey
    has_many :responses, PhoenixChatbot.Response
    belongs_to :user, PhoenixChatbot.User

    timestamps()
  end

  @required_fields ~w(completed_at)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:responses)
    |> cast_assoc(:survey)
    |> cast_assoc(:user)
  end

end
