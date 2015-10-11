require 'water'

describe 'Unit - Water' do
	let(:water){Water.new}
	it "can be hit" do
		water.hit!
		expect(water).to be_hit
	end

end
