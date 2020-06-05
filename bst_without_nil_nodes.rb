class BinaryTree
  attr_reader :numbers_stored, :sum, :min_number, :max_number

  def initialize
    @tree           = Node.new
    @numbers_stored = 0
    @sum            = 0
    @min_number     = nil
    @max_number     = nil
  end


  def store_number(num)
    add_node(@tree, num)
    @numbers_stored += 1
    @sum            += num
    @min_number      = @min_number.nil? ? num : [@min_number, num].min
    @max_number      = @max_number.nil? ? num : [@max_number, num].max
  end


  def show_in_order
    result = Array.new(@numbers_stored)
    in_order_traversal(@tree, result, 0)
    result
  end


  def in_order_traversal(node, result, i)
    i = in_order_traversal(node.left, result, i) if node.left

    node.counter.times { result[i] = node.value; i += 1 }

    i = in_order_traversal(node.right, result, i) if node.right

    i
  end


  private

  class Node
    attr_accessor :value, :left, :right, :counter

    def initialize(num = nil)
      @value   = num
      @counter = num.nil? ? 0 : 1
      @left    = nil
      @right   = nil
    end
  end


  def add_node(node, num)
    if node.value.nil?
      node.value    = num
      node.counter += 1

    else
      case num <=> node.value

      when -1
        node.left.nil? ? node.left = Node.new(num) : add_node(node.left, num)

      when 0
        node.counter += 1

      when 1
        node.right.nil? ? node.right = Node.new(num) : add_node(node.right, num)
      end
    end
  end
end
