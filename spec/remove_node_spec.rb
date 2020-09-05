# frozen_string_literal: true

require 'rspec'
require_relative '../binary_tree_simple'

describe 'remove_node' do
  before(:each) do
    @bst = Node.new
  end

  it 'shoud pass simple tests' do
    expect(@bst.remove_node(32)).to be false
  end

  it 'shoud pass simple tests' do
    @bst.store_number(32)
    expect(@bst.remove_node(32)).to be true
    expect(@bst.show_in_order).to eq []
  end

  it 'shoud pass simple tests' do
    arr = [28, 3, 5, 7, 10, 97]
    @bst.store_array(arr)
    @bst.remove_node(7)
    expect(@bst.show_in_order).to eq [3, 5, 10, 28, 97]
  end

  it 'shoud pass simple tests' do
    arr = [28, 3, 5, 7, 10, 97]
    @bst.store_array(arr)
    @bst.remove_node(5)
    expect(@bst.show_in_order).to eq [3, 7, 10, 28, 97]
  end

  it 'shoud pass random test' do
    arr = Array.new(10_000) { rand(-1_000_000..1_000_000) }
    @bst.store_array(arr)

    1000.times do
      removed_item = arr.delete_at(arr.index(arr.sample))
      @bst.remove_node(removed_item)
    end

    expect(@bst.show_in_order).to eq arr.sort
    expect(@bst.tree_size).to eq arr.size
  end

  it 'shoud pass random test' do
    arr = Array.new(10_000) { rand(-1000..1000) }
    @bst.store_array(arr)

    1000.times do
      removed_item = arr.delete_at(arr.index(arr.sample))
      @bst.remove_node(removed_item)
    end

    expect(@bst.show_in_order).to eq arr.sort
    expect(@bst.tree_size).to eq arr.size
  end
end
