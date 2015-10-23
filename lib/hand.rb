require 'card.rb'

class Hand

  NUMBER_VALUES = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

  RANKS = {
    9 => "Royal flush",
    8 => "Straight flush",
    7 => "Four of a kind",
    6 => "Full house",
    5 => "Flush",
    4 => "Straight",
    3 => "Three of a kind",
    2 => "Two pairs",
    1 => "One pair",
    0 => "Highest card"
  }

  def initialize(cards)
    @cards = cards
  end

  def royal_flush?
    straight? && flush? && values.map{|val| NUMBER_VALUES[val]}.sort.first == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    cards_hash = Hash.new(0)
    values.each do |value|
      cards_hash[value] += 1
    end
    cards_hash.length == 2 && cards_hash.values.include?(4)
  end

  def full_house?
    cards_hash = Hash.new(0)
    values.each do |value|
      cards_hash[value] += 1
    end
    cards_hash.length == 2 && cards_hash.values.include?(3)
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight?
    num_values = values.map {|value| NUMBER_VALUES[value]}

    return false if num_values.uniq.length != 5

    if num_values.include?(14)
      num_values.sort.first == 10 || num_values.sort[-2] == 5
    else
      num_values.sort.first + 4 == num_values.sort.last
    end

  end

  def three_of_a_kind?
    cards_hash = Hash.new(0)
    values.each do |value|
      cards_hash[value] += 1
    end
    cards_hash.length == 3 && cards_hash.values.include?(3)
  end

  def two_pairs?
    cards_hash = Hash.new(0)
    values.each do |value|
      cards_hash[value] += 1
    end
    cards_hash.length == 3 && !cards_hash.values.include?(3)
  end

  def one_pair?
    cards_hash = Hash.new(0)
    values.each do |value|
      cards_hash[value] += 1
    end
    cards_hash.length == 4 && cards_hash.values.include?(2)
  end

  def values
    values = []
    @cards.each {|card| values << card.value}
    values
  end

  def suits
    suits = []
    @cards.each {|card| suits << card.suit}
    suits
  end

  def beats?(hand)
    if best_hand == hand.best_hand
      return values.sort.last > hand.values.sort.last
    else
      best_hand > hand.best_hand
    end
  end

  def best_hand
    case
    when royal_flush?
      return 9
    when straight_flush?
      return 8
    when four_of_a_kind?
      return 7
    when full_house?
      return 6
    when flush?
      return 5
    when straight?
      return 4
    when three_of_a_kind?
      return 3
    when two_pairs?
      return 2
    when one_pair?
      return 1
    else
      0
    end
  end

  def to_s
    s_cards = ""
    @cards.each { |card| s_cards += (card.to_s + " ") }
    s_cards
  end


end
