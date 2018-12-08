require TestHelper

import Mox

defmodule MaxibonKataElixirTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  # Make sure mocks are verified when the test exits
  setup :verify_on_exit!

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

  property "should request 10 more maxibons using the chat if there are less than 3 in the fridge" do
    check all office <- TestHelper.karumi_hq_with_chat_generator(),
              developer <- TestHelper.hungry_developer_generator() do
      MaxibonKataElixir.ChatMock
      |> expect( :sendMessage, fn msg -> msg end )

      office = MaxibonKataElixir.open_fridge( office, developer )

      assert office.message_sent == "Hi guys, I'm " <> developer.name <> ". We need more maxibons!"
    end
  end

  property "should never request more maxibons to the team using the chat if there are more than 2 in the fridge" do
    check all office <- TestHelper.karumi_hq_with_chat_generator(),
              developer <- TestHelper.not_so_hungry_developer_generator() do
      office = MaxibonKataElixir.open_fridge( office, developer )

      assert office.message_sent == nil
    end
  end
end
