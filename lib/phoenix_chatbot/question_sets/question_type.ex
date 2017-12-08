defmodule PhoenixChatbot.QuestionSets.QuestionType do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.QuestionSets.QuestionType


  schema "question_types" do
    field :name, :string
    field :question_id, :string

    timestamps()
  end

  @doc false
  def changeset(%QuestionType{} = question_type, attrs) do
    question_type
    |> cast(attrs, [:question_id, :name])
    |> validate_required([:question_id, :name])
  end
end
