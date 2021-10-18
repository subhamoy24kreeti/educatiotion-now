defmodule TestPhonix.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :title, :string
      add :description, :text

      timestamps()
    end
  end
end
