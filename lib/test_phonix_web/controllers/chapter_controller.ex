defmodule TestPhonixWeb.ChapterController do
  use TestPhonixWeb, :controller

  alias TestPhonix.Chapters
  alias TestPhonix.Chapters.Chapter

  def index(conn, _params) do
    chapters = Chapters.list_chapters()
    render(conn, "index.html", chapters: chapters)
  end

  def new(conn, _params) do
    changeset = Chapters.change_chapter(%Chapter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chapter" => chapter_params}) do
    case Chapters.create_chapter(chapter_params) do
      {:ok, chapter} ->
        conn
        |> put_flash(:info, "Chapter created successfully.")
        |> redirect(to: Routes.chapter_path(conn, :show, chapter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chapter = Chapters.get_chapter!(id)
    render(conn, "show.html", chapter: chapter)
  end

  def edit(conn, %{"id" => id}) do
    chapter = Chapters.get_chapter!(id)
    changeset = Chapters.change_chapter(chapter)
    render(conn, "edit.html", chapter: chapter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chapter" => chapter_params}) do
    chapter = Chapters.get_chapter!(id)

    case Chapters.update_chapter(chapter, chapter_params) do
      {:ok, chapter} ->
        conn
        |> put_flash(:info, "Chapter updated successfully.")
        |> redirect(to: Routes.chapter_path(conn, :show, chapter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chapter: chapter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chapter = Chapters.get_chapter!(id)
    {:ok, _chapter} = Chapters.delete_chapter(chapter)

    conn
    |> put_flash(:info, "Chapter deleted successfully.")
    |> redirect(to: Routes.chapter_path(conn, :index))
  end
end
