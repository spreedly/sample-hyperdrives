defmodule Hyperdrives.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  scope "/", Hyperdrives do
    pipe_through :browser

    get "/", PageController, :index
    get "/buy", DriveController, :show
  end

end
