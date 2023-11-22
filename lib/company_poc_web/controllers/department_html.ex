defmodule CompanyPocWeb.DepartmentHTML do
  use CompanyPocWeb, :html

  embed_templates "department_html/*"

  @doc """
  Renders a department form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def department_form(assigns)
end
