defmodule Schedule do
  @moduledoc """
  A Schedule is a collection of time intervals.

  Units specified presuming A.D. years on the Gregorian calendar (for now)
  """
  defstruct [:years, :months, :weeks, :days, :hours, :minutes]

  @type t :: %__MODULE__{
          years: Interval.t() | nil,
          months: Interval.t() | nil,
          weeks: Interval.t() | nil,
          days: Interval.t() | nil,
          hours: Interval.t() | nil,
          minutes: Interval.t() | nil
        }

  @spec new([{Tidsenhet.t(), Interval.interval_sources()}]) :: :world
  def new(intervals) do
    Enum.reduce(intervals, %__MODULE__{}, fn {unit, interval}, acc ->
      interval = Interval.new(interval, unit)
      Map.put(acc, unit, interval)
    end)
  end
end
