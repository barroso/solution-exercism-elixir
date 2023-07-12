defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({unit, volume}), do: {:milliliter, volume * get_factor(unit, :milliliter)}
  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / get_factor(unit, :milliliter)}

  def convert({initial_origin, volume}, unit) do
    adjusted_volume = round(volume * get_factor(initial_origin, unit))
    to_milliliter({unit, adjusted_volume}) |> from_milliliter(unit)
  end

  defp get_factor(:milliliter, :milliliter), do: 1
  defp get_factor(:cup, :milliliter), do: 240
  defp get_factor(:fluid_ounce, :milliliter), do: 30
  defp get_factor(:teaspoon, :milliliter), do: 5
  defp get_factor(:tablespoon, :milliliter), do: 15
  defp get_factor(:teaspoon, :tablespoon), do: 0.3333333333
  defp get_factor(:cup, :fluid_ounce), do: 8
  defp get_factor(:fluid_ounce, :teaspoon), do: 6
  defp get_factor(:tablespoon, :cup), do: 0.0625
  #add other conversions
end
