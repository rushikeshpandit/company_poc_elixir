defmodule CompanyPoc.EntitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyPoc.Entities` context.
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
      |> CompanyPoc.Entities.create_company()

    company
  end

  @doc """
  Generate a department.
  """
  def department_fixture(attrs \\ %{}) do
    {:ok, department} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> CompanyPoc.Entities.create_department()

    department
  end
end
