defmodule CompanyPoc.Entity.Departments do
  use Ecto.Schema
  import Ecto.Changeset

  schema "department" do
    field :description, :string
    field :title, :string
    field :company_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(departments, attrs) do
    departments
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
