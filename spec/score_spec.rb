require_relative '../card.rb'
require_relative '../score.rb'

RSpec.describe 'Score' do
  let(:hand) { [] }
  let(:type) {}
  subject { Score.final_score(type, hand) }

  context 'when type is royal_flush' do
    let(:type) { 'royal_flush' }
    let(:hand) do
      [
        Card.new('10', 'Hearts', 36),
        Card.new('J', 'Hearts', 37),
        Card.new('Q', 'Hearts', 38),
        Card.new('K', 'Hearts', 39),
        Card.new('A', 'Hearts', 27)
      ]
    end

    it { is_expected.to eq(1013) }
  end

  context 'hand is straight_flush' do
    let(:type) { 'straight_flush' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('8', 'Spades', 47),
          Card.new('5', 'Spades', 44),
          Card.new('7', 'Spades', 46),
          Card.new('9', 'Spades', 48),
          Card.new('6', 'Spades', 45)
        ]
      end

      it { is_expected.to eq(909) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('10', 'Spades', 49),
          Card.new('7', 'Spades', 46),
          Card.new('9', 'Spades', 48),
          Card.new('J', 'Spades', 50),
          Card.new('8', 'Spades', 47)
        ]
      end

      it { is_expected.to eq(911) }
    end
  end

  context 'hand is four_of_a_kind' do
    let(:type) { 'four_of_a_kind' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('2', 'Hearts', 28),
          Card.new('2', 'Clubs', 2),
          Card.new('2', 'Diamonds', 15),
          Card.new('2', 'Spades', 41),
          Card.new('4', 'Hearts', 30)
        ]
      end

      it { is_expected.to eq(804) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('J', 'Hearts', 37),
          Card.new('J', 'Clubs', 11),
          Card.new('J', 'Diamonds', 24),
          Card.new('J', 'Spades', 50),
          Card.new('2', 'Hearts', 38)
        ]
      end

      it { is_expected.to eq(811) }
    end
  end

  context 'hand is full_house' do
    let(:type) { 'full_house' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('2', 'Clubs', 2),
          Card.new('2', 'Diamonds', 15),
          Card.new('2', 'Hearts', 28),
          Card.new('3', 'Clubs', 3),
          Card.new('3', 'Diamonds', 16)
        ]
      end

      it { is_expected.to eq(703) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('J', 'Clubs', 11),
          Card.new('J', 'Diamonds', 24),
          Card.new('J', 'Hearts', 37),
          Card.new('2', 'Clubs', 2),
          Card.new('2', 'Diamonds', 15)
        ]
      end

      it { is_expected.to eq(711) }
    end
  end

  context 'hand is flush' do
    let(:type) { 'flush' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('3', 'Clubs', 1),
          Card.new('2', 'Clubs', 2),
          Card.new('5', 'Clubs', 5),
          Card.new('4', 'Clubs', 12),
          Card.new('6', 'Clubs', 13)
        ]
      end

      it { is_expected.to eq(606) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('A', 'Clubs', 1),
          Card.new('2', 'Clubs', 2),
          Card.new('5', 'Clubs', 5),
          Card.new('K', 'Clubs', 12),
          Card.new('Q', 'Clubs', 13)
        ]
      end

      it { is_expected.to eq(613) }
    end
  end

  context 'hand is straight' do
    let(:type) { 'straight' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('5', 'Hearts', 31),
          Card.new('6', 'Clubs', 6),
          Card.new('7', 'Diamonds', 19),
          Card.new('8', 'Spades', 47),
          Card.new('9', 'Clubs', 9)
        ]
      end

      it { is_expected.to eq(509) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('9', 'Hearts', 35),
          Card.new('10', 'Clubs', 10),
          Card.new('J', 'Diamonds', 23),
          Card.new('Q', 'Spades', 51),
          Card.new('K', 'Clubs', 13)
        ]
      end

      it { is_expected.to eq(513) }
    end
  end

  context 'hand is three_of_a_kind' do
    let(:type) { 'three_of_a_kind' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('2', 'Clubs', 2),
          Card.new('2', 'Diamonds', 15),
          Card.new('2', 'Hearts', 28),
          Card.new('8', 'Spades', 47),
          Card.new('9', 'Clubs', 9)
        ]
      end

      it { is_expected.to eq(409) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('Q', 'Clubs', 12),
          Card.new('Q', 'Diamonds', 25),
          Card.new('Q', 'Hearts', 38),
          Card.new('8', 'Spades', 47),
          Card.new('9', 'Clubs', 9)
        ]
      end

      it { is_expected.to eq(412) }
    end
  end

  context 'hand is two_pair' do
    let(:type) { 'two_pair' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('2', 'Clubs', 2),
          Card.new('2', 'Diamonds', 15),
          Card.new('5', 'Clubs', 5),
          Card.new('5', 'Spades', 44),
          Card.new('4', 'Clubs', 4)
        ]
      end

      it { is_expected.to eq(305) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('K', 'Clubs', 13),
          Card.new('K', 'Diamonds', 26),
          Card.new('5', 'Clubs', 5),
          Card.new('5', 'Spades', 44),
          Card.new('9', 'Clubs', 9)
        ]
      end

      it { is_expected.to eq(313) }
    end
  end

  context 'hand is pair' do
    let(:type) { 'pair' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('2', 'Clubs', 2),
          Card.new('2', 'Diamonds', 15),
          Card.new('8', 'Spades', 47),
          Card.new('5', 'Spades', 44),
          Card.new('8', 'Clubs', 8)
        ]
      end

      it { is_expected.to eq(208) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('A', 'Clubs', 1),
          Card.new('A', 'Diamonds', 14),
          Card.new('8', 'Spades', 47),
          Card.new('5', 'Spades', 44),
          Card.new('K', 'Clubs', 13)
        ]
      end

      it { is_expected.to eq(213) }
    end
  end

  context 'hand is high_card' do
    let(:type) { 'high_card' }

    context 'and highest card is a number' do
      let(:hand) do
        [
          Card.new('A', 'Hearts', 27),
          Card.new('7', 'Spades', 46),
          Card.new('6', 'Diamonds', 19),
          Card.new('4', 'Clubs', 4),
          Card.new('2', 'Hearts', 28)
        ]
      end

      it { is_expected.to eq(107) }
    end

    context 'and highest card is a letter' do
      let(:hand) do
        [
          Card.new('A', 'Hearts', 27),
          Card.new('8', 'Spades', 47),
          Card.new('6', 'Diamonds', 19),
          Card.new('J', 'Clubs', 11),
          Card.new('2', 'Hearts', 28)
        ]
      end

      it { is_expected.to eq(111) }
    end
  end
end
