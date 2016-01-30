defmodule ThingsWeLike.Router do
  use ThingsWeLike.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ThingsWeLike do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end


  resources "/categories", ThingsWeLike.CategoryController, except: [:new, :edit]

  # Other scopes may use custom stacks.
  # scope "/api", ThingsWeLike do
  #   pipe_through :api
  # end
end
