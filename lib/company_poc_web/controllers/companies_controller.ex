defmodule CompanyPocWeb.CompaniesController do
  use CompanyPocWeb, :controller

  alias CompanyPoc.Entity
  alias CompanyPoc.Entity.Companies

  def index(conn, _params) do
    company = Entity.list_company()
    render(conn, :index, company: company)
  end

  def new(conn, _params) do
    changeset = Entity.change_companies(%Companies{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"companies" => companies_params}) do
    case Entity.create_companies(companies_params) do
      {:ok, companies} ->
        conn
        |> put_flash(:info, "Companies created successfully.")
        |> redirect(to: ~p"/company/#{companies}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    companies = Entity.get_companies!(id)
    render(conn, :show, companies: companies)
  end

  def edit(conn, %{"id" => id}) do
    companies = Entity.get_companies!(id)
    changeset = Entity.change_companies(companies)
    render(conn, :edit, companies: companies, changeset: changeset)
  end

  def update(conn, %{"id" => id, "companies" => companies_params}) do
    companies = Entity.get_companies!(id)

    case Entity.update_companies(companies, companies_params) do
      {:ok, companies} ->
        conn
        |> put_flash(:info, "Companies updated successfully.")
        |> redirect(to: ~p"/company/#{companies}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, companies: companies, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    companies = Entity.get_companies!(id)
    {:ok, _companies} = Entity.delete_companies(companies)

    conn
    |> put_flash(:info, "Companies deleted successfully.")
    |> redirect(to: ~p"/company")
  end
end
