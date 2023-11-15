defmodule CompanyPoc.Departments do
  @moduledoc """
  The Departments context.
  """

  import Ecto.Query, warn: false
  require Logger
  alias CompanyPoc.Repo
  alias CompanyPoc.Companies.Company
  alias CompanyPoc.Departments.Department

  @doc """
  Returns the list of department.

  ## Examples

      iex> list_department()
      [%Department{}, ...]

  """
  def list_department do
    Repo.all(Department)
  end

  @doc """
  Gets a single department.

  Raises `Ecto.NoResultsError` if the Department does not exist.

  ## Examples

      iex> get_department!(123)
      %Department{}

      iex> get_department!(456)
      ** (Ecto.NoResultsError)

  """
  def get_department!(id) do
    Department
      |> Repo.get!(id)
      |> Repo.preload(:company)
  end

  @doc """
  Creates a department.

  ## Examples

      iex> create_department(%{field: value})
      {:ok, %Department{}}

      iex> create_department(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_department(attrs \\ %{}) do
    %Department{}
    |> change_department(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a department.

  ## Examples

      iex> update_department(department, %{field: new_value})
      {:ok, %Department{}}

      iex> update_department(department, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_department(%Department{} = department, attrs) do
    department
    |> change_department(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a department.

  ## Examples

      iex> delete_department(department)
      {:ok, %Department{}}

      iex> delete_department(department)
      {:error, %Ecto.Changeset{}}

  """
  def delete_department(%Department{} = department) do
    Repo.delete(department)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking department changes.

  ## Examples

      iex> change_department(department)
      %Ecto.Changeset{data: %Department{}}

  """
  def change_department(%Department{} = department, attrs \\ %{}) do
    companies = list_companies_by_id(attrs["department_ids"])
    Logger.debug "companies value: #{inspect(companies)}"
    Logger.debug "attrs value: #{inspect(attrs)}"

    department
    |> Repo.preload(:company)
    |> Department.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:company, companies)
  end

  def list_companies_by_id(nil), do: []
  def list_companies_by_id(company_ids) do
    Logger.debug "company_ids value: #{inspect(company_ids)}"
    Repo.all(from c in Company, where: c.id in ^company_ids)
  end
end
