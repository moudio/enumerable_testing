require_relative './../enumerable.rb'

RSpec.describe Enumerable do 

  describe "#my_each" do 
    it "applies the block code for each element in array" do 
      expect([1, 2, 3, 4, 5].my_each{ |item| item  }).to eq([1, 2, 3, 4, 5])
    end
  end

  describe "#my_any" do 
    it "any not matches given condition return false" do 
      expect([1, 2, 3, 4, 5].my_any? { |item| item > 6}).to eq(false)
    end
    it "any matches given codition return true" do
      expect([1, 2, 3, 4, 5].my_any? { |item| item < 6}).to eq(true)
    end
  end

  describe "#my_none" do 
    it "none matches given condition return true" do 
      expect([1, 2, 3, 4, 5].my_none? { |item| item > 6}).to eq(true)
    end
    it "matches given codition return false" do
      expect([1, 2, 3, 4, 5].my_none? { |item| item < 6}).to eq(false)
    end
  end

  describe "#my_count" do 
    it "count items of a array return it" do 
      expect([1, 2, 3, 4, 5].my_count).to eq(5)
    end
    it "count argument 1 inside array and return it" do
      expect([1, 2, 3, 4, 5].my_count(1)).to eq(1)
    end
    it "count count items larger than 2 and return it" do
        expect([1, 2, 3, 4, 5].my_count {|x| x > 2}).to eq(3)
    end
  end

  describe "#my_map" do 
    it "map each value *2 and returns it" do 
      expect([1, 2, 3, 4, 5].my_map{ |item| item*2}).to eq([2,4,6,8,10])
    end
    it "map each value +2 using proc as argument" do
      add_by_two = Proc.new { |x| x+2 }
      expect([1, 2, 3, 4, 5].my_map(&add_by_two)).to eq([3,4,5,6,7])
    end
  end

  describe "#my_inject" do 
    it "add each value into acc and returns it" do 
      expect([1, 2, 3, 4, 5].my_inject{ |acc, item| acc+=item}).to eq(15)
    end
    it "if initial value given it add acc from it" do 
      expect([1, 2, 3, 4, 5].my_inject(1){ |acc, item| acc+=item}).to eq(16)
    end
    it "multiply every items with accumlator" do 
      expect([1, 2, 3, 4, 5].my_inject(1){ |acc, item| acc*=item}).to eq(120)
    end
  end

end