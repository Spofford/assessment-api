defmodule PhoenixChatbot.Assessment.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.Assessment.Order


  schema "orders" do
    field :order, :string
    field :survey_id, :string

    timestamps()
  end

  @doc false
  def changeset(%Order{} = order, attrs) do
    order
    |> cast(attrs, [:survey_id, :order])
    |> validate_required([:survey_id, :order])
  end
end
