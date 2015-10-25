require './lib/node'
require './lib/tree'
require './lib/file_reader'
require './lib/file_writer'
require 'pry'

class BinarySearchTree
  attr_reader :file_reader
  attr_writer :file_writer
  attr_accessor :tree

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def is_a_number?(char)
    char.to_i != 0 || char == "0"
  end

  def insert(element)
    if is_a_number?(element)
      @tree.insert(element.to_i)
    else
      @tree.insert(element)
    end
  end

  def build_tree(data)
    @tree = Tree.new
    data.each do |element|
      @tree.insert(element.to_i)
    end
    @tree
  end

  def include?(element)
    @tree.include?(element)
  end

  def sort
    @tree.sort
  end

  def sort_file_data_to_file
    file_data = @reader.read.split("\n")
    file_tree = build_tree(file_data)
    sorted_file_data = file_tree.sort
    sorted_file_data.join("\n")
    @writer.write(sorted_file_data)
  end

  def depth_of(element)
    @tree.depth_of(element)
  end

  def maximum
    @tree.maximum
  end

  def minimum
    @tree.minimum
  end
end

bst = BinarySearchTree.new
bst.sort_file_data_to_file
# numbers = [87,99,54,43,66,77]
# bst_numbers = bst.build_tree(numbers)
# binding.pry
