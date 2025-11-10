defmodule Tutorials.Recursion.ReverseNum do

  def rev_num(0, acc) do
    acc
  end


 def rev_num(num, acc) do

    rev_num(div(num, 10), rem(num,10) + 10 * acc)

  end




#   def tail_rev_num(num, acc \\ 1)
#   def tailrev_num(1, acc) do
#     1 * acc
#   end

#  def rev_num(nums, acc) do
#   rev_num(nums- 1, nums * acc)
#   end

end
