defmodule TestPhonix.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :value, :text
      add :question_id, references(:questions, on_delete: :delete_all, null: false)
      add :correct, :integer
      timestamps()
    end
  end
end
