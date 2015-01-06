Code.load_file("lib/system_env.ex")

if File.exists?(".env.exs") do
  Code.load_file(".env.exs")
end

# You can set environment variables, or define a `.env.exs` to define them
# The `.env.exs` is gitignored.  Here are the env vars you can define:

SystemEnv.put_new("ENVIRONMENT_KEY", "YourSpreedlyEnvironmentKey")
SystemEnv.put_new("ACCESS_SECRET", "YourSpreedlyAccessSecret")
SystemEnv.put_new("GATEWAY_TOKEN", "YourGatewayToken")

