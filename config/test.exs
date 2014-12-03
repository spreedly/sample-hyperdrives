use Mix.Config

config :phoenix, Hyperdrives.Router,
  http: [port: System.get_env("PORT") || 4001],
