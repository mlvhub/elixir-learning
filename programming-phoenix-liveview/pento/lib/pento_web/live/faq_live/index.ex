defmodule PentoWeb.FaqLive.Index do
  use PentoWeb, :live_view

  alias Pento.Faqs
  alias Pento.Faqs.Faq

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :faq_collection, Faqs.list_faq())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Faq")
    |> assign(:faq, Faqs.get_faq!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Faq")
    |> assign(:faq, %Faq{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Faq")
    |> assign(:faq, nil)
  end

  @impl true
  def handle_info({PentoWeb.FaqLive.FormComponent, {:saved, faq}}, socket) do
    {:noreply, stream_insert(socket, :faq_collection, faq)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    faq = Faqs.get_faq!(id)
    {:ok, _} = Faqs.delete_faq(faq)

    {:noreply, stream_delete(socket, :faq_collection, faq)}
  end

  @impl true
  def handle_event("upvote_faq", %{"id" => id}, socket) do
    faq = Faqs.get_faq!(id)
    params = %{"vote" => faq.vote + 1}
    save_faq(socket, faq, params)
  end

  @impl true
  def handle_event("downvote_faq", %{"id" => id}, socket) do
    faq = Faqs.get_faq!(id)
    params = %{"vote" => faq.vote - 1}
    save_faq(socket, faq, params)
  end

  defp save_faq(socket, faq, faq_params) do
    IO.inspect(socket.assigns.faq, label: "Assigns")
    IO.inspect(faq, label: "FAQ")
    IO.inspect(faq_params, label: "FAQ PARAMS")

    case Faqs.update_faq(faq, faq_params) do
      {:ok, faq} ->
        # TODO: show success message
        IO.puts("FAQ update accordingly")

        {:noreply,
         socket
         |> stream_insert(:faq_collection, faq)
         |> put_flash(:info, "Faq updated successfully")}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset, label: "Error Changeset")

        # TODO: show errors
        {:noreply, socket}
    end
  end
end
