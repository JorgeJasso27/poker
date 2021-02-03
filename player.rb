class Player
  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def show_cards
    (0..4).each do |i|
      p "#{hand[i].rank} #{hand[i].suit}"
    end
  end
end
