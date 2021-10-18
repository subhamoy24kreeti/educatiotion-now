defmodule TestPhonix.Answers do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false
  alias TestPhonix.Repo

  alias TestPhonix.Questions.Answer

  def list_answers do
    Repo.all(Answer)
  end

  def get_answer!(id), do: Repo.get!(Answer, id)

  def create_answer(attrs \\ %{}) do
    %Answer{}
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  def update_Answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  def change_answer(%Answer{} = answer, attrs \\ %{}) do
    Answer.changeset(answer, attrs)
  end
end
