defmodule PhoenixChatbot.Survey do
  use PhoenixChatbot.Web, :model
  alias PhoenixChatbot.Repo
  alias PhoenixChatbot.Survey
  import Ecto.Query

  schema "surveys" do
    field :version, :integer
    has_many :orders, PhoenixChatbot.Order
    has_many :survey_responses, PhoenixChatbot.SurveyResponse

    timestamps()
  end

  @required_fields ~w(version)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
  
end
