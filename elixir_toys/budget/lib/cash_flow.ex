defmodule CashFlow do
  @moduledoc """
  Module CashFlow contains the definition of a CashFlow struct as well as
  associated functions.
  """
  defstruct [:cadence, :amount, :anchor_date]

  @type t :: %__MODULE__{
          cadence: atom(),
          amount: integer(),
          anchor_date: Tempo.t()
        }

  @spec new(atom(), integer(), Tempo.t()) :: __MODULE__.t()
  def new(cadence, amount, anchor_date) do
    %__MODULE__{cadence: cadence, amount: amount, anchor_date: anchor_date}
  end

  @spec amount(%__MODULE__{}) :: integer()
  def amount(%__MODULE__{amount: amount}) do
    amount
  end

  @spec cadence(%__MODULE__{}) :: atom()
  def cadence(%__MODULE__{cadence: cadence}) do
    cadence
  end

  @spec anchor_date(%__MODULE__{}) :: Tempo.t()
  def anchor_date(%__MODULE__{anchor_date: anchor_date}) do
    anchor_date
  end

  @spec next_date(%__MODULE__{}, Tempo.t()) :: Tempo.t()
  def next_date(%__MODULE__{cadence: cadence, anchor_date: anchor_date}, date) do
    # diff = date - anchor date
    # cadence count = floor(diff / cadence length) + diff / abs(diff) 
    # next date = anchor date + cadence count * cadence length
  end
end
