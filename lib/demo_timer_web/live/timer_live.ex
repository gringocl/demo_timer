defmodule DemoTimerWeb.TimerLive do
  use Phoenix.LiveView

  alias DemoTimer.{SvgTimerFormatter, PubSub}

  @cirle_radius 60 
  @full_dash_array round(@cirle_radius * 2 * :math.pi())

  @timer_topic "demo:timer"
  @demo_topic "demo"

  def mount(_params, session, socket) do
    timer = if connected?(socket) do
      PubSub.subscribe(@demo_topic)
      PubSub.subscribe_to_timer(@timer_topic)
    end

    {:ok,
     socket
     |> assign_timer(timer)
     |> assign(
       circle_radius: @cirle_radius,
       full_dash_array: @full_dash_array,
       topic: @timer_topic,
       timer_created?: !!timer,
     )}
  end

  def handle_info({:tick, timer}, socket) do
    {:noreply,
     socket
     |> assign_timer(timer)
     |> assign(hidden: false)}
  end

  def handle_info({:timer_created, topic}, socket) do
    timer = PubSub.subscribe_to_timer(topic)

    {:noreply, socket |> assign_timer(timer) |> assign(timer_created?: !!timer)}
  end

  def handle_info({:started, timer}, socket) do
    IO.inspect("Started")
    {:noreply,
     socket
     |> assign_timer(timer)
     |> assign(hidden: false)}
  end

  def handle_info({:initialized, timer}, socket) do
    {:noreply, assign_timer(socket, timer)}
  end

  def handle_info({:paused, _timer}, socket) do
    {:noreply, socket}
  end

  def handle_info({:finished, timer}, socket) do
    {:noreply, assign_timer(socket, timer)}
  end

  def handle_info({:removed, nil}, socket) do
    {:noreply, assign(socket, timer: nil)}
  end

  def handle_info(_msg, socket) do
    {:noreply, socket}
  end

  defp timer_started?(%{time_passed: time_passed, duration: duration, state: :active})
       when time_passed > 0 and time_passed < duration do
    true
  end

  defp timer_started?(_timer), do: false

  defp assign_timer(socket, nil) do
    assign(socket,
      stroke_dash_array: "#{@full_dash_array}",
      width: "100%",
      formatted_time: "0:00"
    )
  end

  defp assign_timer(socket, %{duration: _, time_passed: _} = timer) do
    assign(socket,
      width: SvgTimerFormatter.format_perc(timer),
      stroke_dash_array:
        SvgTimerFormatter.format_partial_stroke_dash_array(timer, @full_dash_array),
      formatted_time: SvgTimerFormatter.format_time_remaining(timer)
    )
  end
end
