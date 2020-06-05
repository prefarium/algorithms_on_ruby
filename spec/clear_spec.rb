require 'rspec'
require_relative '../bst_without_nil_nodes.rb'

describe 'clear' do
  it 'should return an empty array' do
    bst   = BinaryTree.new
    array = Array.new(10_000) { rand(-500_000..500_000) }

    array.each { |num| bst.store_number(num) }
    bst.clear

    expect(bst.show_in_order).to eq []
  end
end
