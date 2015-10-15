require './card'

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    populate_deck
  end

  def populate_deck
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::VALUE_STRINGS.keys.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

end
