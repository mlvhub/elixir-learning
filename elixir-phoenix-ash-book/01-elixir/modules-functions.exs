defmodule Greeting do
  def greet() do
    IO.puts("Hello, world!")
  end

  def greet(name) do
    IO.puts("Hello, " <> name <> "!")
  end

  def public_greet() do
    secret_greet()
    |> IO.puts()
  end

  # private funtion
  defp secret_greet do
    "Secret, hello!"
  end
end
