defmodule TestPhonix.Subjects.Subject do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestPhonix.Chapters.Chapter

  schema "subjects" do
    field :description, :string
    field :title, :string
    has_many :chapters, Chapter
    timestamps()
  end

  @doc false
  def changeset(subject, attrs) do
    subject
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
