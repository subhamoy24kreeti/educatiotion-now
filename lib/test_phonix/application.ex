defmodule TestPhonix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TestPhonix.Repo,
      # Start the Telemetry supervisor
      TestPhonixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestPhonix.PubSub},
      # Start the Endpoint (http/https)
      TestPhonixWeb.Endpoint
      # Start a worker by calling: TestPhonix.Worker.start_link(arg)
      # {TestPhonix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestPhonix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestPhonixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
