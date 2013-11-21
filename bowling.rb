class BowlingGame
	attr_accessor :rolls

	def initialize
		@rolls=[]
	end

	def roll(pins)
		@rolls << pins
	end

	def score
		@rolls.inject(0) { |mem, var| mem += var }
		# @rolls.inject(:+)
	end

end
