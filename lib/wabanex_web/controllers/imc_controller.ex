defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller
  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> IO.inspect()
    |> handle_response(conn)
  end

  def handle_response({:ok, data}, conn), do: render_response(conn, data, :ok)

  def handle_response({:error, data}, conn), do: render_response(conn, data, :bad_request)

  def render_response(conn, data, status) do
    conn
    |> put_status(status)
    |> json(%{result: data})
  end
end
