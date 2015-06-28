defmodule GoodTimes.RegistrationControllerTest do
	use GoodTimes.ConnCase

	alias GoodTimes.User

	@valid_registration %{email: "test@test.com", password: "password", password_confirmation: "password", username: "username"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

	test "registers a new user and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_registration
    assert redirected_to(conn) == user_path(conn, :index)
    assert Repo.get_by(User, @valid_registration)
  end
	
end