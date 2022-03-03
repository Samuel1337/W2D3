require_relative "board"
require_relative "player"

class Battleship
    
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        puts "there are " + (@board.size/4).to_s + " ships"
        @board.print
    end

    def lose? 
        if @remaining_misses <= 0
            puts "you lose"
            true
        else
            false
        end
    end

    def win? 
        if @board.num_ships == 0
            puts "you win"
            true
        else
            false
        end
    end

    def game_over?
        lose? || win? ? true : false
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(move) 
        @board.print
        puts "there are " + @remaining_misses.to_s + " chances remaining"
    end
end
