defmodule Hyperdrives.OrderController do
  use Phoenix.Controller
  alias Phoenix.Controller.Flash

  plug :action

  def new(conn, _params) do
    conn
    |> assign(:payment_method, %CreditCard{})
    |> render "new.html"
  end

  def create(conn, params) do
    Spreedly.purchase_on_gateway(System.get_env("GATEWAY_TOKEN"), params["payment_method_token"], 4400)
    |> handle_response(conn)
  end

  defp handle_response({:ok}, conn) do
    conn
    |> Flash.put(:notice, "Successful purchase!")
    |> redirect(to: "/")
  end

  defp handle_response({:error, message, payment_method}, conn) do
    IO.inspect message
    conn
    |> Flash.put(:error, message)
    |> assign(:payment_method, payment_method)
    |> render "new.html"
  end

end
