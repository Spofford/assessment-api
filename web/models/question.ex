defmodule PhoenixChatbot.Question do
  use PhoenixChatbot.Web, :model
  # alias PhoenixChatbot.Order

  schema "questions" do
    field :text, :string
    field :order, :integer
    belongs_to :question_type, PhoenixChatbot.QuestionType
    has_many :response_choices, PhoenixChatbot.ResponseChoice

    timestamps()
  end

  @required_fields ~w(text)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:order)
    |> cast_assoc(:question_type)
    |> cast_assoc(:response_choices)
    |> cast_assoc(:responses)
  end

end
