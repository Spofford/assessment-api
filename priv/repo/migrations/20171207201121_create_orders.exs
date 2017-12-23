defmodule PhoenixChatbot.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :survey_response_id, references(:responses)
    end

    # alter table(:orders) do
    #  add :question_id, references(:questions)
    #  add :survey_id, references(:surveys)
    # end

    alter table(:survey_responses) do
    #  add :survey_id, references(:surveys)
      add :user_id, references(:users)
    end

    alter table(:responses) do
      add :survey_response_id, references(:survey_responses)
      # add :question_id, references(:questions)
      add :response_choice_id, references(:response_choices)
      # add :user_id, references(:users)
    end

    alter table(:questions) do
      # add :order_id, references(:orders)
      add :question_type_id, references(:question_types)
      add :response_choices, references(:response_choices)
      # add :responses, references(:responses)
    end

    alter table(:question_types) do
      add :questions, references(:questions)
    end

    alter table(:response_choices) do
      add :question_id, references(:questions)
      add :responses, references(:responses)
    end
  end

end
