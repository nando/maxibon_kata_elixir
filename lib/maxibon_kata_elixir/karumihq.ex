defmodule MaxibonKataElixir.KarumiHQ do
  @min_maxibons 3
  def min_maxibons, do: @min_maxibons

  @maxibons_to_buy 10
  def maxibons_to_buy, do: @maxibons_to_buy

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
