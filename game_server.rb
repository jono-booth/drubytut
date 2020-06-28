require 'drb/drb'

class GameServer
  MOVES = {
    rock: 0,
    paper: 1,
    scissors: 2
  }

  def initialize(log=$stdout)
    @log = log
    @log.puts('Game server listeneing...')
  end

  def play(move)
    @human = move.downcase.to_sym
    @machine = MOVES.keys.sample

    @log.puts "Human: #{@human}"
    @log.puts "Machine: #{@machine}"

    "Machine plays #{@machine} - #{result}"
  end

  private

  def winner?
    @_winner ||= (3 + MOVES[@human] - MOVES[@machine]) % 3
  end

  def result
    @_result ||= case winner?
    when 0
      "You Draw."
    when 1
      "You Win!"
    when 2
      "You Lose!"
    end
  end
end

uri = ARGV.shift
DRb.start_service(uri, GameServer.new)
DRb.thread.join()
