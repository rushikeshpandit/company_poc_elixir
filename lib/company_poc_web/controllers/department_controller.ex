defmodule CompanyPocWeb.DepartmentController do
  use CompanyPocWeb, :controller

  alias CompanyPoc.Entities
  alias CompanyPoc.Entities.Department

  def index(conn, _params) do
    department = Entities.list_department()
    render(conn, :index, department_collection: department)
  end

  def new(conn, _params) do
    changeset = Entities.change_department(%Department{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"department" => department_params}) do
    case Entities.create_department(department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department created successfully.")
        |> redirect(to: ~p"/department/#{department}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Entities.get_department!(id)
    render(conn, :show, department: department)
  end

  def edit(conn, %{"id" => id}) do
    department = Entities.get_department!(id)
    changeset = Entities.change_department(department)
    render(conn, :edit, department: department, changeset: changeset)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Entities.get_department!(id)

    case Entities.update_department(department, department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department updated successfully.")
        |> redirect(to: ~p"/department/#{department}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, department: department, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Entities.get_department!(id)
    {:ok, _department} = Entities.delete_department(department)

    conn
    |> put_flash(:info, "Department deleted successfully.")
    |> redirect(to: ~p"/department")
  end
end
