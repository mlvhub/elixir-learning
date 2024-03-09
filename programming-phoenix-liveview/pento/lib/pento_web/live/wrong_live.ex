defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    max_number = 8
    secret_number = :rand.uniform(max_number)

    {:ok,
     assign(
       socket,
       score: 0,
       message: "Make a guess:",
       max_number: max_number,
       secret_number: secret_number,
       time: time()
     )}
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    {score, message, secret_number} =
      if guess == socket.assigns.secret_number |> to_string do
        score = socket.assigns.score + 1
        message = "You guessed! Try guessing again!"
        secret_number = :rand.uniform(socket.assigns.max_number)
        {score, message, secret_number}
      else
        score = socket.assigns.score - 1
        message = "Your guess: #{guess}. Wrong. Guess again."
        secret_number = socket.assigns.secret_number
        {score, message, secret_number}
      end

    {
      :noreply,
      assign(
        socket,
        score: score,
        message: message,
        secret_number: secret_number,
        time: time()
      )
    }
  end

  def time() do
    DateTime.utc_now() |> to_string()
  end
end
