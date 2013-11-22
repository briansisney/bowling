require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowling'

describe BowlingGame do
	let(:game){BowlingGame.new}
	describe '.initialize' do
		it 'sets @rolls to and empty array' do
			expect(game.rolls).to eq([])			
		end
	end
	# describe '#score' do
	# 	it 'totals the rolls at the begining of the game'do
	# 		expect(game.score).to eq(0)
	# 	end
	# end
	describe '#score' do
		context 'when only gutter balls are thown'do
			it 'scores the game as 0'do
				20.times{ game.roll(0)}
				expect(game.score).to eq(0)
			end
		end
		context 'when one pin is knocked down per roll'do
			it 'scores the game as 20'do
				20.times {game.roll(1)}
				expect(game.score).to eq(20)
			end
		end
		context 'when spare occurs' do
			it 'records the the pin after'do
				3.times {game.roll(5)}
				expect(game.score).to eq(20)
			end
			it 'records spare in only right frame'do
				5.times {game.roll(5)}
				expect(game.score).to eq(35)
			end
		end
		context 'when strike occurs' do
			it 'records the next two numbers'do
				game.roll(10)
				2.times{game.roll(3)}
				expect(game.score).to eq(22)
			end
			it 'records the next two numbers but does not create a spare on the third roll'do
				game.roll(10)
				2.times{game.roll(3)}
				game.roll(9)
				expect(game.score).to eq(31)
			end
		end
		context 'when game ends' do
			it 'with 21 rolls and only 20 are counted'do
				21.times {game.roll(1)}
				expect(game.score).to eq(20)
			end
			it 'with a spare on 20th roll with a 9'do
				18.times {game.roll(0)}
				game.roll(1)
				game.roll(9)
				game.roll(2)
				expect(game.score).to eq(12)
			end
			it 'with a spare on 20th roll with a 10'do
				18.times {game.roll(0)}
				game.roll(0)
				game.roll(10)
				game.roll(2)
				expect(game.score).to eq(12)
			end
			it 'with a strike on 20th roll'do
				18.times {game.roll(0)}
				game.roll(10)
				game.roll(2)
				game.roll(2)
				expect(game.score).to eq(14)
			end
		end

		#when a strike occurs add correctly


	end

end