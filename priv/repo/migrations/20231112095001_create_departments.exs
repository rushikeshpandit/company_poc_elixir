defmodule CompanyPoc.Repo.Migrations.CreateDepartments do
  use Ecto.Migration

  def change do
    alter table(:department) do
      add :company_id, references(:company)
    end
  end
end
