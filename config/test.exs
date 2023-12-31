use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :delivery, Delivery.Repo,
  username: "postgres",
  password: "postgres",
  database: "delivery_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :delivery, Delivery.Users.Create,
  via_cep_adapter: Delivery.ViaCep.ClientMock

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :delivery, DeliveryWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
