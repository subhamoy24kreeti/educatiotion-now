defmodule TestPhonix.QuestionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestPhonix.Questions` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        question: "some question"
      })
      |> TestPhonix.Questions.create_question()

    question
  end
end
