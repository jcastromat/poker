require 'card.rb'

class Deck

  attr_reader :cards

  def initialize
    @cards = []
    populate_deck
    @cards.shuffle!
  end

  def populate_deck
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::VALUE_STRINGS.keys.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def take_card
    @cards.shift
  end

  def return_card(card)
    @cards << card
  end

  def take_hand
    @cards.shift(5)
  end

  def return_hand(hand)
    @cards += hand
  end

end
