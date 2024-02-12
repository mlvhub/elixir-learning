defmodule Deliveries.Repo do
  use Ecto.Repo,
    otp_app: :deliveries,
    adapter: Ecto.Adapters.Postgres
end
