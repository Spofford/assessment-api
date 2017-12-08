defmodule PhoenixChatbot.Repo.Migrations.CreateSurvey do
  use Ecto.Migration

  def change do
    create table(:surveys) do
      add :version, :integer

      timestamps()
    end

    create table(:orders) do
      add :order, :integer

      timestamps()
    end

    create table(:survey_responses) do
      add :completed_at, :utc_datetime

      timestamps()
    end

    create table(:responses) do
      add :text, :string

      timestamps()
    end

    create table(:questions) do
      add :text, :string

      timestamps()
    end

    create table(:question_types) do
      add :name, :string

      timestamps()
    end

    create table(:response_choices) do
      add :text, :string

      timestamps()
    end

  end

end
