defmodule Tutorials.Lists.Map do


  def map(elements, function, acc \\ [])

  def map([], _, acc) do
    acc
  end


  def map([h | t], function, acc) do
    map(t, function, [function.(h) | acc])
  end

end


# Tutorials.Lists.Rev.rev(Tutorials.Lists.Map.map([1,2,3], fn x -> x**2 end))

# Tutorials.Lists.Map.map([1,2,3], fn x -> x**2 end) |> Tutorials.Lists.Rev.rev
