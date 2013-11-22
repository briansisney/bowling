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

		#SPARE
		# i=0
		# @rolls.inject(0) do |mem, current|
		# 	i+=1
		# 	mem += current if (last + second_last) > 9 && i.odd?
		# 	mem += current
		# 	second_last = last
		#     last = current
		# 	mem
		# end
			
		#Strike
		class BowlingGame
	attr_accessor :rolls

	def initialize
		@rolls=[]
	end

	def roll(pins)
		@rolls << pins
		roll(0) if pins > 9
	end

	def score
		i, last, second_last, third_last = 0, 0, 0, 0
		@rolls.inject(0) do |mem, current|
			i += 1
			mem += current if (last + second_last) > 9 && i.odd? && second_last != 10
			mem += current + last if third_last == 10
			mem += current
			last, second_last, third_last = current, last, second_last
			mem
		end
	end
end
# mem += current + last if second_last == 10 && @rolls.length == 21
&& @rolls.length <= 19


# bs
		valid19?, valid20? = @rolls[19].nil?, @rolls[20].nil?

		if !roll20.nil? && (roll19 + roll20) > 10
			subtotal = @rolls[20].pop + @rolls[19].pop + roll21
		end