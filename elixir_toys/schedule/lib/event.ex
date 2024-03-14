defmodule Event do
  @moduledoc """
  An Event is a list of time intervals for a given time unit.

  This is how recurrences are defined.
  """
  @type interval_set :: nonempty_list(integer()) | Interval.interval_source()

  defguard is_range(range) when is_map(range) and range.__struct__ == Range

  @spec new(interval_set(), Tidsenhet.t()) :: :world
  def new(list, _units) when is_list(list) do
    # TODO
  end

  @spec new(Range.t(), Tidsenhet.t()) :: [Interval.t()]
  def new(range, _units) when is_range(range) and range.step > 1 do
    # TODO
  end

  @spec new(Range.t(), Tidsenhet.t()) :: [Interval.t()]
  def new(range, _units) when is_range(range) and range.step < 0 do
    # TODO
  end

  @spec new(Range.t(), Tidsenhet.t()) :: [Interval.t()]
  def new(range, units) when is_range(range) and range.step == 1 do
    [Interval.from_range(range, units)]
  end

  @spec new(integer(), Tidsenhet.t()) :: [Interval.t()]
  def new(int, units) when is_integer(int) do
    [Interval.from_integer(int, units)]
  end
end
