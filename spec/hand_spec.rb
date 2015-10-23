require 'rspec'
require 'hand.rb'


describe Hand do

  describe "#royal_flush" do
    let(:card1) {Card.new(:hearts, :ten)}
    let(:card2) {Card.new(:hearts, :jack)}
    let(:card3) {Card.new(:hearts, :queen)}
    let(:card4) {Card.new(:hearts, :king)}
    let(:card5) {Card.new(:hearts, :ace)}

    let(:royal_flush_hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "returns true for royal flush" do
      expect(royal_flush_hand.royal_flush?).to be(true)
    end

    it "returns true for straight flush" do
      expect(royal_flush_hand.straight_flush?).to be(true)
    end
  end

  describe "#straight_flush" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:clubs, :ten)}
    let(:card3) {Card.new(:clubs, :jack)}
    let(:card4) {Card.new(:clubs, :queen)}
    let(:card5) {Card.new(:clubs, :king)}

    let(:straight_flush_hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "returns true for straight flush" do
      expect(straight_flush_hand.straight_flush?).to be(true)
    end

    it "returns false for royal flush" do
      expect(straight_flush_hand.royal_flush?).to be(false)
    end

  end

  describe "#four_of_a_kind" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:clubs, :five)}
    let(:card3) {Card.new(:hearts, :nine)}
    let(:card4) {Card.new(:spades, :nine)}
    let(:card5) {Card.new(:diamonds, :nine)}

    let(:four_of_a_kind_hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "returns false for straight flush" do
      expect(four_of_a_kind_hand.straight_flush?).to be(false)
    end

    it "returns false for royal flush" do
      expect(four_of_a_kind_hand.royal_flush?).to be(false)
    end

    it "returns true for four of a kind" do
      expect(four_of_a_kind_hand.four_of_a_kind?).to be(true)
    end

  end

  describe "#full_house" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:clubs, :five)}
    let(:card3) {Card.new(:hearts, :nine)}
    let(:card4) {Card.new(:spades, :nine)}
    let(:card5) {Card.new(:diamonds, :five)}

    let(:full_house_hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "returns false for straight flush" do
      expect(full_house_hand.straight_flush?).to be(false)
    end

    it "returns false for royal flush" do
      expect(full_house_hand.royal_flush?).to be(false)
    end

    it "returns false for four of a kind" do
      expect(full_house_hand.four_of_a_kind?).to be(false)
    end

    it "returns true for full house" do
      expect(full_house_hand.full_house?).to be(true)
    end

  end

  describe "#best_hand_royal_flush" do
    let(:card1) {Card.new(:hearts, :ten)}
    let(:card2) {Card.new(:hearts, :jack)}
    let(:card3) {Card.new(:hearts, :queen)}
    let(:card4) {Card.new(:hearts, :king)}
    let(:card5) {Card.new(:hearts, :ace)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects royal flush as the best hand" do
      expect(hand.best_hand).to eq(9)
    end

  end

  describe "#best_hand_straight_flush" do
    let(:card1) {Card.new(:hearts, :ten)}
    let(:card2) {Card.new(:hearts, :jack)}
    let(:card3) {Card.new(:hearts, :queen)}
    let(:card4) {Card.new(:hearts, :king)}
    let(:card5) {Card.new(:hearts, :nine)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects straight flush as the best hand" do
      expect(hand.best_hand).to eq(8)
    end

  end

  describe "#best_hand_four_of_a_kind" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:clubs, :five)}
    let(:card3) {Card.new(:hearts, :nine)}
    let(:card4) {Card.new(:spades, :nine)}
    let(:card5) {Card.new(:diamonds, :nine)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects four of a kind as the best hand" do
      expect(hand.best_hand).to eq(7)
    end

  end

  describe "#best_hand_full_house" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:clubs, :five)}
    let(:card3) {Card.new(:hearts, :nine)}
    let(:card4) {Card.new(:spades, :nine)}
    let(:card5) {Card.new(:diamonds, :five)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects full house as the best hand" do
      expect(hand.best_hand).to eq(6)
    end

  end

  describe "#best_hand_flush" do
    let(:card1) {Card.new(:hearts, :ten)}
    let(:card2) {Card.new(:hearts, :jack)}
    let(:card3) {Card.new(:hearts, :four)}
    let(:card4) {Card.new(:hearts, :king)}
    let(:card5) {Card.new(:hearts, :two)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects flush as the best hand" do
      expect(hand.best_hand).to eq(5)
    end

  end

  describe "#best_hand_straight" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:hearts, :ten)}
    let(:card3) {Card.new(:diamonds, :jack)}
    let(:card4) {Card.new(:spades, :queen)}
    let(:card5) {Card.new(:hearts, :king)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects straight as the best hand" do
      expect(hand.best_hand).to eq(4)
    end

  end

  describe "#best_hand_three_of_a_kind" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:hearts, :nine)}
    let(:card3) {Card.new(:diamonds, :jack)}
    let(:card4) {Card.new(:spades, :nine)}
    let(:card5) {Card.new(:hearts, :king)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects three of a kind as the best hand" do
      expect(hand.best_hand).to eq(3)
    end

  end

  describe "#best_hand_two_pairs" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:hearts, :nine)}
    let(:card3) {Card.new(:diamonds, :jack)}
    let(:card4) {Card.new(:clubs, :jack)}
    let(:card5) {Card.new(:spades, :king)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects two pairs as the best hand" do
      expect(hand.best_hand).to eq(2)
    end

  end

  describe "#best_hand_one_pair" do
    let(:card1) {Card.new(:clubs, :nine)}
    let(:card2) {Card.new(:hearts, :nine)}
    let(:card3) {Card.new(:diamonds, :jack)}
    let(:card4) {Card.new(:clubs, :three)}
    let(:card5) {Card.new(:spades, :king)}

    let(:hand) {Hand.new([card1, card2, card3, card4, card5])}

    it "selects one pair as the best hand" do
      expect(hand.best_hand).to eq(1)
    end

  end





end
