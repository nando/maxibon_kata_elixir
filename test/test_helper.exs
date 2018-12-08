Mox.defmock MaxibonKataElixir.ChatMock,
            for: MaxibonKataElixir.ChatBehaviour

defmodule TestHelper do
  use ExUnitProperties

  def karumi_hq_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 8 ) do
          MaxibonKataElixir.KarumiHQ.office( name )
        end
  end

  def karumi_hq_with_chat_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 8 ) do
          MaxibonKataElixir.KarumiHQ.office( name, MaxibonKataElixir.ChatMock )
        end
  end

  def unpredictable_developer_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 3 ),
            maxibons_to_grab <- integer() do
          MaxibonKataElixir.Developer.map( name, maxibons_to_grab )
        end
  end

  def karumi_developer_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 3 ),
            maxibons_to_grab <- integer( 0..12 ) do
          MaxibonKataElixir.Developer.map( name, maxibons_to_grab )
        end
  end

  def hungry_developer_generator do
    gen all name <- string( :alphanumeric,
                            min_length: 3 ),
            maxibons_to_grab <- integer( 13..42 ) do
          MaxibonKataElixir.Developer.map( name, maxibons_to_grab )
        end
  end

  def calculate_maxibons_left( initial_maxibons, developer ) do
    maxibons_left = max( 0, initial_maxibons - developer.maxibons_to_grab )
    if maxibons_left < MaxibonKataElixir.KarumiHQ.min_maxibons do
      maxibons_left + MaxibonKataElixir.KarumiHQ.maxibons_to_buy
    else
      initial_maxibons - developer.maxibons_to_grab
    end
  end

end

ExUnit.start()
