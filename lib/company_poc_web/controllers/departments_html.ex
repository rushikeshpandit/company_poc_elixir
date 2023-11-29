defmodule CompanyPocWeb.DepartmentsHTML do
  use CompanyPocWeb, :html

  embed_templates "departments_html/*"

  @doc """
  Renders a departments form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def departments_form(assigns)
end
