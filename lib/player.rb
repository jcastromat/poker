require 'hand.rb'

class Player

  attr_accessor :hand, :name

  def initialize(name, cards)
    @name = name
    @hand = Hand.new(cards)
  end

  def prompt
    puts "What do you wanna do?"
    input = gets.chomp
  end



end
