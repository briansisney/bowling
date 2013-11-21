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
	end

end