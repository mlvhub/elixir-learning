defmodule Taskboard.Repo do
  use Ecto.Repo,
    otp_app: :taskboard,
    adapter: Ecto.Adapters.Postgres
end
