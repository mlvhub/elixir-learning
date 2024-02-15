defmodule Taskboard.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :text
      # remove this
      # add :owner_id, references(:users, on_delete: :nothing)
      # add this to delete projects when user is deleted and require association
      add :owner_id, references(:users, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:projects, [:owner_id])
  end
end
