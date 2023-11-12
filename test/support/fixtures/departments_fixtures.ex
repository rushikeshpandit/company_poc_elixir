defmodule CompanyPoc.DepartmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyPoc.Departments` context.
  """

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
      |> CompanyPoc.Departments.create_department()

    department
  end
end
