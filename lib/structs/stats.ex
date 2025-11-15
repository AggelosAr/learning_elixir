defmodule Tutorials.Structs.Stats do

  # alias Tutorials.Structs.StatsErrors
  # alias Tutorials.Structs.StatsValidators
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



end
