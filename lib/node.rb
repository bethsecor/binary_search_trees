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

end
