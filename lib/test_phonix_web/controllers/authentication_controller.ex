defmodule TestPhonixWeb.AuthenticationController do
  use TestPhonixWeb, :controller

  alias TestPhonix.Users
  alias TestPhonix.Users.User

  def post_register(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Chapter created successfully.")
        |> redirect(to: Routes.authentication_path(conn, :landing))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, TestPhonixWeb.LandingView, "signup.html", changeset: changeset)
    end
  end

  def landing(conn, _params) do
    render(conn, TestPhonixWeb.LandingView, "landing.html")
  end

  def login(conn, _params) do
    render(conn, TestPhonixWeb.LandingView, "login.html")
  end

  def signup(conn, _params) do
    changeset = Users.change_user(%User{})
    render(conn, TestPhonixWeb.LandingView, "signup.html", changeset: changeset)
  end

end
