require 'rspec'
require_relative '../bst_without_nil_nodes.rb'

describe 'copy' do
  it 'should return a precisely same array' do
    bst  = BinaryTree.new
    array = Array.new(10_000) { rand(-500_000..500_000) }

    array.each { |num| bst.store_number(num) }
    bst2 = bst.copy

    expect(bst.show_in_order).to eq bst2.show_in_order
  end
end
