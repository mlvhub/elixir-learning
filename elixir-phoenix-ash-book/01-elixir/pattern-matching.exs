defmodule Misc do
  def lists() do
    shopping_list = ["apple", "orange", "banana", "pineapple"]

    [head | tail] = shopping_list
    IO.puts(head)
    IO.puts(Enum.join(tail, ", "))

    [first_product, second_product | tail] = shopping_list
    IO.puts(first_product)
    IO.puts(second_product)
    IO.puts(Enum.join(tail, ", "))
  end

  def maps() do
    product_prices = %{apple: 0.5, orange: 0.7, pineapple: 1}

    %{orange: price} = product_prices
    IO.puts("Oranges cost #{price}")
  end

  def strings do
    user = "Stefan Wintermeyer"
    "Stefan " <> last_name = user
    IO.puts("Lastname = #{last_name}")
  end
end

defmodule Area do
  def circle(:exact, radius) do
    3.14159265359 * radius * radius
  end

  def circle(:normal, radius) do
    3.14 * radius * radius
  end

  def circle(radius) do
    circle(:normal, radius)
  end
end

defmodule Law do
  def can_vote?(age) when is_integer(age) and age > 17 do
    true
  end

  def can_vote?(age) when is_integer(age) do
    false
  end

  def can_vote?(_age) do
    raise ArgumentError, "age should be an integer"
  end
end

defmodule User do
  # function header with a default value for the second argument
  def greet(name, opts \\ [])

  def greet(name, role: "admin") do
    "Welcome, #{name}. You have admin privileges."
  end

  def greet(name, role: "moderator") do
    "Welcome, #{name}. You can moderate content."
  end

  def greet(name, []) do
    "Welcome, #{name}."
  end
end
