defmodule PhoenixChatbot.QuestionSets.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.QuestionSets.Question


  schema "question" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
