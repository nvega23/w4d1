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
        good_positions << one_pos if is_valid_pos?(one_pos)
        
        
        
        
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