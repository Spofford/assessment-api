defmodule PhoenixChatbot.QuestionView do
  use PhoenixChatbot.Web, :view

  alias PhoenixChatbot.QuestionTypeView
  alias PhoenixChatbot.ResponseChoiceView

  def render("question.json", %{question: question}) do
    %{
      text: question.text,
      question_type: question.question_type.name,
      response_choices: render_many(question.response_choices, ResponseChoiceView, "response_choice.json")
    }
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end
end
