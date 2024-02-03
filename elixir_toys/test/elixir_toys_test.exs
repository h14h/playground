defmodule ElixirToysTest do
  use ExUnit.Case
  doctest ElixirToys

  test "greets the world" do
    assert ElixirToys.hello() == :world
  end
end
