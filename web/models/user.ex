defmodule GoodTimes.User do
  use GoodTimes.Web, :model

  schema "users" do
    has_many :party_goers, PartyGoer
    has_many :parties, through: [:party_goers, :parties]

    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps
  end

  @required_fields ~w(username email password password_confirmation)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:password, min: 1)
    |> validate_length(:password_confirmation, min: 1)
    |> validate_confirmation(:password)
    |> validate_format(:email, ~r/@/)
    |> validate_unique(:username, on: GoodTimes.Repo, downcase: true)
  end
end
