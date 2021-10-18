defmodule TestPhonix.Questions do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false
  alias TestPhonix.Repo

  alias TestPhonix.Questions.Question

  alias TestPhonix.Answers

  alias TestPhonix.Options


  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def create_question_answers(attrs \\ %{}) do
    case create_question(attrs) do
      {:ok, question} ->
        answer_params = %{ :question_id => question.id, :answer => attrs["answer"]}
        Answers.create_answer(answer_params)
        make_options(0, attrs["options"], attrs["correct"], question.id)
        {:ok, question}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, %Ecto.Changeset{} = changeset}
    end
  end

  def make_options(n, options, correct, question_id) do
    if n<4 do
      if n == correct do
        option = %{ :question_id => question_id, :value => Enum.at(options, n), :correct => 1 }
        Options.create_option(option)
      else
        option = %{ :question_id => question_id, :value => Enum.at(options, n), :correct => 0 }
        Options.create_option(option)
      end
      make_options(n+1, options, correct, question_id)
    end
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end
  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end
end
