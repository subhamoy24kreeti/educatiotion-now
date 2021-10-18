defmodule TestPhonix.ChaptersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestPhonix.Chapters` context.
  """

  @doc """
  Generate a chapter.
  """
  def chapter_fixture(attrs \\ %{}) do
    {:ok, chapter} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> TestPhonix.Chapters.create_chapter()

    chapter
  end
end
