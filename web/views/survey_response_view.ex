defmodule PhoenixChatbot.SurveyResponseView do
  use PhoenixChatbot.Web, :view

  alias PhoenixChatbot.{SurveyResponseView}

  def render("show.json", %{survey_response: survey_response}) do
    survey_response
  end


end
