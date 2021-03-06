defmodule PhoenixChatbotWeb.RoomChannel do
  use PhoenixChatbot.Web, :channel
  require Logger

  def join("room:" <> _uid, payload, socket) do
    authorize(payload, fn ->
      {:ok, socket}
    end)
  end

  def handle_in("message", payload, socket) do
    Logger.debug "#{inspect payload}"
    broadcast socket, "message", payload
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
