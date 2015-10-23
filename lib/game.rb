require 'deck.rb'
require 'player.rb'

class Game

  def initialize
    @deck = Deck.new
    @player1 = Player.new("Javier", @deck.take_hand)
    @player2 = Player.new("Esteban", @deck.take_hand)
    @currentplayer = @player1
  end

  def run
    while true
      puts "Player 1 #{@player1.name}"
      puts "Cards #{@player1.hand}"
      puts "Player 2 #{@player2.name}"
      puts "Cards #{@player2.hand}"
      if @player1.hand.beats?(@player2.hand)
        puts "Player 1 wins!!"
        puts "#{Hand::RANKS[@player1.hand.best_hand]}"
      else
        puts "Player 2 wins!!"
        puts "#{Hand::RANKS[@player2.hand.best_hand]}"
      end
      @player1.prompt
    end
  end

end


if $PROGRAM_NAME == __FILE__
  g = Game.new
  g.run
end
