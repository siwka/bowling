require 'spec_helper'

describe "game" do
	before(:each) do
		@game = Bowling::Game.new
		@frames = Bowling::Frames.new
		@frames1 = Bowling::Frames.new
		@frames2 = Bowling::Frames.new			
	end	

	describe "#initialize" do
    it "returns a Bowling:Game object" do  	
       expect(@game).to be_an_instance_of Bowling::Game
    end
	end

	describe "new" do
		it "has no frames" do
			expect(@game.frames.count).to eq(0)
		end
	end	

	it "should return sum of frames score" do
		@frames1.roll[0] = 3
		@frames1.roll[1] = 2
		@frames2.roll[0] = 2
		@frames2.roll[1] = 7		
		expect(@frames1.score).to eq(5)
		expect(@frames2.score).to eq(9)
		@game.frames << @frames1 << @frames2
		expect(@game.score).to eq(14)
	end

	it "should return sum of frames score and first roll of another if spare was scored" do	
		@frames1.roll[0] = 3
		@frames1.roll[1] = 7
		@frames2.roll[0] = 2
		@frames2.roll[1] = 5
		@game.frames << @frames1 << @frames2
		expect(@game.score).to eq(19)
	end

	it "should return sum of frames score and score of another frame if strike was scored" do	
		@frames1.roll[0] = 10
		@frames1.roll[1] = 0
		@frames2.roll[0] = 2
		@frames2.roll[1] = 5
		@game.frames << @frames1 << @frames2
		expect(@game.score).to eq(24)
	end
	it "should add to total score bonuses if spare was scored twice in a row" do
		@frames1.roll[0] = 7
		@frames1.roll[1] = 3
		@frames2.roll[0] = 5
		@frames2.roll[1] = 5
		@frames3 = Bowling::Frames.new
		@frames3.roll[0] = 4
		@frames3.roll[1] = 0		
		@game.frames << @frames1 << @frames2 << @frames3
		expect(@game.score).to eq(33)
	end

	it "should add to total score bonuses if strike was scored twice in a row" do
		@frames1.roll[0] = 10
		@frames1.roll[1] = 0
		@frames2.roll[0] = 10
		@frames2.roll[1] = 0
		@frames3 = Bowling::Frames.new
		@frames3.roll[0] = 4
		@frames3.roll[1] = 2		
		@game.frames << @frames1 << @frames2 << @frames3
		expect(@game.score).to eq(46)
	end	
end
