defmodule SimpleAuthWeb.PageController do
  use SimpleAuthWeb, :controller
  alias SimpleAuthWeb.Auth
  alias SimpleAuth.User
  alias SimpleAuthWeb.Guardian

  def index(conn, _params) do
      render(conn, "index.html")
    end

  #   def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
  #     User.authenticate_user(username, password)
  #     |> login_reply(conn)
  #   end
  #
  #   defp login_reply({:error, error}, conn) do
  #   conn
  #     |> put_flash(:error, error)
  #     |> redirect(to: "/")
  #   end
  #
  #   defp login_reply({:ok, user}, conn) do
  #     conn
  #     |> put_flash(:success, "Welcome back!")
  #     |> Guardian.Plug.sign_in(user)
  #     |> redirect(to: "/")
  #   end
  #
  #   def logout(conn, _) do
  #     conn
  #     |> Guardian.Plug.sign_out()
  #     |> redirect(to: Routes.page_path(conn, :login))
  #   end
  #
  #   def secret(conn, _params) do
  #     render(conn, "secret.html")
  #   end
  end
