require_relative '../pokerController.rb'
require_relative '../card.rb'

RSpec.describe 'PokerController' do
  let(:num_players) { }
  let(:poker_controller) { PokerController.new(num_players) }
  let(:hand) { [] }
  subject { poker_controller }

  context 'when number of player is less than MIN_PLAYERS' do
    let(:num_players) { 1 }

    it { expect { subject }.to raise_error("Players allowed: 2 to 6") }
  end

  context 'when number of player is greater than MAX_PLAYERS' do
    let(:num_players) { 10 }

    it { expect { subject }.to raise_error("Players allowed: 2 to 6") }
  end

  context 'when number of players is allowed' do

  end
end
