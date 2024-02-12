defmodule TodoLiveViewTutorial.Repo do
  use Ecto.Repo,
    otp_app: :todo_live_view_tutorial,
    adapter: Ecto.Adapters.Postgres
end
