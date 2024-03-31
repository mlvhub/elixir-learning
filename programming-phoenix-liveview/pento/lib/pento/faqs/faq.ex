defmodule Pento.Faqs.Faq do
  use Ecto.Schema
  import Ecto.Changeset

  schema "faq" do
    field :question, :string
    field :answer, :string
    field :vote, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(faq, attrs) do
    faq
    |> cast(attrs, [:question, :answer, :vote])
    |> validate_required([:question, :answer, :vote])
  end
end
