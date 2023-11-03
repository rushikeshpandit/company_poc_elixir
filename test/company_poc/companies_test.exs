defmodule CompanyPoc.CompaniesTest do
  use CompanyPoc.DataCase

  alias CompanyPoc.Companies

  describe "company" do
    alias CompanyPoc.Companies.Company

    import CompanyPoc.CompaniesFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_company/0 returns all company" do
      company = company_fixture()
      assert Companies.list_company() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Companies.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Company{} = company} = Companies.create_company(valid_attrs)
      assert company.description == "some description"
      assert company.title == "some title"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Companies.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Company{} = company} = Companies.update_company(company, update_attrs)
      assert company.description == "some updated description"
      assert company.title == "some updated title"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Companies.update_company(company, @invalid_attrs)
      assert company == Companies.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Companies.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Companies.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Companies.change_company(company)
    end
  end
end
