require_relative "game"
require_relative "board"

class Human

    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position
        puts "Play: "
        input = gets.chomp
        space = input.index(" ")
        if space == nil
            puts "Invalid input. Try again"
            raise RuntimeError.new "invalid input. Try again"
        end
        row = input[0...space]
        col = input[space+1..-1]
        if "abcdefghijklmnopqrstuvwxyz ".include?(row + col)
            puts "Invalid input. Try again"
            raise RuntimeError.new "invalid input. Try again" 
        end
        [row.to_i, col.to_i]
    rescue
        retry
    end
end