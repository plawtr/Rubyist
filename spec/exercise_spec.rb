require_relative "../lib/exercise"



describe "map" do
	let (:array) {[1, 2, 3, 4, 5]}
	it "takes a block and returns array with values from the block" do 
		expect(array.map{|element| element + 1}).to eq([2, 3, 4, 5, 6])
	end


	it "it does nothing when not given a block" do 
		expect(array.map).to eq(array)
	end
end

describe "select" do
	let (:array) {[1, 2, 3, 4, 5]}
	it "takes an array and returns values which are true in the block" do 
		expect(array.select{|element| element.odd?}).to eq([1, 3, 5])
	end
end	

describe "each" do
	let (:array) {[1, 2, 3, 4, 5]}
	it "takes an array and passes each value to the block" do 
		a =[]
		array.each{|element| a << element*2 }
		expect(a).to eq([2, 4, 6, 8, 10])
	end
end

describe "proc" do
	it "can be passed to anything that is expecting a block" do
		my_proc = Proc.new {|x| x*2}
		result = [1,2,3].map(&my_proc)

		expect(result).to eq([2,4,6])

	end
end

describe "inject" do
	it "can be passed to anything that is expecting a block" do
		my_proc = Proc.new {|x| x*2}
		result = [1,2,3].map(&my_proc)

		expect(result).to eq([2,4,6])

	end
end

