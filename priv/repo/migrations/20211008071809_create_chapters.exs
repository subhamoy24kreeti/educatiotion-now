defmodule TestPhonix.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :title, :string
      add :description, :text
      add :subject_id, references(:subjects, on_delete: :delete_all, null: false)
      timestamps()
    end

    create index(:chapters, [:subject_id])
  end
end
