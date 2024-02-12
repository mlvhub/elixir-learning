defmodule PrintNum do
  def print_num(num) do
    if num > 0 do
      IO.puts("The number is positive!")
    end

    unless num > 0 do
      IO.puts("The number is negative!")
    end

    if num > 3, do: IO.puts("#{num} is greater than 3")

    case num do
      1 ->
        IO.puts("It's one!")

      2 ->
        IO.puts("It's two!")

      _ ->
        IO.puts("It's something else: #{num}")
    end

    cond do
      num < 10 ->
        IO.puts("#{num} is less than 10")

      num < 20 ->
        IO.puts("#{num} is less than 20 but greater than or equal to 10")

      true ->
        IO.puts("#{num} is greater than or equal to 20")
    end
  end

  def with_for() do
    fruits = [{:apple, 5}, {:orange, 3}, {:banana, 4}]

    with {:apple, count} <- List.keyfind(fruits, :apple, 0) do
      IO.puts("Found #{count} apples!")
    else
      _ -> IO.puts("No apples found.")
    end
  end

  def for_comprehension do
    for num <- [1, 2, 3, 4, 5],
        do: IO.puts(num * num)
  end
end
