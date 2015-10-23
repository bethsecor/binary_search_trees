class Node
  attr_accessor :data, :leftlink, :rightlink

  def initialize(data)
    @data = data
  end

  def push2(node)
    if data > node.data
      if leftlink.nil?
        @leftlink = node
      else
        leftlink.push2(node)
      end
    elsif data < node.data
      if rightlink.nil?
        @rightlink = node
      else
        rightlink.push2(node)
      end
    end
  end

end

class List
  attr_reader :head

  def push(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      head.push2(node)
    end
  end

end

node1 = Node.new(5)
puts node1.data


numbers = [87,99,54,43,66,77]
list = List.new
numbers.each do |num|
  list.push(num)
end

puts numbers.to_s
puts list.inspect
