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
    (0..4).each do |i|
      puts "#{hand[i].rank} #{hand[i].suit}"
    end
  end

  def poker_hand
    @poker_hands.type(@hand)
  end
end
