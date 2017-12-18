defmodule PhoenixChatbot.Question do
  use PhoenixChatbot.Web, :model
  alias PhoenixChatbot.Repo
  alias PhoenixChatbot.Order

  schema "questions" do
    field :text, :string
    has_one :order, PhoenixChatbot.Order
    has_one :question_type, PhoenixChatbot.QuestionType
    has_many :response_choices, PhoenixChatbot.ResponseChoice
    # has_many :responses, PhoenixChatbot.Response

    timestamps()
  end

  @required_fields ~w(text)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:orders)
    |> cast_assoc(:question_types)
    |> cast_assoc(:response_choices)
    |> cast_assoc(:responses)
  end

  def next_question(order_param) do
    orders = Order.current_orders

    order = Repo.get_by(orders, order: order_param)

    Repo.one(Ecto.assoc(order, :question))
  end

end
