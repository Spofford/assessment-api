defmodule PhoenixChatbot.QuestionType do
  use PhoenixChatbot.Web, :model

  schema "question_types" do
    field :name, :string
    has_many :questions, PhoenixChatbot.Question

    timestamps()
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:questions)
  end

end
