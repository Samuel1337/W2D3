require_relative "game"
require_relative "human_player"
require_relative "computer_player"

class Board

    def initialize(n)
        @board = Array.new(n-1) { Array.new(n, "_") }
        @board << Array.new(n, " ")
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        @board[pos[0]][pos[1]] = mark
    end

    def valid?(pos)
        self[pos] != nil
    end

    def empty?(pos)
        self[pos] == "_" || self[pos] == " " 
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            self[pos] = mark 
        else
            puts "Invalid input. Try again"
            raise RuntimeError.new "invalid input"
            
        end
    end

    def print
        @board.each { |subArr| puts subArr.join("|") }
    end

    def win_row?(mark)
        @board.each { |subArr| return true if subArr.all? { |el| subArr[0] == el && subArr[0] == mark } }
        return false
    end

    def win_col?(mark)
        (0...@board.length).each { |col| return true if (0...@board.length).all? { |row| @board[row][col] == @board[0][col] } }
        return false
    end

    def win_diagonal?(mark)
        count = 0
        i= 0
        while i < @board.length do
            count += 1 if @board[i][i] == @board[0][0]
            i += 1
        end
        return true if count == @board.length
        
        count = 0
        i = 0
        while i < @board.length do
            count += 1 if @board[i][@board.length - i - 1] == @board[0][-1]
            i += 1
        end
        count == @board.length
    end

    def win?(mark)
        ((win_row?(mark) || win_col?(mark)) || win_diagonal?(mark)) ? true : false
    end

    def empty_positions?
        @board.flatten.any? { |el| el == "_" || el == " " }
    end

    def legal_positions
        legal = []
        (0...@board.length).each { |i| @board[i].each_with_index { |el, j| legal << [i, j] if valid?([i, j]) && empty?([i, j]) } }
        legal
    end
end

if false
    #pry testing

    load "board.rb"
    b = Board.new(3)
    p b.legal_positions
end