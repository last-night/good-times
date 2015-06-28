defmodule GoodTimes.UserTest do
  use GoodTimes.ModelCase

  alias GoodTimes.User

  @valid_attrs %{email: "test@test.com", password: "password", password_confirmation: "password", username: "username"}
  @invalid_attrs %{}
  @invalid_email %{email: "bad email", password: "password", password_confirmation: "password", username: "username"}
  @invalid_password_matches %{email: "test@test.com", password: "password-fake", password_confirmation: "password", username: "username"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset without data" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid email" do
    changeset = User.changeset(%User{}, @invalid_email)
    refute changeset.valid?
  end

  test "changeset with non-matching passwords" do
    changeset = User.changeset(%User{}, @invalid_password_matches)
    refute changeset.valid?
  end
end
