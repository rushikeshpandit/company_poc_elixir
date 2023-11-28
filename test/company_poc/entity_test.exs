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
end
