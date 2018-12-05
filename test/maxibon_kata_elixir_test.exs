require TestHelper

defmodule MaxibonKataElixirTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  property "should always has more than two maxibons in the fridge" do
    check all office <- TestHelper.karumi_hq_generator(),
              developer <- TestHelper.karumi_developer_generator() do
      office = MaxibonKataElixir.open_fridge( office, developer )
      assert office.maxibons_left > 2
    end
  end
end
