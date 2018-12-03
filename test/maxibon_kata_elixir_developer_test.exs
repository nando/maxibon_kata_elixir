defmodule MaxibonKataElixirDeveloperTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  property "should assign the name of the developer in 'construction'" do
    check all name <- StreamData.string( :alphanumeric, min_length: 3 ),
              developer = MaxibonKataElixir.developer( name ) do
      assert developer[ :name ] == name
    end
  end
end
