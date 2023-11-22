defmodule CompanyPoc.Entities.Department do
  use Ecto.Schema
  import Ecto.Changeset

  schema "department" do
    field :description, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
