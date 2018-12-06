require TestHelper

defmodule MaxibonKataElixirDeveloperTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  property "should always grab a positive number of maxibons" do
    check all developer <- TestHelper.unpredictable_developer_generator() do
      assert developer.maxibons_to_grab >= 0
    end
  end

  property "should assign the name of the developer in 'construction'" do
    check all name <- StreamData.string( :alphanumeric, min_length: 3 ),
              developer = MaxibonKataElixir.Developer.map( name ) do
      assert developer.name == name
    end
  end
end
