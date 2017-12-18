defmodule PhoenixChatbot.Order do
  use PhoenixChatbot.Web, :model

  alias PhoenixChatbot.Survey
  alias PhoenixChatbot.Repo
  import Ecto.Query

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

  def current_orders do
    Ecto.assoc(Survey.current_survey, :orders)
  end

end
