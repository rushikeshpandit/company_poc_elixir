defmodule CompanyPoc.CompaniesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyPoc.Companies` context.
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
      |> CompanyPoc.Companies.create_company()

    company
  end
end
