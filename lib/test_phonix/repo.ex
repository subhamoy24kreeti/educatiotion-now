defmodule TestPhonix.Repo do
  use Ecto.Repo,
    otp_app: :test_phonix,
    adapter: Ecto.Adapters.Postgres
end
