defmodule PhoenixChatbot.SurveyResponse do
  use PhoenixChatbot.Web, :model

  @derive {Poison.Encoder, only: [:id, :completed_at]}
  schema "survey_responses" do
    field :completed_at, :utc_datetime
    # belongs_to :survey, PhoenixChatbot.Survey
    has_many :responses, PhoenixChatbot.Response
    belongs_to :user, PhoenixChatbot.User

    timestamps()
  end

  @required_fields ~w()
  @optional_fields ~w(completed_at)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:user, required: true)
    |> cast_assoc(:survey, required: true)
  end

end
