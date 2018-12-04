defmodule MaxibonKataElixir do
  def karumi_hq( office_name ) do
    [ name: office_name,
      maxibons_left: 10 ]
  end

  def developer( name, maxibons_to_grab \\ 0 ) do
    [ name: name,
      maxibons_to_grab: max( 0, maxibons_to_grab ) ]
  end

  def open_fridge( office, _developer ) do
    office
  end
end
