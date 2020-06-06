class Node
  attr_accessor :value, :left, :right, :tree_size

  def initialize
    @tree_size = 0
  end

  def add_node(num)
    @tree_size += 1

    if @value.nil?
      @value = num
      @left  = Node.new
      @right = Node.new

    elsif num <= @value
      @left.add_node(num)

    else
      @right.add_node(num)
    end
  end


  def show_in_order
    result = Array.new(@tree_size)
    in_order_traversal(self, result, 0)
    result
  end


  private

  def in_order_traversal(node, result, i)
  i = in_order_traversal(node.left, result, i) if node.left.value

  result[i] = node.value
  i += 1

  i = in_order_traversal(node.right, result, i) if node.right.value

  i
  end
end
