defmodule Tutorials.Recursion.SumDigits do
  def upto(0) do
    0
  end

 def upto(nums) do
    nums + upto(nums-1)
  end




  def upto_tail_opt(0, acc) do
    acc
  end

  def upto_tail_opt(num, acc) do
    upto_tail_opt(num - 1, acc + num)
  end

end
