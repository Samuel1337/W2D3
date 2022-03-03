require_relative "board"
require_relative "human_player"

class Game

    def initialize(n, *marks)
        @board = Board.new(n)
        @players = []
        marks.each { |mark| @players << Human.new(mark) }
        @marks = marks
        @mark = marks[0]
    end

    @@i = 0

    def switch_turn
        @@i += 1
        @@i = 0 if @@i == @marks.length 
        @mark = @marks[@@i]
    end

    def play

        while @board.empty_positions? do
            @board.print
            begin
                pos = @players[@@i].get_position
                @board.place_mark(pos, @mark)
            rescue
                retry
            end
            if @board.win?(@mark)
                if @players[@@i].mark == @mark
                    @board.print
                    puts @players[@@i].mark.to_s + " WINS"
                    break
                else
                    @board.print
                    puts @players[@@i].mark.to_s + " WINS" 
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
    g = Game.new(1, :x, :o, :a)
    g.play
end