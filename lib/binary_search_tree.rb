require './lib/node'
require './lib/tree'
require './lib/file_reader'
require './lib/file_writer'
require 'pry'

# numbers = [87,99,54,43,66,77]
# # letters = ["c", "a", "f", "b", "g", "d"]
# list = List.new
# numbers.each do |num|
#   list.push(num)
# end
#
# puts numbers.to_s
# puts list.inspect
# puts list.head.rightlink.data
# puts list.head.leftlink.leftlink.data


class BinarySearchTree
  attr_reader :file_reader
  attr_writer :file_writer
  attr_accessor :tree

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def build_tree(data)
    @tree = Tree.new
    data.each do |element|
      @tree.push(element.to_i)
    end
    @tree
  end

  def include?(element)
    @tree.include?(element)
  end

  def sort_file_data_to_file
    file_data = @reader.read.split("\n")
    file_tree = tree(file_data)
    sorted_file_data = sort(file_tree)
    sorted_file_data.join("\n")
    @writer.write(sorted_file_data)
  end

  def sort
  end

  def insert
  end

  def depth_of
  end

  def maximum
    @tree.maximum
  end

  def minimum
    @tree.minimum
  end
end

bst = BinarySearchTree.new
# bst.sort_file_data_to_file
numbers = [87,99,54,43,66,77]
bst_numbers = bst.build_tree(numbers)
# binding.pry
