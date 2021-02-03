class PokerController
  require_relative 'deck.rb'
  require_relative 'player.rb'
  require_relative 'pokerHands.rb'

  MIN_PLAYERS = 2
  MAX_PLAYERS = 6

  def initialize(num_players)
    @num_players = num_players
    unless allowed_players?
      puts "Allowed players: #{MIN_PLAYERS} to #{MAX_PLAYERS}"
      return
    end
    @players = []
    deal_cards
  end

  private

  def allowed_players?
    @num_players >= MIN_PLAYERS && @num_players <= MAX_PLAYERS
  end

  def deal_cards
    deck = Deck.new
    @num_players.times do
      player = Player.new
      player.hand = deck.pull_poker_deck
      @players << player
    end
  end
end
