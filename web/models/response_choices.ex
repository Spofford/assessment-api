defmodule PhoenixChatbot.ResponseChoice do
  use PhoenixChatbot.Web, :model

  schema "response_choices" do
    belongs_to :question, PhoenixChatbot.Question
    has_many :responses, PhoenixChatbot.Response
    field :text, :string

    timestamps()
  end

  @required_fields ~w(text)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:question)
  end

end
