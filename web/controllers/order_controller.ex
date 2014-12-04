defmodule Hyperdrives.OrderController do
  use Phoenix.Controller
  alias Phoenix.Controller.Flash
  import Hyperdrives.Router.Helpers

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    Flash.put(conn, :notice, "Card saved.  Now we need to charge it.")
      |> redirect(to: order_path(:new))
  end
end
