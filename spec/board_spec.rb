module Mastermind
  describe Board do
    context '#check_guess' do
      it 'returns flags as expected' do
        board = Board.new
        guess = [1, 2, 4, 6]
        expect(board.check_guess(guess)).to eq('RRW-')
      end

      it 'returns false positive white flags' do
        board = Board.new
        guess = [1, 1, 1, 1]
        expect(board.check_guess(guess)).to eq('RWWW')
      end
    end

    context '#count_black' do
      it 'returns flags as expected' do
        board = Board.new
        guess = [2, 1, 1, 6]
        expect(board.count_black(guess)).to eq(2)
      end
    end

    context '#count_white' do
      it 'returns flags as expected' do
        board = Board.new
        guess = [1, 2, 1, 2]
        expect(board.count_white(guess)).to eq(4)
      end
    end
  end
end