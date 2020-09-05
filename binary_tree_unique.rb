# frozen_string_literal: true

class BinaryTreeUnique
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

  def store_array(arr)
    arr.each { |v| store_number(v) }
  end

  def show_in_order
    result = Array.new(@numbers_stored)
    in_order_traversal(@tree, result, 0)
    result
  end

  def clear
    remove_descendants(@tree)
    initialize
  end

  def copy
    clone = BinaryTreeUnique.new
    from_root_to_leaves(@tree, clone)
    clone
  end

  def contains?(num)
    search_node(@tree, num)
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

  def in_order_traversal(node, result, index)
    index = in_order_traversal(node.left, result, index) if node.left

    node.counter.times { result[index] = node.value; index += 1 }

    index = in_order_traversal(node.right, result, index) if node.right

    index
  end

  def remove_descendants(node)
    remove_descendants(node.left)  if node.left
    remove_descendants(node.right) if node.right
    node.left  = nil
    node.right = nil
  end

  def from_root_to_leaves(node, clone)
    node.counter.times { clone.store_number(node.value) }
    from_root_to_leaves(node.left, clone)  if node.left
    from_root_to_leaves(node.right, clone) if node.right
  end

  def search_node(node, number)
    case number <=> node.value
    when -1
      return search_node(node.left, number) if node.left
    when 0
      return true
    when 1
      return search_node(node.right, number) if node.right
    end
    false
  end
end
