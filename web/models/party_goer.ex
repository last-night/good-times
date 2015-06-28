defmodule GoodTimes.PartyGoer do
  use GoodTimes.Web, :model

  schema "party_goers" do
    belongs_to :party, GoodTimes.Party
    belongs_to :user, GoodTimes.User

    field :drink_count, :integer

    timestamps
  end

  @required_fields ~w(user_id party_id)
  @optional_fields ~w(drink_count)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:user_id, scope: [:party_id], on: GoodTimes.Repo)
  end
end
