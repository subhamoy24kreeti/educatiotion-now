defmodule TestPhonix.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :answer, :text
      add :question_id, references(:questions, on_delete: :delete_all, null: false)
      timestamps()
    end
  end
end
