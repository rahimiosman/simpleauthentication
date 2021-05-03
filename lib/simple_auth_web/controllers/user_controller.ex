defmodule SimpleAuthWeb.UserController do
  use SimpleAuthWeb, :controller
  alias SimpleAuth.User
  alias SimpleAuth.Repo


  def show(conn, _) do
    user = SimpleAuthWeb.Guardian.Plug.current_resource(conn)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  plug :scrub_params, "user" when action in [:create]

  def create(conn, %{"user" => user_params}) do
    changeset = %User{} |> User.registration_changeset(user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: Routes.user_path(conn, :show, user))

       {:error, changeset} ->
         render(conn, "new.html", changeset: changeset)
    end
  end
end
