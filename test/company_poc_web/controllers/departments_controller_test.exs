defmodule CompanyPocWeb.DepartmentsControllerTest do
  use CompanyPocWeb.ConnCase

  import CompanyPoc.EntityFixtures

  @create_attrs %{description: "some description", title: "some title"}
  @update_attrs %{description: "some updated description", title: "some updated title"}
  @invalid_attrs %{description: nil, title: nil}

  describe "index" do
    test "lists all department", %{conn: conn} do
      conn = get(conn, ~p"/department")
      assert html_response(conn, 200) =~ "Listing Department"
    end
  end

  describe "new departments" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/department/new")
      assert html_response(conn, 200) =~ "New Departments"
    end
  end

  describe "create departments" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/department", departments: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/department/#{id}"

      conn = get(conn, ~p"/department/#{id}")
      assert html_response(conn, 200) =~ "Departments #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/department", departments: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Departments"
    end
  end

  describe "edit departments" do
    setup [:create_departments]

    test "renders form for editing chosen departments", %{conn: conn, departments: departments} do
      conn = get(conn, ~p"/department/#{departments}/edit")
      assert html_response(conn, 200) =~ "Edit Departments"
    end
  end

  describe "update departments" do
    setup [:create_departments]

    test "redirects when data is valid", %{conn: conn, departments: departments} do
      conn = put(conn, ~p"/department/#{departments}", departments: @update_attrs)
      assert redirected_to(conn) == ~p"/department/#{departments}"

      conn = get(conn, ~p"/department/#{departments}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, departments: departments} do
      conn = put(conn, ~p"/department/#{departments}", departments: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Departments"
    end
  end

  describe "delete departments" do
    setup [:create_departments]

    test "deletes chosen departments", %{conn: conn, departments: departments} do
      conn = delete(conn, ~p"/department/#{departments}")
      assert redirected_to(conn) == ~p"/department"

      assert_error_sent 404, fn ->
        get(conn, ~p"/department/#{departments}")
      end
    end
  end

  defp create_departments(_) do
    departments = departments_fixture()
    %{departments: departments}
  end
end
