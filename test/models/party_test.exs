defmodule GoodTimes.PartyTest do
  use GoodTimes.ModelCase

  alias GoodTimes.Party

  @valid_attrs %{location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Party.changeset(%Party{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Party.changeset(%Party{}, @invalid_attrs)
    refute changeset.valid?
  end
end
