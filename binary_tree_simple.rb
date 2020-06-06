class Node
  attr_accessor :value, :left, :right, :tree_size

  def initialize
    @tree_size = 0
  end


  def store_number(num)
    @tree_size += 1

    if @value.nil?
      @value = num
      @left  = Node.new
      @right = Node.new

    elsif num <= @value
      @left.store_number(num)

    else
      @right.store_number(num)
    end
  end


  def store_array(arr)
    arr.each { |v| self.store_number(v)}
  end


  def show_in_order
    return [] if @value == nil

    result = Array.new(@tree_size)
    in_order_traversal(self, result, 0)
    result
  end


  def clear
    @left.clear  if @left.value
    @right.clear if @right.value

    @left, @right, @value = nil
    @tree_size            = 0
  end


  def copy
    clone = Node.new
    from_root_to_leaves(self, clone) if @value != nil
    clone
  end


  def contains?(num)
    false if @value == nil

    case num <=> @value
    when -1
      @left.contains?(num)
    when 0
      true
    when 1
      @right.contains?(num)
    end
  end


  def remove_node(num)
    node_to_delete = removing_search(num)

    if node_to_delete == false
      puts 'there is no such number in db'
    elsif node_to_delete.count_children < 2
      node_to_delete.delete_node_with_0_or_1_child
    else
      donor = node_to_delete.left.max_node
      node_to_delete.value = donor.value
      donor.delete_node_with_0_or_1_child
    end
  end


  private

  def in_order_traversal(node, result, i)
    i = in_order_traversal(node.left, result, i) if node.left.value

    result[i] = node.value
    i += 1

    i = in_order_traversal(node.right, result, i) if node.right.value

    i
  end


  def from_root_to_leaves(node, clone)
    clone.store_number(node.value)

    from_root_to_leaves(node.left, clone)  if node.left.value
    from_root_to_leaves(node.right, clone) if node.right.value
  end


  protected

  def removing_search(num)

    result = if @value == nil
               false
             else
               case num <=> @value
               when -1
                 @left.removing_search(num)
               when 0
                 self
               when 1
                 @right.removing_search(num)
               end
             end
    @tree_size -= 1 if result != false
    result
  end


  def count_children
    [@left, @right].count { |x| x.value != nil }
  end


  def delete_node_with_0_or_1_child
    if @left.value
      @value = @left.value
      @right = @left.right
      @left  = @left.left

    else
      @value = @right.value
      @left  = @right.left
      @right = @right.right
    end
  end


  def max_node
    @right.value ? @right.max_node : self
  end
end
