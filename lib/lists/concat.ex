defmodule Tutorials.Lists.Concat do

  def concat(src, dst) do
    concat_func(src |> Enum.reverse, dst)
  end


  def concat_func([], dst) do
    dst
  end


  def concat_func([h | t], dst) do

    concat_func(t, [h | dst])
  end
end


# Tutorials.Lists.Concat.concat([1,2,3], [1,1,1,1])
