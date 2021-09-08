defmodule PraElixir.BookSearch do
  require Logger
  require HTTPoison
  require Poison

  def fetch(key) do
    Logger.info("Fetching #{key}")

    books_search_url(key)
    |> HTTPoison.get
    |> handle_response
  end

  def books_search_url(key) do
    "https://www.googleapis.com/books/v1/volumes?q=#{key}"
  end

  def handle_response({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")
    Logger.debug(fn -> inspect(body) end)

    {
      status_code |> check_for_error,
      body |> Poison.Parser.parse!
    }
  end

  def check_for_error(200), do: :ok
  def check_for_error(_), do: :error
end
