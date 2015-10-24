gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tree'

class TreeTest < Minitest::Test

  def test_tree_methods_exist
    tree = Tree.new
    assert tree.respond_to?(:push)
  end

  def test_tree_push_one_number
    tree = Tree.new
    tree.push(5)
    assert_equal 5, tree.head.data
  end

  # add more tests here

end
