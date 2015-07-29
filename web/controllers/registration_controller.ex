defmodule Yasn.RegistrationController do

  use Yasn.Web, :controller
  alias Yasn.User

  plug :action

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{ "user" => user_params }) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      user = Yasn.Registration.create(changeset, Yasn.Repo)
      conn
      |> put_session(:current_user, user.id)
      |> put_flash(:info, "Your account was created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end

end
