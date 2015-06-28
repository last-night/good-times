defmodule GoodTimes.Repo.Migrations.CreatePartyGoer do
  use Ecto.Migration

  def change do
    create table(:party_goers) do
      add :party_id, :integer
      add :user_id, :integer
      add :drink_count, :integer

      timestamps
    end
    create index(:party_goers, [:party_id])
    create index(:party_goers, [:user_id])

  end
end
