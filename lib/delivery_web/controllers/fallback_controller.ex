defmodule DeliveryWeb.FallbackController do
  use DeliveryWeb, :controller

  alias DeliveryWeb.ErrorView

  #always execute call function by convention
  def call(conn, {:error, %{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
