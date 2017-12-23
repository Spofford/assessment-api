defmodule PhoenixChatbot.Response do
  use PhoenixChatbot.Web, :model

  schema "responses" do
    has_one :response_choice, PhoenixChatbot.ResponseChoice
    has_one :survey_response, PhoenixChatbot.SurveyResponse
    field :text, :string

    timestamps()
  end

  @required_fields ~w()
  @optional_fields ~w(text)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
#    |> cast_assoc(:question)
    |> cast_assoc(:survey_response)
    |> cast_assoc(:response_choice)
#    |> cast_assoc(:user)
  end
end
