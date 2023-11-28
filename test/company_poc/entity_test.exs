defmodule CompanyPoc.EntityTest do
  use CompanyPoc.DataCase

  alias CompanyPoc.Entity

  describe "companies" do
    alias CompanyPoc.Entity.Company

    import CompanyPoc.EntityFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Entity.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Entity.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Company{} = company} = Entity.create_company(valid_attrs)
      assert company.description == "some description"
      assert company.title == "some title"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entity.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Company{} = company} = Entity.update_company(company, update_attrs)
      assert company.description == "some updated description"
      assert company.title == "some updated title"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Entity.update_company(company, @invalid_attrs)
      assert company == Entity.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Entity.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Entity.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Entity.change_company(company)
    end
  end

  describe "departments" do
    alias CompanyPoc.Entity.Department

    import CompanyPoc.EntityFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Entity.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Entity.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Department{} = department} = Entity.create_department(valid_attrs)
      assert department.description == "some description"
      assert department.title == "some title"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entity.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Department{} = department} = Entity.update_department(department, update_attrs)
      assert department.description == "some updated description"
      assert department.title == "some updated title"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Entity.update_department(department, @invalid_attrs)
      assert department == Entity.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Entity.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Entity.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Entity.change_department(department)
    end
  end
end
