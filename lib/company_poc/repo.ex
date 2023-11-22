defmodule CompanyPoc.Repo do
  use Ecto.Repo,
    otp_app: :company_poc,
    adapter: Ecto.Adapters.Postgres
end
