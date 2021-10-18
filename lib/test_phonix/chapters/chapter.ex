defmodule TestPhonix.Chapters.Chapter do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestPhonix.Subjects.Subject
  alias TestPhonix.Questions.Question

  schema "chapters" do
    field :description, :string
    field :title, :string
    belongs_to :subject, Subject
    has_many :questions, Question
    timestamps()
  end

  @doc false
  def changeset(chapter, attrs) do
    chapter
    |> cast(attrs, [:title, :description, :subject_id])
    |> validate_required([:title, :description, :subject_id])
    |> assoc_constraint(:subject)
  end
end
