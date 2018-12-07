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

  property "should buy 10 more maxibons if there are less than 3 in the fridge" do
    check all office <- TestHelper.karumi_hq_generator(),
              developer <- TestHelper.hungry_developer_generator() do
      expected_maxibons = TestHelper.calculate_maxibons_left( office.maxibons_left,
                                                              developer )

      office = MaxibonKataElixir.open_fridge( office, developer )

      assert office.maxibons_left == expected_maxibons
    end
  end
end
