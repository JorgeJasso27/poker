class Player
  require_relative 'pokerHands.rb'
  attr_reader :hand

  def initialize(hand)
    @hand = hand
    @poker_hands = PokerHands.new
  end

  def show_cards
    (0..4).each do |i|
      p "#{hand[i].rank} #{hand[i].suit}"
    end
  end

  def poker_hand
    @poker_hands.type(@hand)
  end
end
