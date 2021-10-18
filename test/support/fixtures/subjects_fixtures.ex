defmodule TestPhonix.SubjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestPhonix.Subjects` context.
  """

  @doc """
  Generate a subject.
  """
  def subject_fixture(attrs \\ %{}) do
    {:ok, subject} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> TestPhonix.Subjects.create_subject()

    subject
  end
end
