# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_chatbot,
  namespace: PhoenixChatbot,
  ecto_repos: [PhoenixChatbot.Repo]

# Configures the endpoint
config :phoenix_chatbot, PhoenixChatbot.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O+IESmwzMWSwgrNlNieUV0UmliN4/+xfJCrOVXiFDRlgh3TzyAODomQBQ5QgiBkm",
  render_errors: [view: PhoenixChatbot.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixChatbot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    identity: {
      Ueberauth.Strategy.Identity,
      [callback_methods: ["POST"]]
    }
  ]

  config :guardian, Guardian,
    issuer: "PhoenixChatbot",
    ttl: {30, :days},
    secret_key: "HYICutSG9ODOVRp4kP/MD+bHpXBUkj17fp3y+nHDHp4avdPXJqH20epYUXOBqhNL",
    serializer: PhoenixChatbot.GuardianSerializer,
    permissions: %{default: [:read, :write]}
