defmodule PhoenixChatbot.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :responses, references(:responses)
    end

    alter table(:responses) do
      add :response_choice_id, references(:response_choices)
      add :user_id, references(:users)
    end

    alter table(:questions) do
      add :question_type_id, references(:question_types)
      add :response_choices, references(:response_choices)
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
