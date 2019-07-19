require_relative './../enumerable.rb'
RSpec.describe Enumerable do 
    describe "#my_each" do 
        it "applies the block code for each element in array" do 
            expect([1, 2, 3, 4, 5].my_each{ |item| item  }).to eq([1, 2, 3, 4, 5])
        end
    end
    
end


