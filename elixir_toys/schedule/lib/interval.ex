defmodule Interval do
  defstruct [:start, :stop, :unit]

  @type t :: %__MODULE__{
          start: start(),
          stop: stop(),
          unit: Tidsenhet.t()
        }

  @type start :: non_neg_integer()
  @type stop :: non_neg_integer()

  @type interval_source :: integer() | Range.t(start(), stop())

  defguard is_range(range) when is_map(range) and range.__struct__ == Range
  defguard is_continuous_range(range) when is_range(range) and range.step == 1

  @spec new(interval_source(), Tidsenhet.unit()) :: t()
  def new(interval_source, unit)

  def new(int, unit) when is_integer(int), do: from_integer(int, unit)
  def new(range, unit) when is_continuous_range(range), do: from_range(range, unit)

  @spec new(start(), stop(), Tidsenhet.unit()) :: t()
  def new(start, stop, unit) do
    %__MODULE__{
      start: start,
      stop: stop,
      unit: unit
    }
  end

  @spec from_integer(integer(), Tidsenhet.unit()) :: t()
  def from_integer(int, unit) do
    new(int, int, unit)
  end

  @spec from_range(Range.t(), Tidsenhet.unit()) :: t()
  def from_range(range, unit) do
    new(range.first, range.last, unit)
  end
end
