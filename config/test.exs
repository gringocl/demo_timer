import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :demo_timer, DemoTimerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NX6l3s/0Y4TXaNWutFNSWIzQaVcvUAxCfp8MoL38pzw7wd1cZKw0k8lGWKwdFbQt",
  server: false

# In test we don't send emails.
config :demo_timer, DemoTimer.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
