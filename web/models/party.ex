defmodule GoodTimes.Party do
  use GoodTimes.Web, :model

  schema "parties" do
    field :name, :string
    field :location, :string

    timestamps
  end

  @required_fields ~w(name location)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
