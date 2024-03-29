defmodule CompanyPoc.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:company) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
