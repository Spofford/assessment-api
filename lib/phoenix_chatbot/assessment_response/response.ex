defmodule PhoenixChatbot.AssessmentResponse.Response do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixChatbot.AssessmentResponse.Response


  schema "responses" do
    field :question_id, :string
    field :respondent_id, :string
    field :response_choice_id, :string
    # field :survey_response, :string

    timestamps()
  end

  @doc false
  def changeset(%Response{} = response, attrs) do
    response
    |> cast(attrs, [:question_id, :response_choice_id, :respondent_id])
    # |> validate_required([:question_id, :response_choice_id, :respondent_id])
  end
end
