defmodule CompanyPoc.EntityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyPoc.Entity` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> CompanyPoc.Entity.create_company()

    company
  end
end
