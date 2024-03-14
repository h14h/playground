defmodule Budget do
  @moduledoc """
  Module Budget contains the definition of a Budget struct as well as
  associated functions.
  """
  defstruct [:name, :incomes, :expenses]

  @type t :: %__MODULE__{
          name: String.t(),
          incomes: [CashFlow.t()],
          expenses: [CashFlow.t()]
        }

  @spec new(String.t(), [CashFlow.t()], [CashFlow.t()]) :: __MODULE__.t()
  def new(name, incomes, expenses) do
    %__MODULE__{name: name, incomes: incomes, expenses: expenses}
  end

  @spec new(String.t()) :: __MODULE__.t()
  def new(name) do
    %__MODULE__{name: name, incomes: [], expenses: []}
  end

  @spec add_income(__MODULE__.t(), CashFlow.t()) :: __MODULE__.t()
  def add_income(budget, income) do
    %__MODULE__{budget | incomes: [income | budget.incomes]}
  end

  @spec add_expense(__MODULE__.t(), CashFlow.t()) :: __MODULE__.t()
  def add_expense(budget, expense) do
    %__MODULE__{budget | expenses: [expense | budget.expenses]}
  end

  def funds_on_date(budget, date, start_date \\ beginning_of_year()) do
    incomes =
      budget.incomes
      |> Enum.map(&CashFlow.amount/1)
      |> Enum.sum()

    expenses =
      budget.expenses
      |> Enum.map(&CashFlow.amount/1)
      |> Enum.sum()

    incomes - expenses
  end

  defp beginning_of_year() do
    {current_year, _} = Tempo.utc_today() |> Tempo.year_of_era()

    Date.new!(current_year, 1, 1)
  end
end
