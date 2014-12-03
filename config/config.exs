# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, Hyperdrives.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "n8SEvNZwySz1/w0ebEFckyo4j3/olGWrVJ3ze6ns2oMwuxE2spIi2gLf6T/zGykEpUWYMUK8GWE9HLo9VjPLHA==",
  debug_errors: false,
  error_controller: Hyperdrives.PageController

# Session configuration
config :phoenix, Hyperdrives.Router,
  session: [store: :cookie,
            key: "_hyperdrives_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
