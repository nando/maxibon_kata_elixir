defmodule TestHelper do
  use ExUnitProperties

  def karumi_hq_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 8 ) do
          MaxibonKataElixir.KarumiHQ.office( name )
        end
  end

  def unpredictable_developer_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 3 ),
            maxibons_to_grab <- integer() do
          MaxibonKataElixir.Developer.new( name, maxibons_to_grab )
        end
  end

  def karumi_developer_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 3 ),
            maxibons_to_grab <- integer( 0..12 ) do
          MaxibonKataElixir.Developer.new( name, maxibons_to_grab )
        end
  end
end

ExUnit.start()
