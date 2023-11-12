defmodule CompanyPoc.DepartmentsTest do
  use CompanyPoc.DataCase

  alias CompanyPoc.Departments

  describe "department" do
    alias CompanyPoc.Departments.Department

    import CompanyPoc.DepartmentsFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_department/0 returns all department" do
      department = department_fixture()
      assert Departments.list_department() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Departments.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Department{} = department} = Departments.create_department(valid_attrs)
      assert department.description == "some description"
      assert department.title == "some title"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Departments.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Department{} = department} = Departments.update_department(department, update_attrs)
      assert department.description == "some updated description"
      assert department.title == "some updated title"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Departments.update_department(department, @invalid_attrs)
      assert department == Departments.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Departments.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Departments.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Departments.change_department(department)
    end
  end
end
