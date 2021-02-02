class Poker
  require '/Users/jassoj/Desktop/Ruby/poker/card.rb'
  require '/Users/jassoj/Desktop/Ruby/poker/player.rb'

  MIN_PLAYERS = 2
  MAX_PLAYERS = 10
  SUITS = %w[Clubs Diamonds Hearts Spades].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  def initialize
    @cards = []
    @players = []
  end

  def play
    set_cards
    return "Allowed players: #{MIN_PLAYERS} to #{MAX_PLAYERS}" unless allowed_players?(3)

    deal_cards(3)
    show_player_cards
  end

  private

  def set_cards
    value = 1
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit, value)
        value += 1
      end
    end
  end

  def allowed_players?(num_players)
    num_players >= MIN_PLAYERS && num_players <= MAX_PLAYERS
  end

  def deal_cards(num_players)
    @cards.shuffle!
    player = Player.new([])
    @cards.each_with_index do |card, index|
      player.hand << card
      if (index % 5).zero? && index != 0
        @players << player
        player = Player.new([])
      end

      break if index == (num_players * 5)
    end
  end

  def show_player_cards
    @players.each_with_index do |player, index|
      p "======================= JUGADOR #{index + 1} ======================="
      (0..4).each do |i|
        p "#{player.hand[i].rank} #{player.hand[i].suit}"
      end
    end
  end
end

poker_game = Poker.new
poker_game.play
