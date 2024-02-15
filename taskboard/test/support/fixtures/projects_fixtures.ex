defmodule Taskboard.Core.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Taskboard.Core.Projects` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Taskboard.Core.Projects.create_project()

    project
  end
end
