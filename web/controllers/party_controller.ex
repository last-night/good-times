defmodule GoodTimes.PartyController do
  use GoodTimes.Web, :controller

  alias GoodTimes.Party

  plug GoodTimes.Plug.Authenticate
  plug :scrub_params, "party" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    parties = Repo.all(Party)
    render(conn, "index.html", parties: parties)
  end

  def new(conn, _params) do
    changeset = Party.changeset(%Party{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"party" => party_params}) do
    changeset = Party.changeset(%Party{}, party_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Party created successfully.")
      |> redirect(to: party_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    party = Repo.get(Party, id)
    render(conn, "show.html", party: party)
  end

  def edit(conn, %{"id" => id}) do
    party = Repo.get(Party, id)
    changeset = Party.changeset(party)
    render(conn, "edit.html", party: party, changeset: changeset)
  end

  def update(conn, %{"id" => id, "party" => party_params}) do
    party = Repo.get(Party, id)
    changeset = Party.changeset(party, party_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Party updated successfully.")
      |> redirect(to: party_path(conn, :index))
    else
      render(conn, "edit.html", party: party, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    party = Repo.get(Party, id)
    Repo.delete(party)

    conn
    |> put_flash(:info, "Party deleted successfully.")
    |> redirect(to: party_path(conn, :index))
  end
end
