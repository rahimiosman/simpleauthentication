# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_auth,
  ecto_repos: [SimpleAuth.Repo]

# Configures the endpoint
config :simple_auth, SimpleAuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RObbeDqfJwwkouz4DnBbYacRubyMCeqYmY1n4jCKaYFErndpC6iSpKlsWVGL26gN",
  render_errors: [view: SimpleAuthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SimpleAuth.PubSub,
  live_view: [signing_salt: "6s2eqbBr"]


config :simple_auth, SimpleAuthWeb.Guardian,
  issuer: "simple_auth",
  secret_key: "ARtpnVjJbFTX9HeNirj8ZZTBX/PoLBqQ7Y9rUb5Rke8HwqezK5SsAxfJWnTOCsk4"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
