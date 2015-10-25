# Node can insert an element, and has various descriptive
# methods for the sub-tree.
class Node
  attr_accessor :data, :leftlink, :rightlink

  def initialize(data)
    @data = data
  end

  def insert(node)
    if data > node.data
      if leftlink.nil?
        @leftlink = node
      else
        leftlink.insert(node)
      end
    elsif data < node.data
      if rightlink.nil?
        @rightlink = node
      else
        rightlink.insert(node)
      end
    end
  end

  def include?(element)
    if element == data
      true
    elsif element < data
      return false if leftlink.nil?
      leftlink.include?(element)
    elsif element > data
      return false if rightlink.nil?
      rightlink.include?(element)
    else
      false
    end
  end

  def sort(sorted_array)
    return sorted_array if rightlink.nil? && leftlink.nil?
    if rightlink
      sorted_array.insert(sorted_array.index(data) + 1, rightlink.data)
      rightlink.sort(sorted_array)
    end
    if leftlink
      sorted_array.insert(sorted_array.index(data), leftlink.data)
      leftlink.sort(sorted_array)
    end
    sorted_array
  end

  def maximum
    if rightlink.nil?
      data
    else
      rightlink.maximum
    end
  end

  def minimum
    if leftlink.nil?
      data
    else
      leftlink.minimum
    end
  end

  def depth_of(element, counter = 0)
    return nil unless include?(element)

    counter += 1

    if element == data
      counter
    elsif element < data
      leftlink.depth_of(element, counter)
    else
      rightlink.depth_of(element, counter)
    end
  end
end
