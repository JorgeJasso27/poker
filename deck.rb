class Deck
  require_relative 'card.rb'

  SUITS = %w[Clubs Diamonds Hearts Spades].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  def initialize
    @cards = []
    set_cards
    @cards.shuffle!
  end

  def pull_poker_deck
    hand = []
    5.times do
      hand << @cards.first
      @cards.delete_at(0)
    end
    hand
  end

  private

  def set_cards
    value = 0
    SUITS.each do |suit|
      RANKS.each do |rank|
        value += 1
        @cards << Card.new(rank, suit, value)
      end
    end
  end
end
