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

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def tree
    data = @reader.read.split("\n")
    tree = Tree.new
    data.each do |element|
      tree.push(element)
    end
    tree
  end

  def include?(element)

  end

  def sort_data_to_file
    sorted_data = sorted_data_for_output(tree)
    @writer.write(sorted_data)
  end

  def sorted_data_for_output(tree)
  end

  def sort
  end

  def insert
  end

  def depth_of
  end

  def maximum
  end

  def minimum
  end
end

bst = BinarySearchTree.new
# puts bst.tree.inspect
