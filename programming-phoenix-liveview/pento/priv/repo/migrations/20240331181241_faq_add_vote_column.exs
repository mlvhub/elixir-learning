defmodule Pento.Repo.Migrations.AddVoteColumnToFaq do
  use Ecto.Migration

  def change do
    alter table(:faq) do
      add :vote, :integer
    end
  end
end
