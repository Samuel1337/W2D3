require_relative "game"
require_relative "human_player"

class Board

    def initialize
        @board =   [["_", "_", "_"],
                    ["_", "_", "_"],
                    [" ", " ", " "]]
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
        @board.each_with_index { |subArr, idx| return true if \
            ((@board[0][idx] == @board[1][idx] && @board[0][idx] == @board[2][idx]) && @board[2][idx] == mark) }
        return false
    end

    def win_diagonal?(mark)
        ( (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]) && @board[2][2] == mark) || ( (@board[2][0] == @board[1][1] && @board[1][1] == @board[2][0]) && @board[2][0] == mark)
    end

    def win?(mark)
        ((win_row?(mark) || win_col?(mark)) || win_diagonal?(mark)) ? true : false
    end

    def empty_positions?
        @board.flatten.any? { |el| el == "_" || el == " " }
    end
end