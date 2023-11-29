defmodule CompanyPoc.Entity do
  @moduledoc """
  The Entity context.
  """

  import Ecto.Query, warn: false
  alias CompanyPoc.Repo

  alias CompanyPoc.Entity.Companies

  @doc """
  Returns the list of company.

  ## Examples

      iex> list_company()
      [%Companies{}, ...]

  """
  def list_company do
    Repo.all(Companies)
  end

  @doc """
  Gets a single companies.

  Raises `Ecto.NoResultsError` if the Companies does not exist.

  ## Examples

      iex> get_companies!(123)
      %Companies{}

      iex> get_companies!(456)
      ** (Ecto.NoResultsError)

  """
  def get_companies!(id), do: Repo.get!(Companies, id)

  @doc """
  Creates a companies.

  ## Examples

      iex> create_companies(%{field: value})
      {:ok, %Companies{}}

      iex> create_companies(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_companies(attrs \\ %{}) do
    %Companies{}
    |> Companies.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a companies.

  ## Examples

      iex> update_companies(companies, %{field: new_value})
      {:ok, %Companies{}}

      iex> update_companies(companies, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_companies(%Companies{} = companies, attrs) do
    companies
    |> Companies.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a companies.

  ## Examples

      iex> delete_companies(companies)
      {:ok, %Companies{}}

      iex> delete_companies(companies)
      {:error, %Ecto.Changeset{}}

  """
  def delete_companies(%Companies{} = companies) do
    Repo.delete(companies)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking companies changes.

  ## Examples

      iex> change_companies(companies)
      %Ecto.Changeset{data: %Companies{}}

  """
  def change_companies(%Companies{} = companies, attrs \\ %{}) do
    Companies.changeset(companies, attrs)
  end

  alias CompanyPoc.Entity.Departments

  @doc """
  Returns the list of department.

  ## Examples

      iex> list_department()
      [%Departments{}, ...]

  """
  def list_department do
    Repo.all(Departments)
  end

  @doc """
  Gets a single departments.

  Raises `Ecto.NoResultsError` if the Departments does not exist.

  ## Examples

      iex> get_departments!(123)
      %Departments{}

      iex> get_departments!(456)
      ** (Ecto.NoResultsError)

  """
  def get_departments!(id), do: Repo.get!(Departments, id)

  @doc """
  Creates a departments.

  ## Examples

      iex> create_departments(%{field: value})
      {:ok, %Departments{}}

      iex> create_departments(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_departments(attrs \\ %{}) do
    %Departments{}
    |> Departments.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a departments.

  ## Examples

      iex> update_departments(departments, %{field: new_value})
      {:ok, %Departments{}}

      iex> update_departments(departments, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_departments(%Departments{} = departments, attrs) do
    departments
    |> Departments.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a departments.

  ## Examples

      iex> delete_departments(departments)
      {:ok, %Departments{}}

      iex> delete_departments(departments)
      {:error, %Ecto.Changeset{}}

  """
  def delete_departments(%Departments{} = departments) do
    Repo.delete(departments)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking departments changes.

  ## Examples

      iex> change_departments(departments)
      %Ecto.Changeset{data: %Departments{}}

  """
  def change_departments(%Departments{} = departments, attrs \\ %{}) do
    Departments.changeset(departments, attrs)
  end
end
