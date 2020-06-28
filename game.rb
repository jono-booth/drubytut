require 'drb/drb'

class Game
  attr_accessor :server_uri

  def play(move)
    game_server.play(move)
  end

  def game_server
    @_game_server ||= DRbObject.new_with_uri(server_uri)
  end
end
