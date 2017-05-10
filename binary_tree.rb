class BinaryTree
  
  def initialize
    @node_values = []
    @nodes = []
    @queue = []
    @stack = []
  end
  
  def build_tree(ary)
    
    n = ary.length
    mid = n / 2
    @root = Node.new(ary[rand(0..ary.length - 1)], nil, nil, nil)
    root = @root
    @node_values << root.value
    ary.delete(root.value)
    
    ary.each do |node_value|
      
      while @node_values.include?(node_value) == false
        if node_value < root.value && root.left_child == nil
          root.left_child = Node.new(node_value, root, nil, nil)
          @node_values << node_value
          @nodes << root.left_child
        elsif node_value > root.value && root.right_child == nil
          root.right_child = Node.new(node_value, root, nil, nil)
          @node_values << node_value
          @nodes << root.right_child
        elsif node_value < root.value && root.left_child != nil
          root = root.left_child
        elsif node_value > root.value && root.right_child != nil
          root = root.right_child
        end
      end
    end
    @node_values
  end
  
  def nodes
    @nodes
  end
  
  def root
    @root
  end
  
  def breadth_first_search(value)
    pointer = @root
    i = 0
    while pointer.value != value && i < @nodes.length
      if pointer.right_child != nil
        @queue << pointer.right_child
      end
      if pointer.left_child != nil
        @queue << pointer.left_child
        pointer = pointer.left_child
        i += 1
      end
      if @queue[0] != nil
        pointer = @queue[0]
        @queue.shift
        i += 1
      end
    end
    if i >= @nodes.length && pointer.value != value
      return "Value not found"
    else   
      return pointer.value
    end
  end
  
  def dfs_rec(pointer, value)
    if pointer == nil
      return pointer
    else
      dfs_rec(pointer.left_child, value)
      dfs_rec(pointer.right_child, value)
      if pointer.value = value
        return pointer
      end
    end
    "Value not found"
  end
  
  def depth_first_search(pointer, value)
    i = 0
    @stack << pointer
    while i < @nodes.length * 2
      if pointer.value == value
        return pointer
      end
      if pointer.right_child != nil
        @stack << pointer.right_child
      end
      if pointer.left_child != nil
        pointer = pointer.left_child
        i += 2
      else
        pointer = @stack[-1]
        @stack.pop
        i += 1
      end
    end
    "Value not found"
  end

class Node
  attr_accessor :value, :parent, :left_child, :right_child
  
  def initialize(value, parent, left_child, right_child)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end
  
  def value
    @value
  end
  
  def parent
    @parent
  end
  
  def left_child
    @left_child
  end
  
  def right_child
    @right_child
  end

end
end

my_tree = BinaryTree.new

my_tree.build_tree([1, 4, 3, 324, 7, 9, 23, 5, 67, 8])

my_tree.nodes

#my_tree.nodes.each do |node|
  #puts node.value
#end

#my_tree.breadth_first_search(90)
pointer = my_tree.root
#my_tree.dfs_rec(pointer, 23)

my_tree.depth_first_search(pointer, 7)