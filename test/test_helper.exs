defmodule TestHelper do
  use ExUnitProperties

  def karumi_hq_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 8 ) do
          MaxibonKataElixir.karumi_hq( name )
        end
  end

  def unpredictable_developer_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 3 ),
            maxibons_to_grab <- integer() do
          MaxibonKataElixir.developer( name, maxibons_to_grab )
        end
  end
end

ExUnit.start()
