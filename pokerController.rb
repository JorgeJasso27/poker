class PokerController
  require_relative 'deck.rb'
  require_relative 'player.rb'
  require_relative 'pokerHands.rb'

  MIN_PLAYERS = 2
  MAX_PLAYERS = 6

  def initialize(num_players)
    unless allowed_players?(num_players)
      puts "Allowed players: #{MIN_PLAYERS} to #{MAX_PLAYERS}"
      return
    end
    @num_players = num_players
    @deck = Deck.new
    @players = (1..@num_players).each_with_object([]) do |_, array|
      array << Player.new(@deck.pull_poker_deck)
    end
  end

  def new_game
    obj = PokerHands.new
    @players.each do |player|
      obj.get_poker_hand(player.hand)
    end
  end

  private

  def allowed_players?(num_players)
    num_players >= MIN_PLAYERS && num_players <= MAX_PLAYERS
  end
end
