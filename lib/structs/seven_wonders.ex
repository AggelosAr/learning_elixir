defmodule Tutorials.Structs.SevenWonders do

  defstruct name: "", country: ""

  alias Tutorials.Structs.SevenWonders

  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t()
  }


  @spec all :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichén Itzá", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"}
    ]
  end

  
  @spec print_names([t]) :: :ok
  def print_names(wonders) do
    Enum.each(wonders, fn x -> IO.puts(x.name) end)
  end
# Tutorials.Structs.SevenWonders.all |> Tutorials.Structs.SevenWonders.print_names
# Tutorials.Structs.SevenWonders.print_names(Tutorials.Structs.SevenWonders.all())


  @spec filter_by_country([ t() ], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    Enum.filter(wonders, fn wonder -> wonder.country == country end)
  end
# Tutorials.Structs.SevenWonders.all |> Tutorials.Structs.SevenWonders.filter_by_country("India")


  def in_countries_starting_with_i() do
   # all() |> Enum.filter(fn wonder -> String.match?(wonder.country, ~r/^[iI].*/) end)
    all() |> Enum.filter(fn wonder -> String.starts_with?(wonder.country, "I") end)
  end
  #Tutorials.Structs.SevenWonders.in_countries_starting_with_i


  def sort_by_country_length() do
    all() |> Enum.sort(fn wonder1, wonder2 -> String.length(wonder1.country) > String.length(wonder2.country) end)
  end
  #Tutorials.Structs.SevenWonders.sort_by_country_length


  @doc """
  return a list of [[name, country], [name, country], [name, country] ...]
  """
  def name_country_list() do
    all() |> Enum.reduce([], fn wonder, acc -> [[wonder.name, wonder.country] |  acc] end)
  end
 #  Tutorials.Structs.SevenWonders.name_country_list


end
