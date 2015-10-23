require './lib/node'
require './lib/list'
require './lib/file_reader'
require './lib/file_writer'

numbers = [87,99,54,43,66,77]
# letters = ["c", "a", "f", "b", "g", "d"]
list = List.new
numbers.each do |num|
  list.push(num)
end

puts numbers.to_s
puts list.inspect


class BinarySearchTree
  attr_reader :file_reader
  attr_writer :file_writer

  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def sort_data_to_file
    data = @reader.read
    sorted_data = sorted_data_for_output(data)
    @writer.write(sorted_data)
  end

  def sorted_data_for_output
  end

  def sort
  end

  def insert
  end

  def include?
  end

  def depth_of
  end

  def maximum
  end

  def minimum
  end
end
