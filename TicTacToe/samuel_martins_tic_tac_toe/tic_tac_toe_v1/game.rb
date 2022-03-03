require_relative "board"
require_relative "human_player"

class Game

    def initialize(mark1, mark2)
        @board = Board.new
        @player1 = Human.new(mark1)
        @player2 = Human.new(mark2)
        @mark = mark1
    end

    def switch_turn
        @mark == @player1.mark ? @mark = @player2.mark : @mark = @player1.mark
    end

    def play

        while @board.empty_positions? do
            @board.print
            begin
                @player1.mark == @mark ? pos = @player1.get_position : pos = @player2.get_position 
                @board.place_mark(pos, @mark)
            rescue
                retry
            end
            if @board.win?(@mark)
                if @player1.mark == @mark
                    puts @player1.mark.to_s + " WINS"
                    @board.print
                    break
                else
                    puts @player2.mark.to_s + " WINS" 
                    @board.print
                    break
                end
            else
                switch_turn
            end
        puts "DRAW"
    end
    end
 
end