defmodule MaxibonKataElixir.KarumiHQ do
  @min_maxibons 3
  @maxibons_to_buy 10

  def office( office_name ) do
    %{ name: office_name,
       maxibons_left: 10 }
  end

  def buy_maxibons?( office ) do
    office.maxibons_left < @min_maxibons
  end

  def buy_maxibons( office ) do
    put_in office.maxibons_left, office.maxibons_left + @maxibons_to_buy
  end
end
