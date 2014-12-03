use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :phoenix, Hyperdrives.Router,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "n8SEvNZwySz1/w0ebEFckyo4j3/olGWrVJ3ze6ns2oMwuxE2spIi2gLf6T/zGykEpUWYMUK8GWE9HLo9VjPLHA=="

config :logger,
  level: :info
