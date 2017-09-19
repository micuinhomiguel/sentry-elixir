# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sentry,
  ecto_repos: [Sentry.Repo]

# Configures the endpoint
config :sentry, Sentry.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fQ1Bp85xwIIIxMeoCL0mWXwpftNWm2K3hlwGdRM9xxmnWZpGpYWSKhs1XZg4WMeV",
  render_errors: [view: Sentry.ErrorView, accepts: ~w(json)],
  pubsub: [name: Sentry.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
