defmodule Yasn.Router do
  use Yasn.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Yasn do
    pipe_through :browser # Use the default browser stack
    get "/", PostController, :index, as: :root

    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    resources "/posts", PostController
    get "/pages", PageController, :index

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Yasn do
  #   pipe_through :api
  # end
end
