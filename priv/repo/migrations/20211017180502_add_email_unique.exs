defmodule TestPhonix.Repo.Migrations.AddEmailUnique do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :phone, :string
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:phone])
  end
end
