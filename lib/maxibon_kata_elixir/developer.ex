defmodule MaxibonKataElixir.Developer do
  def map( name, maxibons_to_grab \\ 0 ) do
    %{ name: name,
       maxibons_to_grab: max( 0, maxibons_to_grab ) }
  end
end
