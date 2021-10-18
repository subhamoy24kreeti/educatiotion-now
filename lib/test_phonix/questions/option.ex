defmodule TestPhonix.Questions.Option do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestPhonix.Questions.Question
  schema "options" do
    field :value, :string
    field :correct, :integer
    belongs_to :question, Question
    timestamps()
  end

  @doc false
  def changeset(option, attrs) do
    option
    |> cast(attrs, [:value, :question_id, :correct])
    |> validate_required([:value, :question_id, :correct])
    |> assoc_constraint(:question)
  end
end
