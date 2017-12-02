defmodule PhoenixChatbot.PageController do
  use PhoenixChatbot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
