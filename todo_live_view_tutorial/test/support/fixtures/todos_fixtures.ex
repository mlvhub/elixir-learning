defmodule TodoLiveViewTutorial.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoLiveViewTutorial.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        text: "some text"
      })
      |> TodoLiveViewTutorial.Todos.create_todo()

    todo
  end
end
