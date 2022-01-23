defmodule Lab.Repo do
  use Ecto.Repo,
    otp_app: :lab,
    adapter: Ecto.Adapters.Postgres
end
