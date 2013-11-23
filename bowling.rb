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
			mem += current if  spare?(last, second_last, i)
			mem += current + last if strike?(third_last) 
			mem += current unless i == 21
			last, second_last, third_last = current, last, second_last
			mem
		end
	end

	private
	def spare?(last, second_last, i)
		(last + second_last) > 9 && i.odd? && (second_last != 10 || i == 21)
	end
	def strike?(third_last)
		third_last == 10
	end
end