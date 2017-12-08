defmodule PhoenixChatbot.QuestionSets.ResponseChoice do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.QuestionSets.ResponseChoice


  schema "response_choices" do
    field :question_id, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(%ResponseChoice{} = response_choice, attrs) do
    response_choice
    |> cast(attrs, [:question_id, :text])
    |> validate_required([:question_id, :text])
  end
end
