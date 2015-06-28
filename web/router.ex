defmodule GoodTimes.Router do
  use GoodTimes.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GoodTimes do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController
    resources "/parties", PartyController

    # Session Routes    
    get "/", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    # Registration Routes
    get "/registration", RegistrationController, :new
    post "/registration", RegistrationController, :create
  end



  # Other scopes may use custom stacks.
  # scope "/api", GoodTimes do
  #   pipe_through :api
  # end
end
