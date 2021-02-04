class PokerController
  require_relative 'deck.rb'
  require_relative 'player.rb'

  MIN_PLAYERS = 2
  MAX_PLAYERS = 6

  def initialize(num_players)
    raise "Allowed: #{MIN_PLAYERS} to #{MAX_PLAYERS}" unless allowed_players?(num_players)

    @num_players = num_players
    @deck = Deck.new
    @players = (1..@num_players).each_with_object([]) do |_, array|
      array << Player.new(@deck.pull_poker_deck)
    end
  end

  def new_game
    @players.each do |player|
      player.poker_hand
    end
  end

  private

  def allowed_players?(num_players)
    num_players >= MIN_PLAYERS && num_players <= MAX_PLAYERS
  end
end
