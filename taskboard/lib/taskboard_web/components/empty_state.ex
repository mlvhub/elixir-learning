defmodule TaskboardWeb.Components.EmptyState do
  use TaskboardWeb, :html

  # this help heex know if the component is used properly
  attr(:text, :string)
  attr(:image, :string)

  def empty_state(assigns) do
    ~H"""
    <div>
      <h2 class="text-2xl font-semibold tracking-tight sm:text-center sm:text-4xl">
        <%= @text %>
      </h2>
      <div class="mt-5 mx-auto w-full max-w-xs">
        <img
          alt={@text}
          src={~p"/images/#{@image}"}
          class="w-full max-w-none rounded-xl ring-1 ring-gray-400/10 md:-ml-4 lg:-ml-0"
        />
      </div>
    </div>
    """
  end
end
