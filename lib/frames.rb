module Bowling
	class Frames
	  attr_accessor :roll, :score, :strike, :spare

		def initialize
			@roll = []
		end

		def score
			score = roll[0] + roll[1]
		end

		def strike?
			roll[0] == 10
		end

		def spare?
			!strike? && score == 10
		end

	end
end