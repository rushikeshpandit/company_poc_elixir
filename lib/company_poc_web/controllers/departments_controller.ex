defmodule CompanyPocWeb.DepartmentsController do
  use CompanyPocWeb, :controller

  alias CompanyPoc.Entity
  alias CompanyPoc.Entity.Departments

  def index(conn, _params) do
    department = Entity.list_department()
    render(conn, :index, department: department)
  end

  def new(conn, _params) do
    changeset = Entity.change_departments(%Departments{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"departments" => departments_params}) do
    case Entity.create_departments(departments_params) do
      {:ok, departments} ->
        conn
        |> put_flash(:info, "Departments created successfully.")
        |> redirect(to: ~p"/department/#{departments}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    departments = Entity.get_departments!(id)
    render(conn, :show, departments: departments)
  end

  def edit(conn, %{"id" => id}) do
    departments = Entity.get_departments!(id)
    changeset = Entity.change_departments(departments)
    render(conn, :edit, departments: departments, changeset: changeset)
  end

  def update(conn, %{"id" => id, "departments" => departments_params}) do
    departments = Entity.get_departments!(id)

    case Entity.update_departments(departments, departments_params) do
      {:ok, departments} ->
        conn
        |> put_flash(:info, "Departments updated successfully.")
        |> redirect(to: ~p"/department/#{departments}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, departments: departments, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    departments = Entity.get_departments!(id)
    {:ok, _departments} = Entity.delete_departments(departments)

    conn
    |> put_flash(:info, "Departments deleted successfully.")
    |> redirect(to: ~p"/department")
  end
end
