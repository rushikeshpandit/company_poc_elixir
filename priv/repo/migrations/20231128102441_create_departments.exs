defmodule CompanyPoc.Repo.Migrations.CreateDepartments do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
