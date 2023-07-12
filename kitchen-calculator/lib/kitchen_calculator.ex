defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume * 1}
  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15}

  def from_milliliter({:milliliter, volume}, :milliliter = unit), do: {unit, volume / 1}
  def from_milliliter({:milliliter, volume}, :cup = unit), do: {unit, volume / 240}
  def from_milliliter({:milliliter, volume}, :fluid_ounce = unit), do: {unit, volume / 30}
  def from_milliliter({:milliliter, volume}, :teaspoon = unit), do: {unit, volume / 5}
  def from_milliliter({:milliliter, volume}, :tablespoon = unit), do: {unit, volume / 15}

  def convert({:teaspoon, volume}, :tablespoon = unit), do: to_milliliter({unit, volume / 3}) |> from_milliliter(unit)
  def convert({:cup, volume}, :fluid_ounce = unit), do: to_milliliter({unit, volume * 8}) |> from_milliliter(unit)
  def convert({:fluid_ounce, volume}, :teaspoon = unit), do: to_milliliter({unit, volume * 6}) |> from_milliliter(unit)
  def convert({:tablespoon, volume}, :cup = unit), do: to_milliliter({unit, volume / 16}) |> from_milliliter(unit)
end
