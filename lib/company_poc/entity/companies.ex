defmodule CompanyPoc.Entity.Companies do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company" do
    field :description, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(companies, attrs) do
    companies
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
