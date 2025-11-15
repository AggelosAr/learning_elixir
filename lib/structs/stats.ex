defmodule Tutorials.Structs.Stats do

  # alias Tutorials.Structs.StatsErrors
  # alias Tutorials.Structs.StatsValidators
  require Integer
  alias Tutorials.Structs.{StatsValidators, StatsErrors}

  @spec population_mean(maybe_improper_list()) :: float() | {:error, <<_::96>>}
  def population_mean([]), do: StatsErrors.invalid_data_type()


  def population_mean(nums) when is_list(nums) do

    nums |>
    StatsValidators.validate_num_list() |>
    calc_population_mean()

  end

  def population_mean(_), do: StatsErrors.invalid_data_type()

  # =============================================================================

  def sample_mean(nums), do: population_mean(nums)

  # =============================================================================

  defp calc_population_mean({false, _}), do: StatsErrors.invalid_data_type()

  defp calc_population_mean({true, nums}) do
      nums
      |> Enum.sum()
      |> mean(Enum.count(nums))
  end

  defp mean(sigma, sum) do
    sigma / sum
  end

  # =============================================================================

  def calc_population_median(nums) do

    count = nums |> Enum.count
    nums
      |> Enum.sort()
      |> get_median(Integer.is_even(count), count )
  end

  defp get_median(nums, false, count) do
    Enum.at(nums, div(count, 2))
  end

  defp get_median(nums, true, count) do
    var1 = Enum.at(nums, div(count, 2))
    var2 = Enum.at(nums, div(count - 1, 2))

    (var1 + var2) / 2

  end

  # =============================================================================



  def mode(nums) do
    ranks = nums |> Enum.frequencies

    ranks |> Map.values() |> Enum.max() |> helper_mode(ranks)

  end

  defp helper_mode(max, ranks) do
  ranks |> Map.filter(fn {_k, v} -> v == max end) |> Map.keys

  end


end
