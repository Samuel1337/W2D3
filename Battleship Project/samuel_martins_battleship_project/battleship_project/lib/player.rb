class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        input = gets.chomp # '1 1'
        space = input.index(" ") # 1
        [input[0...space].to_i,input[space+1..-1].to_i] # [1 , 1]
    end
end
