defmodule MaxibonKataElixir.ChatBehaviour do
  @callback sendMessage( String.t ) :: binary()
end

defmodule MaxibonKataElixir.Chat do
  @behaviour MaxibonKataElixir.ChatBehaviour

  def sendMessage( message ) do
    # do send the message to the office chat...
    message
  end
end
