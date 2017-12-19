defmodule PhoenixChatbot.QuestionController do
  use PhoenixChatbot.Web, :controller

  alias PhoenixChatbot.Question

  def index(conn, %{"order" => order}) do

    question = Repo.get_by(Question, order: order)
    |> Repo.preload(:question_type)
    |> Repo.preload(:response_choices)

    render(conn, "question.json", question: question)

  end

  def create(conn, %{"question" => question_params}) do
    changeset = Question.changeset(%Question{}, question_params)

    case Repo.insert(changeset) do
      {:ok, question} ->

        conn
        |> put_status(:created)
        |> render("show.json", question: question)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"question" => question}) do

    render(conn, "show.json", question: question)
  end

  def update(conn, %{"id" => id, "question" => question_params}) do
    question = Repo.get!(Question, id)
    changeset = Question.changeset(question, question_params)

    case Repo.update(changeset) do
      {:ok, question} ->
        render(conn, "show.json", question: question)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    question = Repo.get!(Question, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(question)

    send_resp(conn, :no_content, "")
  end
end
