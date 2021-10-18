defmodule TestPhonix.Options do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false
  alias TestPhonix.Repo

  alias TestPhonix.Questions.Option

  def list_options do
    Repo.all(Option)
  end

  def get_option!(id), do: Repo.get!(Option, id)

  def create_option(attrs \\ %{}) do
    %Option{}
    |> Option.changeset(attrs)
    |> Repo.insert()
  end

  def update_option(%Option{} = option, attrs) do
    option
    |> Option.changeset(attrs)
    |> Repo.update()
  end

  def delete_option(%Option{} = option) do
    Repo.delete(option)
  end

  def change_option(%Option{} = option, attrs \\ %{}) do
    Option.changeset(option, attrs)
  end
end
