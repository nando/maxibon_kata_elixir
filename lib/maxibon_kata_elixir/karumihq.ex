defmodule MaxibonKataElixir.KarumiHQ do
  def office( office_name ) do
    %{ name: office_name,
       maxibons_left: 10 }
  end

  def open_fridge( office, _developer ) do
    office
  end
end
