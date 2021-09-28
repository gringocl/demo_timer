defmodule DemoTimerWeb.PageController do
  use DemoTimerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
