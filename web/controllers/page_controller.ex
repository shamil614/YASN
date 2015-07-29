defmodule Yasn.PageController do
  use Yasn.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
