defmodule SimpleAuthWeb.SessionController do
  use SimpleAuthWeb, :controller
  alias SimpleAuth.User
  alias SimpleAuth.Repo

  plug :scrub_params, "session" when action in [:create]

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    user = Repo.get_by(User, email: email)

    case user do
      nil ->
        conn
        |> put_flash(:error, "Does not exist!")
        |> render("new.html")

      _ ->
        if Comeonin.Bcrypt.checkpw(password, user.password_hash) do
          conn
          |> SimpleAuthWeb.Guardian.Plug.sign_in(user)
          |> put_flash(:info, "You're in!")
          |> redirect(to: Routes.user_path(conn, :show, user))

        else
          conn
          |> put_flash(:error, "Incorrect Password")
          |> render("new.html")
        end
    end
  end
      #
      # defp login_reply(conn, user) do
      #   conn
      #   |> put_flash(:success, "Welcome back!")
      #   |> redirect(to: Routes.user_path(conn, :show, user))
      # end
      #

  def delete(conn, _) do
  end

end
