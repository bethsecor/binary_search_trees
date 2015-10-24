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

end
