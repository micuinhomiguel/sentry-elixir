defmodule Sentry.Router do
  use Sentry.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Sentry do
    pipe_through :api

    post "/execute", SentryController, :execute
    get "/ping", SentryController, :ping
  end
end
