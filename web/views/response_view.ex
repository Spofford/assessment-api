defmodule PhoenixChatbot.ResponseView do
  use PhoenixChatbot.Web, :view

  alias PhoenixChatbot.{ResponseView}

  def render("show.json", %{response: response}) do
    response
  end


end
