require_relative 'card.rb'

class Deck
  attr_accessor :cards
  SUITS = %w[Clubs Diamonds Hearts Spades].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze

  def initialize
    @cards = []
    set_cards
    @cards.shuffle!
  end

  def pull_poker_deck
    hand = []
    5.times { hand << @cards.pop }
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
