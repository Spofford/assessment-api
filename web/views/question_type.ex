defmodule PhoenixChatbot.QuestionTypeView do
  use PhoenixChatbot.Web, :view

  alias PhoenixChatbot.{QuestionTypeView}

  def render("question_type.json", %{question_type: question_type}) do
    question_type
  end


end
