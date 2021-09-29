defmodule DemoTimer.SvgTimerFormatter do
  def format_perc(%{duration: duration, time_passed: time_passed, state: state}) do
    "#{calc_perc_dividend(duration, time_passed, state)}%" 
  end

  def format_partial_stroke_dash_array(
        %{duration: duration, time_passed: time_passed, state: state},
        full_dash_array
      ) do
    perc_complete = calc_perc_dividend(duration, time_passed, state) / 100
    "#{round(full_dash_array * perc_complete)}"
  end

  def format_time_remaining(%{duration: duration, time_passed: time_passed}) do
    ~T[00:00:00]
    |> Time.add(duration - time_passed)
    |> Calendar.strftime("%M:%S")
    |> remove_leading_zeros()
  end

  defp calc_perc_dividend(0, 0, _), do: 100

  defp calc_perc_dividend(duration, time_passed, :active) do
    round((duration - (time_passed + 1)) / duration * 100)
  end

  defp calc_perc_dividend(duration, time_passed, _) do
    round((duration - (time_passed)) / duration * 100)
  end

  defp remove_leading_zeros("0" <> rest), do: rest

  defp remove_leading_zeros(other), do: other
end
