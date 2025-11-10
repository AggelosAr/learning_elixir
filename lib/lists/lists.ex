defmodule Tutorials.Lists.Lists do
  @moduledoc """
  KAPPA doc strings here /.
  """


  
  def sum(nums, acc \\ 0)
  def sum([], acc), do: acc


  def sum([h | t], acc) do
    sum(t, acc + h)

  end

end
