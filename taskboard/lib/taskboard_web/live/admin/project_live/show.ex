defmodule TaskboardWeb.Admin.ProjectLive.Show do
  use TaskboardWeb, :live_view

  alias Taskboard.Core.Projects

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:project, Projects.get_project!(id))}
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
end
