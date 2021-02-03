class PokerGame
  require_relative 'pokerController.rb'

  def self.play(num_players)
    poker_controller = PokerController.new(num_players)
    poker_controller.new_game
  end
end

PokerGame.play(3)
