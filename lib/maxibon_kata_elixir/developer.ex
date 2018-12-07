defmodule MaxibonKataElixir.Developer do
  def map( name, maxibons_to_grab \\ 0 ) do
    %{ name: name,
       maxibons_to_grab: max( 0, maxibons_to_grab ) }
  end

  def grab_maxibons( developer, office ) do
    office = put_in( office.maxibons_left,
                     max( 0, office.maxibons_left - developer.maxibons_to_grab ))

    if MaxibonKataElixir.KarumiHQ.buy_maxibons?( office ) do
      MaxibonKataElixir.KarumiHQ.buy_maxibons( office )
    else
      office
    end
  end
end
