require './lib/node'
require './lib/tree'
require './lib/file_reader'
require './lib/file_writer'

# Binary Search Tree can build a tree, insert an element, sort them,
# and has various descriptive methods for the tree. Can also output
# the sorted elements to a file from an input file.
class BinarySearchTree
  attr_reader :file_reader
  attr_writer :file_writer
  attr_accessor :tree

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def a_number?(char)
    char.to_i != 0 || char == '0'
  end

  def insert(element)
    if a_number?(element)
      @tree.insert(element.to_i)
    else
      @tree.insert(element)
    end
  end

  def build_tree(data)
    @tree = Tree.new
    data.each do |element|
      if a_number?(element)
        @tree.insert(element.to_i)
      else
        @tree.insert(element)
      end
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

  def number_of_leaves
    @tree.number_of_leaves
  end
end

bst = BinarySearchTree.new
bst.sort_file_data_to_file
