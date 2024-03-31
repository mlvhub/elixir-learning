defmodule Pento.Repo.Migrations.CreateFaq do
  use Ecto.Migration

  def change do
    create table(:faq) do
      add :question, :string
      add :answer, :string

      timestamps(type: :utc_datetime)
    end
  end
end
