class PokerHands
  POKER_HANDS = %w[
    royal_flush?
    straight_flush?
    four_of_a_kind?
    full_house?
    flush?
    straight?
    three_of_a_kind?
    two_pair?
    pair?
    high_card?
  ].freeze
  ROYAL_FLUSH = %w[10 J Q K A].freeze
  VALUES = {A:1, J:11, Q:12, K:13}

  def type(hand)
    @hand = hand
    POKER_HANDS.each do |ph|
      return ph if send(ph)
    end
  end

  private

  def royal_flush?
    @hand.each_cons(2).all? do |a, b|
      a.suit == b.suit && ROYAL_FLUSH.include?(a.rank) && ROYAL_FLUSH.include?(b.rank)
    end
  end

  def straight_flush?
    @hand.sort_by!(&:value)
    @hand.each_cons(2).all? { |a, b| a.value + 1 == b.value && a.suit == b.suit }
  end

  def frequencies
    @frequencies = Hash.new(0)
    @hand.each { |hand| @frequencies[hand.rank] += 1 }
    @frequencies = @frequencies.sort_by { |_key, value| value }.to_h
  end

  def four_of_a_kind?
    frequencies
    @frequencies.values.last == 4
  end

  def full_house?
    @frequencies.values == [2, 3]
  end

  def flush?
    @hand.each_cons(2).all? { |a, b| a.suit == b.suit }
  end

  def straight?
    values = []
    @hand.each_with_index do |card, i|
      values[i] = VALUES.has_key?(card.rank.to_sym) ? VALUES[card.rank.to_sym] : card.rank.to_i
    end
    values.sort.each_cons(2).all? { |a, b| a + 1 == b }
  end

  def three_of_a_kind?
    @frequencies.values.last == 3
  end

  def two_pair?
    @frequencies.values == [1, 2, 2]
  end

  def pair?
    @frequencies.values.last == 2
  end

  def high_card?
    true
  end
end
