defmodule CompanyPoc.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
