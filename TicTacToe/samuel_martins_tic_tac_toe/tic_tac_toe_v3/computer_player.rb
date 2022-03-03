require_relative "game"
require_relative "board"
require_relative "human_player"

class Computer

    def initialize(mark_value)
        @mark = mark_value
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        puts "COMPUTER PLAYS"
        legal_positions.sample 
    end
end