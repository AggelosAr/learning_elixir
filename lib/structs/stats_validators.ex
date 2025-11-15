defmodule Tutorials.Structs.StatsValidators do

  alias Tutorials.Structs.StatsErrors

  def validate_num_list(nums) when is_list(nums) do
  {Enum.all?(nums, fn el -> is_number(el) end), nums}
  end


  def validate_num_list(_), do: StatsErrors.invalid_data_type()

end
