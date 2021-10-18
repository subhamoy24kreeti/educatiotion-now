defmodule TestPhonixWeb.CommonHelpers do

  alias TestPhonix.Subjects
  alias TestPhonix.Chapters

  def get_subjects do
    Subjects.list_subjects_map
  end

  def get_chapters do
    Chapters.list_chapters_map
  end

end
