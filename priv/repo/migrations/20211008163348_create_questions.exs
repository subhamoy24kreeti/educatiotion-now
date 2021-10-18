defmodule TestPhonix.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :text
      add :chapter_id, references(:chapters, on_delete: :delete_all, null: false)
      add :multiple, :integer
      timestamps()
    end
  end
end
