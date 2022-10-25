require_relative '00_tree_node'

class KnightPathFinder
    def initialize(pos)
        @grid = Array.new(8){Array.new(8)}
        # @node = no.new
        @pos = pos
        available_pos = []
    end

    def find_path(pos)
        good_positions = []
        one_pos = [(pos[0]-1) , (pos[1]-2)]
        two_pos = [(pos[0]-1) , (pos[1]+2)]
        three_pos = [(pos[0]+1) , (pos[1]-2)]
        four_pos = [(pos[0]-1) , (pos[1]-2)]
        five_pos = [(pos[0]-1) , (pos[1]-2)]
        six_pos = [(pos[0]-1) , (pos[1]-2)]
        seven_pos = [(pos[0]-1) , (pos[1]-2)]
        eight_pos = [(pos[0]-1) , (pos[1]-2)]
        

    end

    def is_valid_pos?(pos)
        if pos[0] < 8 && pos[0] >= 0
            if pos[1] < 8 && pos[1] >= 0
                return true
            end
        end
        return false
    end
end