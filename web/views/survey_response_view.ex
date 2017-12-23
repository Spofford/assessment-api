defmodule PhoenixChatbot.SurveyResponseView do
  use PhoenixChatbot.Web, :view


  def render("survey_response.json", %{survey_response: survey_response}) do
    %{id: survey_response.id}
  end


end
