# frozen_string_literal: true

require 'rspec'
require_relative '../binary_tree_simple.rb'

describe 'Node' do
  before(:all) do
    @tree = Node.new
  end


  describe 'initialize' do
    it 'should return a Node object with all instance variables equal to nil ' \
       'except @tree_size shoud be 0' do

      expect(@tree).to be_a Node
      expect(@tree.send(:left)).to be_nil
      expect(@tree.send(:right)).to be_nil
      expect(@tree.value).to be_nil
      expect(@tree.tree_size).to be_zero
    end
  end


  describe 'store_number' do
    it 'should add a number to the root node correctly ' \
       'and should return tree size equal to 1' do

      1000.times do
        x = rand(-1000..1000)

        @tree.store_number(x)

        expect(@tree.value).to eq x
        expect(@tree.tree_size).to eq 1

        @tree = Node.new
      end
    end


    it 'should add a number to not-a-root node correctly ' \
       'and should return correct @tree_size for each node' do

      1000.times do
        @tree.store_number(0)

        x = rand(-1000..1000)

        @tree.store_number(x)

        if x <= @tree.value
          expect(@tree.send(:left).value).to eq x
          expect(@tree.send(:left).tree_size).to eq 1
          expect(@tree.send(:right).tree_size).to eq 0
        else
          expect(@tree.send(:right).value).to eq x
          expect(@tree.send(:right).tree_size).to eq 1
          expect(@tree.send(:left).tree_size).to eq 0
        end
        expect(@tree.tree_size).to eq 2

        @tree = Node.new
      end
    end
  end
end
