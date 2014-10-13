module Bowling

	class Game
		attr_accessor :frames

		def initialize
			@frames = []
		end

		def score
			frames_scores = []
			bonus = 0
			@frames.each_with_index do |frame, indx|
				frames_scores << frame.score
				if frame.strike?
					bonus += @frames[indx + 1].score
					if @frames[indx + 1].strike?
						bonus += @frames[indx + 2].roll[0]
					end
				elsif frame.spare?
					bonus += @frames[indx + 1].roll[0]
				end
			end
			frames_scores.reduce(:+) + bonus
		end

	end
end