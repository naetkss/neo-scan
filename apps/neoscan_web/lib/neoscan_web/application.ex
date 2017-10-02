defmodule NeoscanWeb.Application do
  use Application
  alias NeoscanWeb.Endpoint
  alias NeoscanWeb.Supervisor

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(NeoscanWeb.Endpoint, []),
      # Start your own worker by calling: NeoscanWeb.Worker.start_link(arg1, arg2, arg3)
      # worker(NeoscanWeb.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Endpoint.config_change(changed, removed)
    :ok
  end
end
