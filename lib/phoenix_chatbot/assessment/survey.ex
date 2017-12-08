defmodule PhoenixChatbot.Assessment.Survey do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.Assessment.Survey


  schema "surveys" do

    timestamps()
  end

  @doc false
  def changeset(%Survey{} = survey, attrs) do
    survey
    |> cast(attrs, [])
    |> validate_required([])
  end
end
