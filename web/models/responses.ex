defmodule PhoenixChatbot.Response do
  use PhoenixChatbot.Web, :model

  schema "responses" do
    belongs_to :question, PhoenixChatbot.Question
    belongs_to :response_choice, PhoenixChatbot.ResponseChoice
    belongs_to :survey_response, PhoenixChatbot.SurveyResponse
    belongs_to :user, PhoenixChatbot.User
    field :text, :string

    timestamps()
  end

  @required_fields ~w()
  @optional_fields ~w(text)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:question)
    |> cast_assoc(:survey_response)
    |> cast_assoc(:user)
  end

end
