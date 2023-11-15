# CompanyPoc

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with
  `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please
[check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Problem Statement

I am building a Elixir/Phoenix app from the ground up. Companies can

- sign up / sign in (Phoenix Auth)
- CRUD departments (one company has many departments)
- CRUD locations (one company has many locations)
- CRUD employees (one company has many employees, one employee belongs to one
  department, one employee belongs to one location) Admins can -CRUD companies
  (and their employees/departments/locations) The public can
- see employee "profile pages", containing relevant information (including the
  company name, department, location)


# Currently facing error

[debug] ** (Ecto.Query.CastError) lib/company_poc/departments.ex:120: value `"2"` in `where` cannot be cast to type {:in, :id} in query:

from c0 in CompanyPoc.Companies.Company,
  where: c0.id in ^"2",
  select: c0