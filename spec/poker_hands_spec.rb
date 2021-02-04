require_relative '../pokerHands.rb'
require_relative '../card.rb'

RSpec.describe 'PokerHands' do
  let(:poker_hands) { PokerHands.new }
  let(:hand) { [] }

  subject { poker_hands.type(hand) }

  context 'hand is royal_flush' do
    let(:hand) do
      [
        Card.new('10', 'Hearts', 36),
        Card.new('J', 'Hearts', 37),
        Card.new('Q', 'Hearts', 38),
        Card.new('K', 'Hearts', 39),
        Card.new('A', 'Hearts', 27)
      ]
    end

    it { is_expected.to eq('royal_flush?') }
  end

  context 'hand is straight_flush' do
    let(:hand) do
      [
        Card.new('8', 'Spades', 47),
        Card.new('5', 'Spades', 44),
        Card.new('7', 'Spades', 46),
        Card.new('9', 'Spades', 48),
        Card.new('6', 'Spades', 45)
      ]
    end

    it { is_expected.to eq('straight_flush?') }
  end

  context 'hand is four_of_a_kind' do
    let(:hand) do
      [
        Card.new('A', 'Hearts', 27),
        Card.new('A', 'Clubs', 1),
        Card.new('A', 'Diamonds', 14),
        Card.new('A', 'Spades', 40),
        Card.new('2', 'Hearts', 28)
      ]
    end

    it { is_expected.to eq('four_of_a_kind?') }
  end

  context 'hand is full_house' do
    let(:hand) do
      [
        Card.new('A', 'Clubs', 1),
        Card.new('A', 'Diamonds', 14),
        Card.new('A', 'Hearts', 27),
        Card.new('2', 'Clubs', 2),
        Card.new('2', 'Diamonds', 15)
      ]
    end

    it { is_expected.to eq('full_house?') }
  end

  context 'hand is flush' do
    let(:hand) do
      [
        Card.new('A', 'Clubs', 1),
        Card.new('2', 'Clubs', 2),
        Card.new('5', 'Clubs', 5),
        Card.new('K', 'Clubs', 12),
        Card.new('Q', 'Clubs', 13)
      ]
    end

    it { is_expected.to eq('flush?') }
  end

  context 'hand is straight' do
    let(:hand) do
      [
        Card.new('5', 'Hearts', 31),
        Card.new('6', 'Clubs', 6),
        Card.new('7', 'Diamonds', 19),
        Card.new('8', 'Spades', 47),
        Card.new('9', 'Clubs', 9)
      ]
    end

    it { is_expected.to eq('straight?') }
  end

  context 'hand is three_of_a_kind' do
    let(:hand) do
      [
        Card.new('A', 'Clubs', 1),
        Card.new('A', 'Diamonds', 14),
        Card.new('A', 'Hearts', 27),
        Card.new('8', 'Spades', 47),
        Card.new('9', 'Clubs', 9)
      ]
    end

    it { is_expected.to eq('three_of_a_kind?') }
  end

  context 'hand is two_pair' do
    let(:hand) do
      [
        Card.new('A', 'Clubs', 1),
        Card.new('A', 'Diamonds', 14),
        Card.new('5', 'Clubs', 5),
        Card.new('5', 'Spades', 44),
        Card.new('9', 'Clubs', 9)
      ]
    end

    it { is_expected.to eq('two_pair?') }
  end

  context 'hand is pair' do
    let(:hand) do
      [
        Card.new('A', 'Clubs', 1),
        Card.new('A', 'Diamonds', 14),
        Card.new('8', 'Spades', 47),
        Card.new('5', 'Spades', 44),
        Card.new('9', 'Clubs', 9)
      ]
    end

    it { is_expected.to eq('pair?') }
  end

  context 'hand is high_card' do
    let(:hand) do
      [
        Card.new('A', 'Hearts', 27),
        Card.new('8', 'Spades', 47),
        Card.new('6', 'Diamonds', 19),
        Card.new('4', 'Clubs', 4),
        Card.new('2', 'Hearts', 28)
      ]
    end

    it { is_expected.to eq('high_card?') }
  end
end
