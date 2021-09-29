defmodule DemoTimer.PubSub do
  def subscribe(topic) do
    Phoenix.PubSub.subscribe(__MODULE__, topic)
  end

  def broadcast(topic, message) do
    Phoenix.PubSub.broadcast(__MODULE__, topic, message)
  end

  def subscribe_to_timer(topic) do
    with {:ok, timer} <- GenTimer.subscribe(topic) do
      timer
    else
      {:error, :unknown} ->
        nil

      error ->
        error
    end
  end
end
