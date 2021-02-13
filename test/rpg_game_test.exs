defmodule RpgGameTest do
  use ExUnit.Case
  doctest RpgGame

  test "greets the world" do
    assert RpgGame.hello() == :world
  end
end
