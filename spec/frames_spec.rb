require 'spec_helper'
 
describe Bowling::Frames do
	before(:each) do
		@frames = Bowling::Frames.new
	end

	describe "#initialize" do
    it "takes no parameter and returns a Frames object" do
        expect(@frames).to be_an_instance_of Bowling::Frames
    end
	end	

  describe "environment settigs" do
    context "create new empty frames" do
      it "creates an empty array" do
        expect(@frames.roll).to eql []
      end
    end
  end

  describe "#score" do
		it "takes two frames rolls and returns score" do
			@frames.roll[0] = 3
			@frames.roll[1] = 3
			expect(@frames.score).to eq(6)
		end

		it "takes two another frame rolls and returns another frames score " do
			@frames.roll[0] = 4
			@frames.roll[1] = 5
			expect(@frames.score).to eq(9)		
		end
	end
end