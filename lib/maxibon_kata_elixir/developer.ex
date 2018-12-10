defmodule MaxibonKataElixir.Developer do
  @karumies %{
    pedro: 3,
    fran: 1,
    davide: 0,
    sergio: 2,
    jorge: 1
  }

  def karumies do
    @karumies
  end

  def map( name, maxibons_to_grab \\ 0 ) do
    %{ name: name,
       maxibons_to_grab: max( 0, maxibons_to_grab ) }
  end

  def grab_maxibons( developer, office ) do
    office = put_in( office.maxibons_left,
                     max( 0, office.maxibons_left - developer.maxibons_to_grab ))

    if MaxibonKataElixir.KarumiHQ.buy_maxibons?( office ) do
      if office[ :chat ] do
        msg = "Hi guys, I'm " <> developer.name <> ". We need more maxibons!"
        office = put_in office.message_sent,
                        office.chat.sendMessage( msg )
        MaxibonKataElixir.KarumiHQ.buy_maxibons office
      else
        MaxibonKataElixir.KarumiHQ.buy_maxibons office
      end
    else
      office
    end
  end
end
