defmodule GoodTimes.PartyGoerTest do
  use GoodTimes.ModelCase

  alias GoodTimes.PartyGoer

  @valid_attrs %{party: nil, user: nil}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PartyGoer.changeset(%PartyGoer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PartyGoer.changeset(%PartyGoer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
