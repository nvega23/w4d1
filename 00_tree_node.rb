class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(n)
        @parent = nil
        @children = []
        @value = n
    end



    def parent=(node)
        # if !self.parent.nil?
        #     if self.parent.length > 0
        #         node2 = self.parent
        #         node2.children.pop

        #     end
        # end
        if !self.parent.nil?
            self.parent.children.delete(self)
        end

        @parent = node
        if !@parent.nil?
            if !@parent.children.include?(self)
                @parent.children << self
            end
        end

    end

    def add_child(node)
        node.parent=(self)
    end

    def remove_child(node)
        if !self.children.include?(node)
            raise 'error'
        end
        node.parent=(nil)
    end
    def dfs(target_value)
        return self if self.value == target_value
        # return self if
        return self if self.children.length == 0
        if self.children.length != 0
            self.children.each do |child|
                dfs(child)
            end
        end
        # until arr[idx] == arr.length - 1
        # try to find value
        # if that value isnt in that node
        # 
        # when we go down
        # if idx == target
        # if not go into children arr, check if ele == target
    end
end
