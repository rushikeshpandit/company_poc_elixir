defmodule CompanyPoc.EntityTest do
  use CompanyPoc.DataCase

  alias CompanyPoc.Entity

  describe "company" do
    alias CompanyPoc.Entity.Companies

    import CompanyPoc.EntityFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_company/0 returns all company" do
      companies = companies_fixture()
      assert Entity.list_company() == [companies]
    end

    test "get_companies!/1 returns the companies with given id" do
      companies = companies_fixture()
      assert Entity.get_companies!(companies.id) == companies
    end

    test "create_companies/1 with valid data creates a companies" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Companies{} = companies} = Entity.create_companies(valid_attrs)
      assert companies.description == "some description"
      assert companies.title == "some title"
    end

    test "create_companies/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entity.create_companies(@invalid_attrs)
    end

    test "update_companies/2 with valid data updates the companies" do
      companies = companies_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Companies{} = companies} = Entity.update_companies(companies, update_attrs)
      assert companies.description == "some updated description"
      assert companies.title == "some updated title"
    end

    test "update_companies/2 with invalid data returns error changeset" do
      companies = companies_fixture()
      assert {:error, %Ecto.Changeset{}} = Entity.update_companies(companies, @invalid_attrs)
      assert companies == Entity.get_companies!(companies.id)
    end

    test "delete_companies/1 deletes the companies" do
      companies = companies_fixture()
      assert {:ok, %Companies{}} = Entity.delete_companies(companies)
      assert_raise Ecto.NoResultsError, fn -> Entity.get_companies!(companies.id) end
    end

    test "change_companies/1 returns a companies changeset" do
      companies = companies_fixture()
      assert %Ecto.Changeset{} = Entity.change_companies(companies)
    end
  end

  describe "department" do
    alias CompanyPoc.Entity.Departments

    import CompanyPoc.EntityFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_department/0 returns all department" do
      departments = departments_fixture()
      assert Entity.list_department() == [departments]
    end

    test "get_departments!/1 returns the departments with given id" do
      departments = departments_fixture()
      assert Entity.get_departments!(departments.id) == departments
    end

    test "create_departments/1 with valid data creates a departments" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Departments{} = departments} = Entity.create_departments(valid_attrs)
      assert departments.description == "some description"
      assert departments.title == "some title"
    end

    test "create_departments/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entity.create_departments(@invalid_attrs)
    end

    test "update_departments/2 with valid data updates the departments" do
      departments = departments_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Departments{} = departments} = Entity.update_departments(departments, update_attrs)
      assert departments.description == "some updated description"
      assert departments.title == "some updated title"
    end

    test "update_departments/2 with invalid data returns error changeset" do
      departments = departments_fixture()
      assert {:error, %Ecto.Changeset{}} = Entity.update_departments(departments, @invalid_attrs)
      assert departments == Entity.get_departments!(departments.id)
    end

    test "delete_departments/1 deletes the departments" do
      departments = departments_fixture()
      assert {:ok, %Departments{}} = Entity.delete_departments(departments)
      assert_raise Ecto.NoResultsError, fn -> Entity.get_departments!(departments.id) end
    end

    test "change_departments/1 returns a departments changeset" do
      departments = departments_fixture()
      assert %Ecto.Changeset{} = Entity.change_departments(departments)
    end
  end
end
