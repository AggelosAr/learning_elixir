defmodule Tutorials.Lists.Map do


  def map(elements, function, acc \\ [])

  def map([], _, acc) do
    acc |> Enum.reverse
  end


  def map([h | t], function, acc) do
    map(t, function, [function.(h) | acc])
  end

end


# Tutorials.Lists.Rev.rev(Tutorials.Lists.Map.map([1,2,3], fn x -> x**2 end))

# Tutorials.Lists.Map.map([1,2,3], fn x -> x**2 end) |> Tutorials.Lists.Rev.rev




# # example 2

# double  = fn x -> x * 2 end

# [1,2,3,4] |> Tutorials.Lists.Rev.rev |> Tutorials.Lists.Map.map(double)

# or

# [1,2,3,4] |> Enum.reverse |> Tutorials.Lists.Map.map(double)
