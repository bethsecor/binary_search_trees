class Node
  attr_accessor :data, :leftlink, :rightlink

  def initialize(data)
    @data = data
  end

  def push(node)
    if data > node.data
      if leftlink.nil?
        @leftlink = node
      else
        leftlink.push(node)
      end
    elsif data < node.data
      if rightlink.nil?
        @rightlink = node
      else
        rightlink.push(node)
      end
    end
  end

  def include?(element)
    if data == element
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
end
