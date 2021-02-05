require_relative '../player.rb'
require_relative '../card.rb'

RSpec.describe 'Player' do
  let(:hand) { [] }
  let(:player) { Player.new(hand) }

  subject { player.show_cards }

  context '#show_cards' do
    let(:hand) do
      [
        Card.new('10', 'Hearts', 36),
        Card.new('J', 'Hearts', 37),
        Card.new('Q', 'Hearts', 38),
        Card.new('K', 'Hearts', 39),
        Card.new('A', 'Hearts', 27)
      ]
    end

    it { is_expected.to eq(hand) }
  end
end
