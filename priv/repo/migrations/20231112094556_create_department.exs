defmodule CompanyPoc.Repo.Migrations.CreateDepartment do
  use Ecto.Migration

  def change do
    create table(:department) do
      add :title, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
