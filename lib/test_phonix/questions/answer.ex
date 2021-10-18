defmodule TestPhonix.Questions.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestPhonix.Questions.Question
  schema "answers" do
    field :answer, :string
    belongs_to :question, Question
    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:answer, :question_id])
    |> validate_required([:answer, :question_id])
    |> assoc_constraint(:question)
  end
end
