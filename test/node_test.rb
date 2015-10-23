gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < Minitest::Test

  def test_node_methods_exist
    reader = Node.new(9)
    assert reader.respond_to?(:push)
  end

  def test_node_takes_in_data_nil
    a_node = Node.new(nil)
    assert_equal nil, a_node.data
  end

  def test_node_takes_in_data_empty_string
    a_node = Node.new("")
    assert_equal "", a_node.data
  end

  def test_node_takes_in_data_string
    a_node = Node.new("a")
    assert_equal "a", a_node.data
  end

  def test_node_takes_in_data_0
    a_node = Node.new(0)
    assert_equal 0, a_node.data
  end

  def test_node_takes_in_data_5
    a_node = Node.new(5)
    assert_equal 5, a_node.data
  end

end
