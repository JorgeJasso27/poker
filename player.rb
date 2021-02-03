class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def show_cards
    (0..4).each do |i|
      p "#{hand[i].rank} #{hand[i].suit}"
    end
  end
end
