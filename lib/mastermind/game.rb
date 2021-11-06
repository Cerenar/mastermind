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
      'You lose. Better luck next time!' if attempt >= 12
    end

    def play
      attempt = 0
      checked_guesses = Array.new(12) { '' }
      while true
        puts ask_guess
        guess = get_guess
        attempt += 1
        checked_guesses[checked_guesses.length - attempt] = board.check_guess(guess)
        board.update(guess, attempt)
        board.formatted_grid(checked_guesses)
        puts game_over_message(guess, attempt)
        return if board.check_guess(guess) == false
        return if attempt >= 12
      end
    end
  end
end
