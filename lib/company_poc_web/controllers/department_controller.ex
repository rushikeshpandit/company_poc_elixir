defmodule CompanyPocWeb.DepartmentController do
  use CompanyPocWeb, :controller

  alias CompanyPoc.Entity
  alias CompanyPoc.Entity.Department

  def index(conn, _params) do
    departments = Entity.list_departments()
    render(conn, :index, departments: departments)
  end

  def new(conn, _params) do
    changeset = Entity.change_department(%Department{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"department" => department_params}) do
    case Entity.create_department(department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department created successfully.")
        |> redirect(to: ~p"/departments/#{department}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Entity.get_department!(id)
    render(conn, :show, department: department)
  end

  def edit(conn, %{"id" => id}) do
    department = Entity.get_department!(id)
    changeset = Entity.change_department(department)
    render(conn, :edit, department: department, changeset: changeset)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Entity.get_department!(id)

    case Entity.update_department(department, department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department updated successfully.")
        |> redirect(to: ~p"/departments/#{department}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, department: department, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Entity.get_department!(id)
    {:ok, _department} = Entity.delete_department(department)

    conn
    |> put_flash(:info, "Department deleted successfully.")
    |> redirect(to: ~p"/departments")
  end
end
