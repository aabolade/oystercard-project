require 'oyster_card'

describe Oystercard do
subject(:oyster) { described_class.new }

    context "new card" do
    it 'should have a default balance' do
      expect(oyster.balance).to eq 0
    end
  end

    context "topping up" do
      it 'should add money to the card' do
        oyster.top_up(10)
        expect(oyster.balance).to eq 10
      end
      it 'should have a maximum balance of £90' do
        oyster.top_up(90)
        expect{ oyster.top_up(1) }.to raise_error "Card cannot be loaded over £#{Oystercard::MAXIMUM_BALANCE}."
      end
      it 'should not be able to top up over £90' do
        expect{ oyster.top_up(100) }.to raise_error "Card cannot be loaded over £#{Oystercard::MAXIMUM_BALANCE}."
      end
    end

    context "deducting fares" do
      it 'should deduct money from the card' do
        oyster.top_up(15)
        oyster.deduct(10)
        expect(oyster.balance).to eq 5
      end
    end

    context "touching in" do
      it 'should set in_journey to true' do
        oyster.touch_in
        expect(oyster.in_journey).to be true
      end
    end

    context "in_journey?" do
      it 'should show whether in_journey?' do
      expect(oyster.in_journey?).to be false
    end
      it 'should show true when in_journey? after touching in' do
      oyster.touch_in
      expect(oyster.in_journey?).to be true
    end
  end

    context "touch_out" do
      it 'should show false when in_journey? after touching out' do
      oyster.touch_in
      oyster.touch_out
      expect(oyster.in_journey?).to be false
    end
  end

  end
