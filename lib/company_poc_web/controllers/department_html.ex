defmodule CompanyPocWeb.DepartmentHTML do
  use CompanyPocWeb, :html

  embed_templates "department_html/*"

  @doc """
  Renders a department form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def department_form(assigns)

  def department_opts(changeset) do
    existing_ids =
      changeset
      |> Ecto.Changeset.get_change(:departments, [])
      |> Enum.map(& &1.data.id)

    for com <- CompanyPoc.Companies.list_company(),
        do: [key: com.title, value: com.id, selected: com.id in existing_ids]
  end
end
