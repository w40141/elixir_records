defmodule PraElixir.BookSearch do
  require Logger
  require HTTPoison
  require Jason

  def fetch(keyword) do
    Logger.info("Fetching #{keyword}")

    books_search_url(keyword)
    |> HTTPoison.get()
    |> handle_response()
  end

  def books_search_url(keyword) do
    "https://www.googleapis.com/books/v1/volumes?q=#{keyword}"
  end

  def handle_response({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")

    {
      status_code |> check_for_error,
      body |> Jason.decode!()
    }
  end

  def check_for_error(200), do: :ok
  def check_for_error(_), do: :error

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    IO.puts("Error fetching from Github: #{error["message"]}")
    System.halt(2)
  end

  def main(argv) do
    argv
    # |> parse_args
    |> process
  end

  def process(:help) do
    IO.puts("""
    usage: issues <keyword>
    """)
  end

  def process(keyword) do
    fetch(keyword)
    |> decode_response()
  end

  def parse_args(argv) do
    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> elem(1)
    |> args_to_internal_representation()
  end

  def args_to_internal_representation([keyword]) do
    {keyword}
  end

  def args_to_internal_representation(_) do
    :help
  end
end
