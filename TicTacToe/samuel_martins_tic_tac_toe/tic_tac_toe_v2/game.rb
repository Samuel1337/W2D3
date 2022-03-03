require_relative "board"
require_relative "human_player"

class Game

    def initialize(n, *marks)
        @board = Board.new(n)
        @players = []
        marks.each { |mark| @players << Human.new(mark) }
        @mark = @players[0].mark
    end

    def switch_turn
        @players.rotate!
        @mark = @players[0].mark
    end

    def play

        while @board.empty_positions? do
            @board.print
            begin
                pos = @players[0].get_position
                @board.place_mark(pos, @mark)
            rescue
                retry
            end
            if @board.win?(@mark)
                if @players[0].mark == @mark
                    @board.print
                    puts @players[0].mark.to_s + " WINS"
                    break
                else
                    @board.print
                    puts @players[0].mark.to_s + " WINS" 
                    break
                end
            else
                switch_turn
            end
            puts "DRAW"
        end
    end
 
end

if false
    #pry testing

    load "game.rb"
    g = Game.new(3, :x, :o, :a)
    g.play
end