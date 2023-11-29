defmodule CompanyPocWeb.CompaniesHTML do
  use CompanyPocWeb, :html

  embed_templates "companies_html/*"

  @doc """
  Renders a companies form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def companies_form(assigns)
end
