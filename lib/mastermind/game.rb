module Mastermind
  class Game
    attr_reader :board
    def initialize(board = Board.new)
      @board = board
    end

    def ask_guess
      'Put guess'
    end

    def get_guess(guess = gets.chomp)
      guess.split
    end

    def play
      while true
        puts ''
        puts ask_guess
        guess = get_guess
        p guess
        p board.secret_code
        return if board.check_guess(guess) == false
      end
    end
  end
end
