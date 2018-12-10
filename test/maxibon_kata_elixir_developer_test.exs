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

  property "should assign the number of maxibons specified to every developer" do
    developers = MaxibonKataElixir.Developer.karumies
    max_size = map_size( developers ) - 1
    check all idx <- StreamData.integer(0..max_size) do
      developer_tuple = elem( Enum.fetch( developers, idx), 1 )
      name = elem( developer_tuple, 0 )
      maxibons_to_grab = elem( developer_tuple, 1 )

      developer = MaxibonKataElixir.Developer.map( name, maxibons_to_grab )

      assert developer.maxibons_to_grab == maxibons_to_grab
    end
  end

end
