defmodule GoodTimes.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :encrypted_password, :string
      add :password, :string, virtual: true
      add :password_confirmation, :string, virtual: true

      timestamps
    end

  end
end
