# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :delivery,
  ecto_repos: [Delivery.Repo]

config :delivery, Delivery.Users.Create,
  via_cep_adapter: Delivery.ViaCep.Client

config :delivery, Delivery.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :delivery, DeliveryWeb.Auth.Guardian,
  issuer: "delivery",
  secret_key: "bspFhomWyn4eP1XY5oT12NLUa5mf2hsJAain6B4vHcODxY5ErpuZAPQ0kQ30i4P6"

config :delivery, DeliveryWeb.Auth.Pipeline,
  module: DeliveryWeb.Auth.Guardian,
  error_handler: DeliveryWeb.Auth.ErrorHandler

# Configures the endpoint
config :delivery, DeliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LY/li2SC4BVICrg80fgcSpy8HAk9uReNi8K1GmzfSHNEvWW7vKHlC33UrxwAEtZe",
  render_errors: [view: DeliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Delivery.PubSub,
  live_view: [signing_salt: "jBQSPkTp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
