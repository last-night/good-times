defmodule GoodTimes.Repo.Migrations.CreateParty do
  use Ecto.Migration

  def change do
    create table(:parties) do
      add :name, :string
      add :location, :string

      timestamps
    end

  end
end
