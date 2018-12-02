require ExUnitProperties

defmodule TestHelper do
  def karumi_hq_generator do
    ExUnitProperties.gen all name <- StreamData.string(:alphanumeric) do
                           MaxibonKataElixir.karumi_hq( name )
                         end
  end
end

ExUnit.start()
