defmodule Taskboard.Core.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset
  # add the association alias
  alias Taskboard.Core.Accounts.User

  schema "projects" do
    field :description, :string
    field :title, :string
    # remove this
    # field :owner_id, :id
    # use this for relationship and custom association name
    belongs_to :owner, User, foreign_key: :owner_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    # |> cast(attrs, [:title, :description])
    # |> validate_required([:title, :description])
    |> cast(attrs, [:title, :description, :owner_id])
    |> validate_required([:title, :description, :owner_id])
  end
end
