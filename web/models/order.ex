defmodule PhoenixChatbot.Order do
  use PhoenixChatbot.Web, :model

  schema "orders" do
    field :order, :integer
    belongs_to :question, PhoenixChatbot.Question
    belongs_to :survey, PhoenixChatbot.Survey

    timestamps()
  end

  @required_fields ~w(order)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:question)
    |> cast_assoc(:survey)
  end

end
