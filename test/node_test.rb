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

  def test_node_takes_in_data_numeric_string
    a_node = Node.new("0")
    assert_equal "0", a_node.data
  end

  def test_node_takes_in_data_double_digit_string
    a_node = Node.new("50")
    assert_equal "50", a_node.data
  end

  def test_rightlinks_larger_node_to_smaller_node
    node1 = Node.new("50")
    node2 = Node.new("56")
    node1.push(node2)
    assert_equal "56", node1.rightlink.data
  end

  def test_leftlinks_smaller_node_to_larger_node
    node1 = Node.new("43")
    node2 = Node.new("24")
    node1.push(node2)
    assert_equal "24", node1.leftlink.data
  end

end
