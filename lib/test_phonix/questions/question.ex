defmodule TestPhonix.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestPhonix.Chapters.Chapter
  alias TestPhonix.Questions.Option
  alias TestPhonix.Questions.Answer

  schema "questions" do
    field :question, :string
    belongs_to :chapter, Chapter
    has_many :options, Option
    has_one :answer, Answer
    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :chapter_id])
    |> validate_required([:question, :chapter_id])
    |> assoc_constraint(:chapter)
  end
end
