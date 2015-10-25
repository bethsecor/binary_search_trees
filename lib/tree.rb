require './lib/node'

class Tree
  attr_reader :head

  def push(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      head.push(node)
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

end
