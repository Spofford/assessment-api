defmodule PhoenixChatbot.QuestionType do
  use PhoenixChatbot.Web, :model

  schema "question_types" do
    field :name, :string
    belongs_to :question, PhoenixChatbot.Question

    timestamps()
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:question)
  end

end
