defmodule CompanyPocWeb.CompaniesControllerTest do
  use CompanyPocWeb.ConnCase

  import CompanyPoc.EntityFixtures

  @create_attrs %{description: "some description", title: "some title"}
  @update_attrs %{description: "some updated description", title: "some updated title"}
  @invalid_attrs %{description: nil, title: nil}

  describe "index" do
    test "lists all company", %{conn: conn} do
      conn = get(conn, ~p"/company")
      assert html_response(conn, 200) =~ "Listing Company"
    end
  end

  describe "new companies" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/company/new")
      assert html_response(conn, 200) =~ "New Companies"
    end
  end

  describe "create companies" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/company", companies: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/company/#{id}"

      conn = get(conn, ~p"/company/#{id}")
      assert html_response(conn, 200) =~ "Companies #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/company", companies: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Companies"
    end
  end

  describe "edit companies" do
    setup [:create_companies]

    test "renders form for editing chosen companies", %{conn: conn, companies: companies} do
      conn = get(conn, ~p"/company/#{companies}/edit")
      assert html_response(conn, 200) =~ "Edit Companies"
    end
  end

  describe "update companies" do
    setup [:create_companies]

    test "redirects when data is valid", %{conn: conn, companies: companies} do
      conn = put(conn, ~p"/company/#{companies}", companies: @update_attrs)
      assert redirected_to(conn) == ~p"/company/#{companies}"

      conn = get(conn, ~p"/company/#{companies}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, companies: companies} do
      conn = put(conn, ~p"/company/#{companies}", companies: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Companies"
    end
  end

  describe "delete companies" do
    setup [:create_companies]

    test "deletes chosen companies", %{conn: conn, companies: companies} do
      conn = delete(conn, ~p"/company/#{companies}")
      assert redirected_to(conn) == ~p"/company"

      assert_error_sent 404, fn ->
        get(conn, ~p"/company/#{companies}")
      end
    end
  end

  defp create_companies(_) do
    companies = companies_fixture()
    %{companies: companies}
  end
end
