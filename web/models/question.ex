defmodule PhoenixChatbot.Question do
  use PhoenixChatbot.Web, :model

  schema "questions" do
    field :text, :string
    has_many :orders, PhoenixChatbot.Order
    has_many :question_types, PhoenixChatbot.QuestionType
    has_many :response_choices, PhoenixChatbot.ResponseChoice
    has_many :responses, PhoenixChatbot.Responses

    timestamps()
  end

  @required_fields ~w(text)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:orders)
    |> cast_assoc(:question_types)
    |> cast_assoc(:response_choices)
    |> cast_assoc(:responses)
  end

end
