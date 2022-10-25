

class PolyTreeNode
    attr_accessor :parent, :children, :value

    def initialize(n)
        @parent = nil
        @children = []
        @value = n
    end



    def parent=(node)
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

        return self if target_value == self.value

        children.each do |child|
        result = child.dfs(target_value) 
        return result unless result.nil?
        end

        nil
    end

    def bfs(target)
        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if target == node.value
            nodes.concat(node.children)
        end

        nil
    end
end
