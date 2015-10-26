require './lib/node'
require 'pry'

# Tree can insert an element, sort them, and has
# various descriptive methods for the tree. It
# depends on the Node class.
class Tree
  attr_reader :head

  def insert(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      head.insert(node)
    end
  end

  def include?(element)
    if element == head.data
      true
    elsif element < head.data
      head.leftlink.include?(element)
    else
      head.rightlink.include?(element)
    end
  end

  def sort(sorted_array = [])
    return sorted_array if head.nil?
    sorted_array << head.data
    return sorted_array if head.rightlink.nil? && head.leftlink.nil?
    if head.rightlink
      sorted_array.push(head.rightlink.data)
      head.rightlink.sort(sorted_array)
    end
    if head.leftlink
      sorted_array.unshift(head.leftlink.data)
      head.leftlink.sort(sorted_array)
    end
    sorted_array
  end

  def maximum
    if head.rightlink.nil?
      head.data
    else
      head.rightlink.maximum
    end
  end

  def minimum
    if head.leftlink.nil?
      head.data
    else
      head.leftlink.minimum
    end
  end

  def depth_of(element)
    if element == head.data
      0
    elsif element < head.data
      head.leftlink.depth_of(element)
    else
      head.rightlink.depth_of(element)
    end
  end

  def number_of_leaves
    if head.rightlink.nil? && head.leftlink.nil?
      1
    else
      head.rightlink.number_of_leaves if head.rightlink
      head.leftlink.number_of_leaves if head.leftlink
    end
  end
end
