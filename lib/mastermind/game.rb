module Mastermind
  class Game
    attr_reader :board
    def initialize(board = Board.new)
      @board = board
    end

    def ask_guess
      'Enter a guess!'
    end

    def get_guess(guess = gets.chomp)
      guess.split
    end

    def game_over_message(guess, attempt)
      return 'You win!' if board.check_guess(guess) == false
      return 'You lose. Better luck next time!' if attempt >= 12

      board.check_guess(guess)
    end

    def play
      attempt = 0
      while true
        puts ''
        puts ask_guess
        guess = get_guess
        puts ''
        attempt += 1
        board.update(guess, attempt)
        board.formatted_grid(guess)
        puts game_over_message(guess, attempt)
        return if board.check_guess(guess) == false
        return if attempt >= 12
      end
    end
  end
end
