defmodule PhoenixChatbot.UserView do

  use PhoenixChatbot.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PhoenixChatbot.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PhoenixChatbot.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      username: user.username}
  end
end
