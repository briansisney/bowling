class BowlingGame
	attr_accessor :rolls

	def initialize
		@rolls=[]
	end

	def roll(pins)
		@rolls << pins
	end

	def score
		second_last = 0
		last = 0
		# @rolls.inject(0) do |mem, current|
		# 	if (last + second_last) > 9
		# 		2.times{ mem += current }
		# 	else
		# 		mem += current
		# 	end
		# 	  second_last = last
		# 	  last = current
		# 	  mem
		# end


		@rolls.inject(0) do |mem, current|
			mem += current if (last + second_last) > 9	
			mem += current
			second_last = last
		    last = current
			mem
		end

	end

end
