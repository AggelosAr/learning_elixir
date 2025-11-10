defmodule Tutorials.Recursion.Factorial do

  def fact(0) do
    1
  end
  def fact(1) do
    1
  end

 def fact(nums) do
  nums * fact(nums- 1)
  end




  def tail_fact(num, acc \\ 1)
  def tail_fact(1, acc) do
    1 * acc
  end

 def tail_fact(nums, acc) do
  tail_fact(nums- 1, nums * acc)
  end

end
