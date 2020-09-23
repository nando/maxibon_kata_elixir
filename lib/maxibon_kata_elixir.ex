defmodule MaxibonKataElixir do
  def open_fridge( office, dev_or_devs ) do
    if is_list(dev_or_devs) do
      Enum.reduce(dev_or_devs,
                  office,
                  fn(dev, final_office) -> MaxibonKataElixir.Developer.grab_maxibons(dev, final_office) end)
    else
      MaxibonKataElixir.Developer.grab_maxibons dev_or_devs, office
    end
  end
end
