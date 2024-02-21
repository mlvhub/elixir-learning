defmodule TaskboardWeb.HomeLive.Index do
  use TaskboardWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  @spec handle_params(any(), any(), %{
          :assigns => atom() | %{:live_action => :index, optional(any()) => any()},
          optional(any()) => any()
        }) :: {:noreply, map()}
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Landing Page")
  end
end
