class PokerGame
  require_relative 'pokerController.rb'

  def play(num_players)
    PokerController.new(num_players)
  end
end

poker_game = PokerGame.new
poker_game.play(3)
