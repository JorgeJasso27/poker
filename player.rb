class Player
  require_relative 'pokerHands.rb'
  attr_accessor :score
  attr_reader :hand, :id
  @@id = 1

  def initialize(hand)
    @id = @@id
    @@id += 1
    @hand = hand
    @poker_hands = PokerHands.new
  end

  def show_cards
    puts "====================== JUGADOR: #{id} ====================== "
    hand.each { |h| puts "#{h.rank} #{h.suit}" }
  end

  def poker_hand
    @poker_hands.type(@hand)
  end
end
