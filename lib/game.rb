module Bowling

	class Game
		attr_accessor :frames

		def initialize
			@frames = []
		end

		def score
			frames_scores = []
			bonus = 0
			@frames.each_with_index do |frame, index|
				frames_scores << frame.score
				bonus = add_bonus(index, bonus)
			end
			frames_scores.reduce(:+) + bonus
		end

		def two_extra_balls(index)
			bonus = @frames[index + 1].strike? ? @frames[index + 2].roll[0] : 0
			bonus += @frames[index + 1].score
		end

		def one_extra_ball(index)
			@frames[index + 1].roll[0]
		end

		def add_bonus(index, bonus)
			frame = @frames[index]
			if frame.strike?
				bonus += two_extra_balls(index)
			elsif frame.spare?
				bonus += one_extra_ball(index)
			end
			bonus
		end	
	end
end