require TestHelper

defmodule MaxibonKataElixirTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  property "should start the day with 10 maxibons" do
    check all office <- TestHelper.karumi_hq_generator() do
      assert office[ :maxibons_left ] == 10
    end
  end
end
