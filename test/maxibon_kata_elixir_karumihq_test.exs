defmodule MaxibonKataElixirKarumiHQTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  def karumi_hq_generator do
    ExUnitProperties.gen all name <- string( :alphanumeric,
                                             min_length: 8 ) do
                           MaxibonKataElixir.karumi_hq( name )
                         end
  end

  property "should start the day with 10 maxibons" do
    check all office <- karumi_hq_generator() do
      assert office[ :maxibons_left ] == 10
    end
  end
end
