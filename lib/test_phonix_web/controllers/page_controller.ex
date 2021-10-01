defmodule TestPhonixWeb.PageController do
  use TestPhonixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
