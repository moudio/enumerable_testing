# frozen_string_literal: true

require_relative './../enumerable.rb'
RSpec.describe Enumerable do
  describe '#my_each' do
    it 'returns a new array with doubled elements' do
      arr = []
      [1, 2, 3, 4, 5].my_each { |item| arr << item * 2 }
      expect(arr).to eq([2, 4, 6, 8, 10])
    end
    it 'just returns the original array' do
      expect(%w[JavaScript Ruby Python].my_each { |item| item }).to eq(%w[JavaScript Ruby Python])
    end
  end

  describe '#my_select' do
    it 'selects only the even elements' do
      expect((2..10).to_a.my_select(&:even?)).to eq([2, 4, 6, 8, 10])
    end
    it 'returns the ood elements' do
      expect((1..10).to_a.my_select(&:odd?)).to eq([1, 3, 5, 7, 9])
    end
  end

  describe '#my_all?' do
    it 'returns true if all the elements greater than one ' do
      expect((2..10).to_a.my_all? { |item| item > 1 }).to eq(true)
    end
    it 'returns false if any of the elements length less than 5' do
      expect((%w[bacon orange apple].my_all? { |item| item.length > 5 })).to eq(false)
    end
    it 'returns true if all the elements are string' do
      expect(%w[ruby java js].my_all? { |item| item.class == String }).to eq(true)
    end
  end

  describe '#my_each_with_index' do
    it 'returns the element and its index' do
      expect(([11, 25, 113].my_each_with_index { |_item, index| index })).not_to eq([1, 2, 3])

      expect([120, 10, 25].my_each_with_index { |item, _index| item * 4 }).to eq([120, 10, 25])
    end

    describe '#my_any' do
      it 'any not matches given condition return false' do
        expect([1, 2, 3, 4, 5].my_any? { |item| item > 6 }).to eq(false)
      end
      it 'any matches given codition return true' do
        expect([1, 2, 3, 4, 5].my_any? { |item| item < 6 }).to eq(true)
      end
    end

    describe '#my_none' do
      it 'none matches given condition return true' do
        expect([1, 2, 3, 4, 5].my_none? { |item| item > 6 }).to eq(true)
      end
      it 'matches given codition return false' do
        expect([1, 2, 3, 4, 5].my_none? { |item| item < 6 }).to eq(false)
      end
    end

    describe '#my_count' do
      it 'count items of a array return it' do
        expect([1, 2, 3, 4, 5].my_count).to eq(5)
      end
      it 'count argument 1 inside array and return it' do
        expect([1, 2, 3, 4, 5].my_count(1)).to eq(1)
      end
      it 'count count items larger than 2 and return it' do
        expect([1, 2, 3, 4, 5].my_count { |x| x > 2 }).to eq(3)
      end
    end

    describe '#my_map' do
      it 'map each value *2 and returns it' do
        expect([1, 2, 3, 4, 5].my_map { |item| item * 2 }).to eq([2, 4, 6, 8, 10])
      end
      it 'map each value +2 using proc as argument' do
        add_by_two = proc { |x| x + 2 }
        expect([1, 2, 3, 4, 5].my_map(&add_by_two)).to eq([3, 4, 5, 6, 7])
      end
    end

    describe '#my_inject' do
      it 'add each value into acc and returns it' do
        expect([1, 2, 3, 4, 5].my_inject { |acc, item| acc += item }).to eq(15)
      end
      it 'if initial value given it add acc from it' do
        expect([1, 2, 3, 4, 5].my_inject(1) { |acc, item| acc += item }).to eq(16)
      end
      it 'multiply every items with accumlator' do
        expect([1, 2, 3, 4, 5].my_inject(1) { |acc, item| acc *= item }).to eq(120)
      end
    end
  end
end
