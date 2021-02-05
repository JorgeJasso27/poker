class Score
  POKER_HANDS = {
    royal_flush: 1000,
    straight_flush: 900,
    four_of_a_kind: 800,
    full_house: 700,
    flush: 600,
    straight: 500,
    three_of_a_kind: 400,
    two_pair: 300,
    pair: 200,
    high_card: 100
  }.freeze
  VALUES = { A: 1, J: 11, Q: 12, K: 13 }.freeze

  def self.final_score(type, hand)
    values = []
    hand.each_with_index do |card, i|
      values[i] = VALUES.key?(card.rank.to_sym) ? VALUES[card.rank.to_sym] : card.rank.to_i
    end

    POKER_HANDS[type.to_sym] + values.max
  end
end
