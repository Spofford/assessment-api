defmodule PhoenixChatbot.Survey do
  use PhoenixChatbot.Web, :model

  schema "surveys" do
    field :version, :integer
    has_many :orders, PhoenixChatbot.Order
    has_many :survey_responses, PhoenixChatbot.SurveyResponse

    timestamps()
  end

  @required_fields ~w(version)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:orders)
    |> cast_assoc(:survey_responses)
  end

end
