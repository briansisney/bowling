class BowlingGame
	attr_accessor :rolls

	def initialize
		@rolls=[]
	end

	def roll(pins)
		@rolls << pins
		roll(0) if pins > 9 && @rolls.length < 19
	end

	def score
		i, last, second_last, third_last = 0, 0, 0, 0
		@rolls.inject(0) do |mem, current|
			i += 1
			mem += current if (last + second_last) > 9 && i.odd? && (second_last != 10 || i == 21)
			mem += current + last if third_last == 10 
			mem += current unless i == 21
			last, second_last, third_last = current, last, second_last
			mem
		end
	end
	
end
