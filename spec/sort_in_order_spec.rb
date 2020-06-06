require 'rspec'
require_relative '../binary_tree_unique.rb'

describe 'show_in_order' do
  before(:each) do
    @bst = BinaryTree.new
  end

  it 'should pass simple tests' do
    [23, -102, 89, 54, 234, -8].each { |num| @bst.store_number(num) }
    expect(@bst.show_in_order).to eq [-102, -8, 23, 54, 89, 234]
  end

  it 'should pass simple tests' do
    [11065, 882, -6619, -5554, 16, 0].each { |num| @bst.store_number(num) }
    expect(@bst.show_in_order).to eq [ -6619, -5554, 0, 16, 882, 11065 ]
  end

  it 'should pass random tests' do
    array = Array.new(10_000) { rand(-500_000..500_000) }
    array.each { |num| @bst.store_number(num) }
    array.sort!

    expect(@bst.show_in_order).to eq array
  end

  it 'should pass random tests' do
    array = Array.new(50_000) { rand(-50_000_000..50_000_000) }
    array.each { |num| @bst.store_number(num) }
    array.sort!

    expect(@bst.show_in_order).to eq array
  end

  it 'should pass random tests' do
    array = Array.new(50_000) { rand(-5_000_000_000..5_000_000_000) }
    array.each { |num| @bst.store_number(num) }
    array.sort!

    expect(@bst.show_in_order).to eq array
  end

  it 'should pass random tests' do
    array = Array.new(50_000) { rand(-1000..1000) }
    array.each { |num| @bst.store_number(num) }
    array.sort!

    expect(@bst.show_in_order).to eq array
  end

  it 'should pass random tests' do
    array = Array.new(10_000) { [9, 1].sample }
    array.each { |num| @bst.store_number(num) }
    array.sort!

    expect(@bst.show_in_order).to eq array
  end
end
