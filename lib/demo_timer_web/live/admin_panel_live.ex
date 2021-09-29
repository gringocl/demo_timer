defmodule DemoTimerWeb.AdminPanelLive do
  use Phoenix.LiveView

  alias DemoTimer.PubSub

  @timer_topic "demo:timer"
  @demo_topic "demo"
  
  def mount(_params, _session, socket) do
    topic =
      case GenTimer.lookup(@timer_topic) do
        [] -> nil
        _ ->
          PubSub.subscribe_to_timer(@timer_topic)
          @timer_topic
      end

    {:ok, assign(socket, default_time: nil, topic: topic)}
  end

  def handle_event("start_timer", _, socket) do
    GenTimer.start(socket.assigns.topic)
    {:noreply, socket}
  end

  def handle_event("create_timer", %{"duration" => duration}, socket) do
    GenTimer.initialize(parse_duration(duration), @timer_topic)

    broadcast_to_event({:timer_created, @timer_topic})

    {:noreply, assign(socket, topic: @timer_topic)}
  end

  def handle_event("pause_timer", _, socket) do
    GenTimer.pause(socket.assigns.topic)
    {:noreply, socket}
  end

  def handle_event("reset_timer", _, socket) do
    GenTimer.reset(socket.assigns.topic)
    {:noreply, socket}
  end

  def handle_info({:finished, _timer}, socket) do
    broadcast_to_event({:removed, nil})
    {:noreply, assign(socket, topic: nil) |> IO.inspect()}
  end

  def handle_info(_msg, socket) do
    {:noreply, socket}
  end

  defp broadcast_to_event(msg) do
    PubSub.broadcast(@demo_topic, msg)
  end

  defp parse_duration("") do
    120
  end

  defp parse_duration(duration) when is_bitstring(duration) do
    String.to_integer(duration)
  end
end
