defmodule CompanyPocWeb.DepartmentControllerTest do
  use CompanyPocWeb.ConnCase

  import CompanyPoc.EntityFixtures

  @create_attrs %{description: "some description", title: "some title"}
  @update_attrs %{description: "some updated description", title: "some updated title"}
  @invalid_attrs %{description: nil, title: nil}

  describe "index" do
    test "lists all departments", %{conn: conn} do
      conn = get(conn, ~p"/departments")
      assert html_response(conn, 200) =~ "Listing Departments"
    end
  end

  describe "new department" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/departments/new")
      assert html_response(conn, 200) =~ "New Department"
    end
  end

  describe "create department" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/departments", department: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/departments/#{id}"

      conn = get(conn, ~p"/departments/#{id}")
      assert html_response(conn, 200) =~ "Department #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/departments", department: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Department"
    end
  end

  describe "edit department" do
    setup [:create_department]

    test "renders form for editing chosen department", %{conn: conn, department: department} do
      conn = get(conn, ~p"/departments/#{department}/edit")
      assert html_response(conn, 200) =~ "Edit Department"
    end
  end

  describe "update department" do
    setup [:create_department]

    test "redirects when data is valid", %{conn: conn, department: department} do
      conn = put(conn, ~p"/departments/#{department}", department: @update_attrs)
      assert redirected_to(conn) == ~p"/departments/#{department}"

      conn = get(conn, ~p"/departments/#{department}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, department: department} do
      conn = put(conn, ~p"/departments/#{department}", department: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Department"
    end
  end

  describe "delete department" do
    setup [:create_department]

    test "deletes chosen department", %{conn: conn, department: department} do
      conn = delete(conn, ~p"/departments/#{department}")
      assert redirected_to(conn) == ~p"/departments"

      assert_error_sent 404, fn ->
        get(conn, ~p"/departments/#{department}")
      end
    end
  end

  defp create_department(_) do
    department = department_fixture()
    %{department: department}
  end
end
