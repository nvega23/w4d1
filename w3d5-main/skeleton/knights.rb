require "./lib/00_tree_node.rb"

class KnightPathFinder
    attr_accessor :grid, :pos, :considered_positions
    def KnightPathFinder.valid_moves(pos)
        if pos[0] < 8 && pos[0] >= 0
            if pos[1] < 8 && pos[1] >= 0
                return true
            end
        end
        return false
    end
    def initialize(pos)
        @grid = Array.new(8){Array.new(8)}
        # @node = no.new
        @pos = pos
        available_pos = []
        @root_node = PolyTreeNode.new(@pos)
        @considered_positions = [@pos]
    end

    def new_move_positions(pos)
        new_arr = self.pos_pass(pos)
        output = []
        new_arr.each do |ele|
            if !@considered_positions.include?(ele)
                output << ele
                @considered_positions << ele
            end
        end
        return output
    end

    # def find_path(pos)

    # end

    def pos_pass(pos)
        good_positions = []
        one_pos = [(pos[0]-1) , (pos[1]-2)]
        second_pos = [(pos[0]-1) , (pos[1]+2)]
        third_pos = [(pos[0]+1) , (pos[1]-2)]
        fourth_pos = [(pos[0]+1) , (pos[1]+2)]
        fifth_pos = [(pos[0]-2) , (pos[1]-1)]
        sixth_pos = [(pos[0]-2) , (pos[1]+1)]
        seventh_pos = [(pos[0]+2) , (pos[1]-1)]
        eighth_pos = [(pos[0]+2) , (pos[1]+1)]
        good_positions << one_pos if KnightPathFinder.valid_moves(one_pos)
        good_positions << second_pos if KnightPathFinder.valid_moves(second_pos)
        good_positions << third_pos if KnightPathFinder.valid_moves(third_pos)
        good_positions << fourth_pos if KnightPathFinder.valid_moves(fourth_pos)
        good_positions << fifth_pos if KnightPathFinder.valid_moves(fifth_pos)
        good_positions << sixth_pos if KnightPathFinder.valid_moves(sixth_pos)
        good_positions << seventh_pos if KnightPathFinder.valid_moves(seventh_pos)
        good_positions << eighth_pos if KnightPathFinder.valid_moves(eighth_pos)
        return good_positions
    end

    def [](pos)
        row, col = pos[0], pos[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos[0], pos[1]
        @grid[row][col] = PolyTreeNode.new(value)
    end

    def build_move_tree

        queue = [@root_node]
        
        until queue.empty?
            curr = queue.shift
            new_move_positions(curr.value).each do |pos1|
                node = PolyTreeNode.new(pos1)
                curr.add_child(node)
                queue << node
            end
            
        end
       
    end

    def find_path(end_pos)
        build_move_tree
        @root_node.dfs(end_pos)
    end

    def trace_path_back(end_pos)
        output = []
        tree = find_path(@root_node.value)
        until tree.children.length == 0
            output << tree.children
            tree = tree.children.children
        end
        output.reverse
    end
end