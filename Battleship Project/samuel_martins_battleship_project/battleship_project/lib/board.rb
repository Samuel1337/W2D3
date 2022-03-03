class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def size
        @size
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val) 
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            puts "you sunk my battleship!"
            self[pos] = :H 
            true
        else 
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        n = @grid.length
        i = 0
        while i < @size/4 do
            x = rand(0...n)
            y = rand(0...n)
            if @grid[x][y] == :N
                @grid[x][y] = :S 
                i += 1
            end
        end
    end

    def hidden_ships_grid
        hidden = @grid.map { |subArr| subArr.map { |el| el == :S ? :N : el } }
        hidden
    end

    def self.print_grid(grid)
        grid.each { |subArr| puts subArr.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end
