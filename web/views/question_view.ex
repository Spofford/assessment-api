defmodule PhoenixChatbot.QuestionView do
  use PhoenixChatbot.Web, :view

  alias PhoenixChatbot.{QuestionView}

  def render("index.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{text: question.text}
  end
end
