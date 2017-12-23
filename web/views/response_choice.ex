defmodule PhoenixChatbot.ResponseChoiceView do
  use PhoenixChatbot.Web, :view

  alias PhoenixChatbot.{ResponseChoiceView}

  def render("response_choices.json", %{response_choices: response_choices}) do
    %{data: render_many(response_choices, ResponseChoiceView, "response_choice.json")}
  end

  def render("response_choice.json", %{response_choice: response_choice}) do
    %{
      id: response_choice.id,
      text: response_choice.text,
      open: response_choice.open
    }
  end


end
