defmodule Sentry.SentryController do
  use Sentry.Web, :controller

  def execute(conn, params) do
    data = map_elixir_to_js(params)

    if map_size(data) > 0 do
      System.cmd data.command, [], cd: data.options["cwd"], into: IO.stream(:stdio, :line)
    end
    json conn, nil
  end

  def ping(conn, _params) do
    response = "Pong"

    json conn, response
  end

  defp map_elixir_to_js(map) do
    Map.new(map, fn {key, value} -> {String.to_atom(key), value} end)
  end

end
