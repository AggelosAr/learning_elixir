defmodule Tutorials.Lists.Rev do

  def rev(list, new_list \\ [])


  def rev([], new_list) do
    new_list
  end


  def rev([h | t], new_list) do


    #rev(t, [h | new_list])

    rev(t, [h] ++ new_list)
  end

end



# e.g.

# [1,2,3,4] |> Tutorials.Lists.Rev.rev
