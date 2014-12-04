defmodule Hyperdrives.DriveController do
  use Phoenix.Controller

  plug :action

  def show(conn, _params) do
    render conn, "show.html"
  end
end
