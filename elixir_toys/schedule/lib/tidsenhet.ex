defmodule Tidsenhet do
  @moduledoc """
  Tidsenhet is the Swedish word for "unit of time".

  This module provides types and functions for working with, and converting
  between, units of time. One of the key insights is that temporal unit
  conversions can be variable, and indeterminate without additional context.

  For example, the number of hours in a month can vary depending on the length
  of the month, and even that length cannot be determined exactly without also
  knowing whether it is a leap year.

  For that reason, this module makes no attempt to ascertain this context, and
  instead opts to clearly delineate between static and variable unit
  conversions, and for the latter, requiring the requisite context to be
  provided.

  Additionally, due to the yet additional complexity of leap seconds (both
  positive and negative), compared to the diminishing practical relevance of
  seconds in day-to-day human activities, the finest precision this module
  attempts to support is minutes.
  """
  @type t ::
          :years
          | :months
          | :weeks
          | :days
          | :hours
          | :minutes

  # Static unit conversions
  @minutes_in_hour 60
  @hours_in_day 24
  @days_in_week 7
  @months_in_year 12

  @minutes_in_day @minutes_in_hour * @hours_in_day
  @minutes_in_week @minutes_in_day * @days_in_week

  @hours_in_week @hours_in_day * @days_in_week

  # Static ranges
  @minutes_of_hour 0..(@minutes_in_hour - 1)
  @minutes_of_day 0..(@minutes_in_day - 1)
  @minutes_of_week 0..(@minutes_in_week - 1)

  @hours_of_day 0..(@hours_in_day - 1)
  @hours_of_week 0..(@hours_in_week - 1)

  @days_of_week 1..@days_in_week

  @months_of_year 1..@months_in_year

  def minutes_of_hour(), do: @minutes_of_hour
  def minutes_of_day(), do: @minutes_of_day
  def minutes_of_week(), do: @minutes_of_week

  def hours_of_day(), do: @hours_of_day
  def hours_of_week(), do: @hours_of_week

  def days_of_week(), do: @days_of_week

  def months_of_year(), do: @months_of_year

  # Variable ranges
  def minutes_of_month(days_in_month), do: 0..(@minutes_in_day * days_in_month - 1)
  def minutes_of_year(days_in_year), do: 0..(@minutes_in_day * days_in_year - 1)

  def hours_of_month(days_in_month), do: 0..(@hours_in_day * days_in_month - 1)
  def hours_of_year(days_in_year), do: 0..(@hours_in_day * days_in_year - 1)

  def days_of_month(days_in_month), do: 1..days_in_month
  def days_of_year(days_in_year), do: 1..days_in_year

  # Static range getters
  def range_for(:minutes, :hour), do: minutes_of_hour()
  def range_for(:minutes, :day), do: minutes_of_day()
  def range_for(:minutes, :week), do: minutes_of_week()
  def range_for(:hours, :day), do: hours_of_day()
  def range_for(:hours, :week), do: hours_of_week()
  def range_for(:days, :week), do: days_of_week()
  def range_for(:months, :year), do: months_of_year()

  # Dynamic range getters
  def range_for(:minutes, :month, days_in_month), do: minutes_of_month(days_in_month)
  def range_for(:minutes, :year, days_in_year), do: minutes_of_year(days_in_year)
  def range_for(:hours, :month, days_in_month), do: hours_of_month(days_in_month)
  def range_for(:hours, :year, days_in_year), do: hours_of_year(days_in_year)
  def range_for(:days, :month, days_in_month), do: days_of_month(days_in_month)
  def range_for(:days, :year, days_in_year), do: days_of_year(days_in_year)
end
