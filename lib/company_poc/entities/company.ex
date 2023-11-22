defmodule CompanyPoc.Entities.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company" do
    field :description, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
