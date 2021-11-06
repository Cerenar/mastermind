module Mastermind
  class Board
    attr_reader :grid, :secret_code

    def initialize(grid = default_grid)
      @grid = grid
      @secret_code = [Random.rand(1..6).to_s, Random.rand(1..6).to_s, Random.rand(1..6).to_s, Random.rand(1..6).to_s]
    end

    # when a player makes a guess, update the guess row
    def update(guess, attempt)
      grid[grid.length - attempt] = guess
    end

    def check_guess(guess)
      miss = 4
      black = count_black(guess)
      white = count_white(guess)
      miss -= white
      white -= black

      return false if black == 4

      ('R' * black).concat('W' * white).concat('_' * miss)
    end

    def formatted_grid(guess)
      grid.each do |row|
        print '| '
        row.each do |peg|
          if peg.nil?
            print '_ '
          else
            print "#{peg} "
          end
        end
        puts '| '
      end
    end

    private

    def default_grid
      Array.new(12) { Array.new(4) }
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
      temp = []
      temp.replace(secret_code)
      count = 0
      guess.each do |peg|
        if temp.include?(peg)
          temp.delete_at(temp.index(peg))
          count += 1
        end
      end
      count
    end
  end
end
