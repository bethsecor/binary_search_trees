# ruby ./test/binary_search_tree_test.rb numbers.txt sorted_numbers.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_binary_search_tree_methods_exist
    bst = BinarySearchTree.new
    assert bst.respond_to?(:tree)
    assert bst.respond_to?(:include?)
    assert bst.respond_to?(:sort)
    assert bst.respond_to?(:sort_file_data_to_file)
    assert bst.respond_to?(:insert)
    assert bst.respond_to?(:depth_of)
    assert bst.respond_to?(:maximum)
    assert bst.respond_to?(:minimum)
  end

  def test_tree_structure_correct
    skip
    bst = BinarySearchTree.new
  end

  def test_include_head?
    bst = BinarySearchTree.new
    numbers = [87]
    bst_numbers = bst.tree(numbers)
    assert bst_numbers.include?(87)
  end

  def test_include_children?
    bst = BinarySearchTree.new
    numbers = [87, 54, 99]
    bst_numbers = bst.tree(numbers)
    assert bst_numbers.include?(87)
    assert bst_numbers.include?(54)
    assert bst_numbers.include?(99)
  end

  def test_include_children_of_children?
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    bst_numbers = bst.tree(numbers)
    assert bst_numbers.include?(87)
    assert bst_numbers.include?(54)
    assert bst_numbers.include?(99)
    assert bst_numbers.include?(43)
    assert bst_numbers.include?(66)
    assert bst_numbers.include?(101)
    assert bst_numbers.include?(120)
  end

  def test_maximum_single_digits
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9]
    bst_numbers = bst.tree(numbers)
    assert_equal 9, bst_numbers.maximum
  end

  def test_maximum_big_numbers
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    bst_numbers = bst.tree(numbers)
    assert_equal 120, bst_numbers.maximum
  end

  def test_minimum_single_digits
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9]
    bst_numbers = bst.tree(numbers)
    assert_equal 3, bst_numbers.minimum
  end

  def test_minimum_big_numbers
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    bst_numbers = bst.tree(numbers)
    assert_equal 43, bst_numbers.minimum
  end

end
