require_relative './../enumerable.rb'
RSpec.describe Enumerable do 
    describe "#my_each" do 
        it "applies the block code for each element in array" do 
            expect([1, 2, 3, 4, 5].my_each{ |item| item  }).to eq([1, 2, 3, 4, 5])
            expect( 
             ["a", "b", "c"].each{|item|  item + "b"} 
                ).to \
                 eq(["a", "b", "c"])
        end
    end
        describe "#my_select" do 
            it "selects only the elements that satifies the condition inside the block" do 
            expect((2..10).to_a.my_select{|item| item % 2 == 0 }).to eq([2,4,6,8,10])
        end
    end
        describe "#my_all?" do 
            it "returns true if all the elements satisfies the block condition" do 
                expect((2..10).to_a.my_all?{|item| item > 1}).to eq(true)
                expect((["bacon", "orange", "apple"].my_all?{|item| item.length > 5})).to eq(false)
                expect((["mi", "mouha", "string"]).my_all?{|item| item.class == String }).to eq(true)
            end
        end
        describe "#my_each_with_index" do 
            it "returns the element and its index" do 
            expect( (hash = Hash.new %w(cat dog wombat).each_with_index { |item, index| hash[item] = index})).to eq({"cat"=>0, "dog"=>1, "wombat"=>2})
            
        end
    end 

end
