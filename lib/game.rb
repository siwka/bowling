module Bowling
	require 'pry'

	class Game
		attr_accessor :frames

		def initialize
			@frames = []
		end

		def score
			frames_scores = []
			@frames.each_with_index do |frame, index|
					bonus = add_bonus(index) if index < 9
					bonus ||= 0
					frames_scores << frame.score + bonus
			end
			frames_scores.reduce(:+)
		end

		def add_bonus(index)
			frame = @frames[index]
			if frame.strike?
				two_extra_balls(index)
			elsif frame.spare?
				one_extra_ball(index)
			else
				0
			end
		end

		def two_extra_balls(index)
				bonus = @frames[index + 1].score
				bonus += @frames[index + 1].strike? ? @frames[index + 2].roll[0] : 0
		end

		def one_extra_ball(index)
			@frames[index + 1].roll[0]
		end
	end
end