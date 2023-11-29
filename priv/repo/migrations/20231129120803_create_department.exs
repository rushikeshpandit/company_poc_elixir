defmodule CompanyPoc.Repo.Migrations.CreateDepartment do
  use Ecto.Migration

  def change do
    create table(:department) do
      add :title, :string
      add :description, :string
      add :company_id, references(:company, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:department, [:company_id])
  end
end
