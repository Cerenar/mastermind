module Mastermind
  class Board
    attr_reader :grid, :secret_code

    def initialize(grid = default_grid)
      @grid = grid
      @secret_code = [2, 1, 2, 1]
    end

    # when a player makes a guess, update the guess row
    def update(guess, attempt)
      grid[grid.length-attempt] = guess
    end

    def check_guess(guess)
      checker = ''
      guess.each_index do |peg|
        if secret_code[peg] == guess[peg]
          checker += 'R'
        elsif secret_code.any?(guess[peg])
          checker += 'W'
        else
          checker += '-'
        end
      end
      checker
    end

    def count_black(guess)
      count = 0
      guess.each_index do |peg|
        if secret_code[peg] == guess[peg]
          count += 1
        end
      end
      count
    end

    def count_white(guess)
      temp = secret_code
      count = 0
      guess.each do |peg|
        if temp.include?(peg)
          temp.delete_at(temp.index(peg))
          count += 1
        end
      end
      count
    end
    
    private

    def default_grid
      Array.new(12) { Array.new(4) }
    end

    

  end
end
