defmodule CompanyPocWeb.CompanyController do
  use CompanyPocWeb, :controller

  alias CompanyPoc.Entities
  alias CompanyPoc.Entities.Company

  def index(conn, _params) do
    company = Entities.list_company()
    render(conn, :index, company_collection: company)
  end

  def new(conn, _params) do
    changeset = Entities.change_company(%Company{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"company" => company_params}) do
    case Entities.create_company(company_params) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company created successfully.")
        |> redirect(to: ~p"/company/#{company}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    company = Entities.get_company!(id)
    render(conn, :show, company: company)
  end

  def edit(conn, %{"id" => id}) do
    company = Entities.get_company!(id)
    changeset = Entities.change_company(company)
    render(conn, :edit, company: company, changeset: changeset)
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Entities.get_company!(id)

    case Entities.update_company(company, company_params) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "Company updated successfully.")
        |> redirect(to: ~p"/company/#{company}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, company: company, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    company = Entities.get_company!(id)
    {:ok, _company} = Entities.delete_company(company)

    conn
    |> put_flash(:info, "Company deleted successfully.")
    |> redirect(to: ~p"/company")
  end
end
