defmodule CompanyPoc.EntityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyPoc.Entity` context.
  """

  @doc """
  Generate a companies.
  """
  def companies_fixture(attrs \\ %{}) do
    {:ok, companies} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> CompanyPoc.Entity.create_companies()

    companies
  end

  @doc """
  Generate a departments.
  """
  def departments_fixture(attrs \\ %{}) do
    {:ok, departments} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> CompanyPoc.Entity.create_departments()

    departments
  end
end
