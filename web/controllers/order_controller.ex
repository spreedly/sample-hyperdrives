defmodule Hyperdrives.OrderController do
  use Phoenix.Controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, _params) do
    render conn, "new.html"
  end
end
