defmodule PhoenixChatbot.Router do
  use PhoenixChatbot.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", PhoenixChatbot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", PhoenixChatbot do
    pipe_through :api

    get "/auth", AuthController, :test
    resources "/users", UserController, except: [:new, :edit]
  end

  scope "/auth", PhoenixChatbot do
    pipe_through [:api, :api_auth]

    get "/me", AuthController, :me
    post "/:identity/callback", AuthController, :callback
    delete "/signout", AuthController, :delete
  end
end
