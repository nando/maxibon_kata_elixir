defmodule MaxibonKataElixir do
  def open_fridge( office, developer ) do
    MaxibonKataElixir.Developer.grab_maxibons developer, office
  end
end
