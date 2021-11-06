require 'spec_helper'

module Mastermind
  describe Board do
    context '#check_guess' do
      it 'should say that the guess is off' do
        board = Board.new
        guess = [1, 1, 1, 6]
        expect(board.check_guess(guess)).to eq('RW__')
      end

      it 'should see that all four pegs are correct' do
        board = Board.new
        guess = [2, 1, 2, 1]
        expect(board.check_guess(guess)).to eq(:winner)
      end
    end
  end
end
