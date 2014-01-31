require_relative "../lib/task1"

describe "injekt" do
	let (:array) {[1, 2, 3, 4, 5]}
	
	it "takes an optional initial value for the memo" do
		expect(array.injekt(1){|sum, n| sum + n }).to eq(16)
	end

	it "takes a block and applies it to the elements recording the result in a memo that is returned" do 
		expect(array.injekt{|sum, n| sum + n}).to eq(15)
	end

	it "works with the multiplication" do 
		expect(array.injekt{|prod, n| prod*n }).to eq(120)
		expect(array.injekt(1){|prod, n| prod*n }).to eq(120)
		expect(array.injekt(2){|prod, n| prod*n }).to eq(240)
		expect(array.injekt(0){|prod, n| prod*n }).to eq(0)
	end
end

	describe "recursive inject" do
	let (:array) {[1, 2, 3, 4, 5]}
	
	it "takes an optional initial value for the memo" do
		expect(array.rinjekt(1){|sum, n| sum + n }).to eq(16)
	end

	it "takes a block and applies it to the elements recording the result in a memo that is returned" do 
		expect(array.rinjekt{|sum, n| sum + n}).to eq(15)
	end

	it "works with the multiplication without the inital value" do 
		expect(array.rinjekt{|prod, n| prod*n }).to eq(120)
	end

	it "works with the multiplication with the inital value" do
		expect(array.rinjekt(3){|prod, n| prod*n }).to eq(360)
		expect(array.rinjekt(2){|prod, n| prod*n }).to eq(240)
		expect(array.rinjekt(0){|prod, n| prod*n }).to eq(0)
	end
end