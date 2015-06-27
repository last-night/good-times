defmodule GoodTimes.PageController do
  use GoodTimes.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
