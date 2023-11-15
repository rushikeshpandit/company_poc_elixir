defmodule CompanyPoc.Departments.Department do
  alias CompanyPoc.Companies.Company
  use Ecto.Schema
  import Ecto.Changeset

  schema "department" do
    field :description, :string
    field :title, :string

    belongs_to :company, Company
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:title, :description, :company_id])
    |> validate_required([:title, :description, :company_id])
  end
end
