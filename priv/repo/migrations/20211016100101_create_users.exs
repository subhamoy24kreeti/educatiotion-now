defmodule TestPhonix.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :password_hash, :string
      add :role, :string
      add :email, :string
      add :address1, :string
      add :city, :string
      add :state, :string
      add :country, :string
      add :latitude, :float
      add :longitude, :float
      timestamps()
    end
  end
end
