# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Pento.Catalog
alias Pento.Faqs

products = [
  %{
    name: "Chess",
    description: "The classic strategy game",
    sku: 5_678_910,
    unit_price: 10.00
  },
  %{
    name: "Tic-Tac-Toe",
    description: "The game of Xs and Os",
    sku: 11_121_314,
    unit_price: 3.00
  },
  %{
    name: "Table Tennis",
    description: "Bat the ball back and forth. Don't miss!",
    sku: 15_222_324,
    unit_price: 12.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)

faqs = [
  %{
    question: "How to order the query by a field?",
    answer: "`Repo.all(from f in Faq, order_by: [desc: f.vote])`",
    vote: 0
  },
  %{
    question: "Can you name the context and the schema with the same name?",
    answer: "No.",
    vote: 0
  }
]

Enum.each(faqs, fn faq ->
  Faqs.create_faq(faq)
end)
