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


  def show_in_order(node     = @tree,
                    elements = Array.new(@numbers_stored),
                    index    = 0)

    if node.left
      arr      = show_in_order(node.left, elements, index)
      elements = arr[0]
      index    = arr[1]
    end

    node.counter.times do
      elements[index] = node.value
      index += 1
    end

    if node.right
      arr      = show_in_order(node.right, elements, index)
      elements = arr[0]
      index    = arr[1]
    end

    [elements, index]
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
