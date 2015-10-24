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

  def test_node_takes_in_data_integer
    a_node = Node.new(0)
    assert_equal 0, a_node.data
  end

  def test_node_takes_in_data_double_digit_integer
    a_node = Node.new(50)
    assert_equal 50, a_node.data
  end

  def test_rightlinks_larger_node_to_smaller_node
    node1 = Node.new(50)
    node2 = Node.new(56)
    node1.push(node2)
    assert_equal 50, node1.data
    assert_equal 56, node1.rightlink.data
  end

  def test_leftlinks_smaller_node_to_larger_node
    node1 = Node.new(44)
    node2 = Node.new(24)
    node1.push(node2)
    assert_equal 44, node1.data
    assert_equal 24, node1.leftlink.data
  end

  def test_links_two_nodes_to_parent_in_order
    parent_node = Node.new(43)
    child1 = Node.new(24)
    child2 = Node.new(57)
    parent_node.push(child1)
    parent_node.push(child2)
    assert_equal 43, parent_node.data
    assert_equal 24, parent_node.leftlink.data
    assert_equal 57, parent_node.rightlink.data
  end

  def test_links_two_nodes_to_parent_in_order_pushed_in_opposite_order
    parent_node = Node.new(42)
    child1 = Node.new(85)
    child2 = Node.new(16)
    parent_node.push(child1)
    parent_node.push(child2)
    assert_equal 42, parent_node.data
    assert_equal 16, parent_node.leftlink.data
    assert_equal 85, parent_node.rightlink.data
  end

  def test_links_three_nodes_rightlink_rightlink
    node1 = Node.new(12)
    node2 = Node.new(24)
    node3 = Node.new(36)
    node1.push(node2).push(node3)
    assert_equal 12, node1.data
    assert_equal 24, node1.rightlink.data
    assert_equal 36, node1.rightlink.rightlink.data
  end

  def test_links_three_nodes_leftlink_leftlink
    node1 = Node.new(48)
    node2 = Node.new(36)
    node3 = Node.new(24)
    node1.push(node2).push(node3)
    assert_equal 48, node1.data
    assert_equal 36, node1.leftlink.data
    assert_equal 24, node1.leftlink.leftlink.data
  end

  def test_links_three_nodes_leftlink_rightlink
    node1 = Node.new(12)
    node2 = Node.new(8)
    node3 = Node.new(10)
    node1.push(node2).push(node3)
    assert_equal 12, node1.data
    assert_equal 8, node1.leftlink.data
    assert_equal 10, node1.leftlink.rightlink.data
  end

  def test_links_three_nodes_rightlink_leftlink
    node1 = Node.new(12)
    node2 = Node.new(16)
    node3 = Node.new(14)
    node1.push(node2).push(node3)
    assert_equal 12, node1.data
    assert_equal 16, node1.rightlink.data
    assert_equal 14, node1.rightlink.leftlink.data
  end
end
