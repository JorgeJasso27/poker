class PokerController
  require_relative 'deck.rb'
  require_relative 'player.rb'
  require_relative 'score.rb'

  MIN_PLAYERS = 2
  MAX_PLAYERS = 6

  def initialize(num_players)
    raise "Allowed: #{MIN_PLAYERS} to #{MAX_PLAYERS}" unless allowed_players?(num_players)

    @num_players = num_players
    @deck = Deck.new
    @players = (1..@num_players).each_with_object([]) do |_, array|
      array << Player.new(@deck.pull_poker_deck)
    end
  end

  def new_game
    @players.each do |player|
      player.show_cards
      type = player.poker_hand[0...-1]
      puts "POKER HAND = #{type}"
      player.score = Score.final_score(type, player.hand)
    end
    who_won
  end

  private

  def allowed_players?(num_players)
    num_players >= MIN_PLAYERS && num_players <= MAX_PLAYERS
  end

  def who_won
    id = @players.max_by { |player| player.score }.id
    puts "=============================== PLAYER #{id} WON ==============================="
  end
end
