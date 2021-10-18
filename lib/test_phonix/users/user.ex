defmodule TestPhonix.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bcrypt
  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :role, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :address1, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :latitude, :float
    field :longitude, :float
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :password, :email])
    |> validate_required([:first_name, :last_name, :password, :email])
    |> validate_length(:password, min: 6, max: 100)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_pass_hash()
    |> put_role()

  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass }} ->
        put_change(changeset, :password_hash, Bcrypt.add_hash(pass).password_hash)
      _ ->
        changeset
    end
  end

  defp put_role(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :role, "user")
      _ ->
        changeset
    end
  end

end
