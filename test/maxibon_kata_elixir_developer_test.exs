defmodule MaxibonKataElixirDeveloperTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  def unpredictable_developer_generator do
    ExUnitProperties.gen all name <- string( :alphanumeric,
                                             min_length: 3 ),
                             maxibons_to_grab <- integer() do
                           MaxibonKataElixir.developer( name, maxibons_to_grab )
                         end
  end

  property "should always grab a positive number of maxibons" do
    check all developer <- unpredictable_developer_generator() do
      assert developer[ :maxibons_to_grab ] >= 0
    end
  end

  property "should assign the name of the developer in 'construction'" do
    check all name <- StreamData.string( :alphanumeric, min_length: 3 ),
              developer = MaxibonKataElixir.developer( name ) do
      assert developer[ :name ] == name
    end
  end
end
