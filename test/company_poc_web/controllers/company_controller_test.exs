defmodule CompanyPocWeb.CompanyControllerTest do
  use CompanyPocWeb.ConnCase

  import CompanyPoc.CompaniesFixtures

  @create_attrs %{description: "some description", title: "some title"}
  @update_attrs %{description: "some updated description", title: "some updated title"}
  @invalid_attrs %{description: nil, title: nil}

  describe "index" do
    test "lists all company", %{conn: conn} do
      conn = get(conn, ~p"/company")
      assert html_response(conn, 200) =~ "Listing Company"
    end
  end

  describe "new company" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/company/new")
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "create company" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/company", company: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/company/#{id}"

      conn = get(conn, ~p"/company/#{id}")
      assert html_response(conn, 200) =~ "Company #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/company", company: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "edit company" do
    setup [:create_company]

    test "renders form for editing chosen company", %{conn: conn, company: company} do
      conn = get(conn, ~p"/company/#{company}/edit")
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "update company" do
    setup [:create_company]

    test "redirects when data is valid", %{conn: conn, company: company} do
      conn = put(conn, ~p"/company/#{company}", company: @update_attrs)
      assert redirected_to(conn) == ~p"/company/#{company}"

      conn = get(conn, ~p"/company/#{company}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, company: company} do
      conn = put(conn, ~p"/company/#{company}", company: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "delete company" do
    setup [:create_company]

    test "deletes chosen company", %{conn: conn, company: company} do
      conn = delete(conn, ~p"/company/#{company}")
      assert redirected_to(conn) == ~p"/company"

      assert_error_sent 404, fn ->
        get(conn, ~p"/company/#{company}")
      end
    end
  end

  defp create_company(_) do
    company = company_fixture()
    %{company: company}
  end
end
