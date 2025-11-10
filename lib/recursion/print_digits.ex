defmodule Tutorials.Recursion.PrintDigits do
  def upto(0) do
    :ok
  end

  def upto(1), do: :ok

 def upto(nums) do


upto(nums-1)
    IO.puts(nums)


  end
end
