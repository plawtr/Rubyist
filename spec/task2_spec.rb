require_relative "../lib/task2"

describe Takeaway do 

let(:pod) {Takeaway.new(menu)}
let(:menu) {{sandwhich: 3.60, cola: 2.00}}
let(:order) {{sandwhich: 1, cola: 1}}
let(:correct_total) {5.60}
let(:incorrect_total) {5.00}

	it "should initialize with a list of dishes and prices" do
		expect(pod.menu).to eq(menu)
	end

	context "orders"
	it "should raise an error if the total is incorrect" do
		expect{pod.place_order(order, incorrect_total)}.to raise_error(RuntimeError)
	end

	it "should send an sms when the order is placed" do 
		pod.place_order(order, correct_total)
	end


	
end