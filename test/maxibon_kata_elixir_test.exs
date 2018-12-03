require TestHelper

defmodule MaxibonKataElixirTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  property "should start the day with 10 maxibons" do
    check all office <- TestHelper.karumi_hq_generator() do
      assert office[ :maxibons_left ] == 10
    end
  end

  property "should assign the name of the developer in 'construction'" do
    check all name <- StreamData.string( :alphanumeric, min_length: 3 ),
              developer = MaxibonKataElixir.developer( name ) do
      assert developer[ :name ] == name
    end
  end
end
