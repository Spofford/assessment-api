defmodule PhoenixChatbot.Response do
  use PhoenixChatbot.Web, :model

  @derive {Poison.Encoder, only: [:text, :response_value]}
  schema "responses" do
    has_one :response_choice, PhoenixChatbot.ResponseChoice
    has_one :user, PhoenixChatbot.User
    field :text, :string
    field :response_value, :boolean

    timestamps()
  end

  @required_fields ~w(response_value)
  @optional_fields ~w(text)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:response_choice)
    |> cast_assoc(:user)
  end
end
