defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({unit, volume}), do: {:milliliter, volume * get_factor_to_milliliter(unit)}
  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / get_factor_to_milliliter(unit)}

  def convert({:teaspoon, volume}, :tablespoon = unit), do: to_milliliter({unit, volume / 3}) |> from_milliliter(unit)
  def convert({:cup, volume}, :fluid_ounce = unit), do: to_milliliter({unit, volume * 8}) |> from_milliliter(unit)
  def convert({:fluid_ounce, volume}, :teaspoon = unit), do: to_milliliter({unit, volume * 6}) |> from_milliliter(unit)
  def convert({:tablespoon, volume}, :cup = unit), do: to_milliliter({unit, volume / 16}) |> from_milliliter(unit)

  defp get_factor_to_milliliter(:milliliter), do: 1
  defp get_factor_to_milliliter(:cup), do: 240
  defp get_factor_to_milliliter(:fluid_ounce), do: 30
  defp get_factor_to_milliliter(:teaspoon), do: 5
  defp get_factor_to_milliliter(:tablespoon), do: 15
end
