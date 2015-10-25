# ruby ./test/binary_search_tree_test.rb numbers.txt sorted_numbers.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_binary_search_tree_methods_exist
    bst = BinarySearchTree.new
    assert bst.respond_to?(:build_tree)
    assert bst.respond_to?(:include?)
    assert bst.respond_to?(:sort)
    assert bst.respond_to?(:sort_file_data_to_file)
    assert bst.respond_to?(:insert)
    assert bst.respond_to?(:depth_of)
    assert bst.respond_to?(:maximum)
    assert bst.respond_to?(:minimum)
  end

  def test_a_number?
    bst = BinarySearchTree.new
    char1 = "0"
    char2 = "a"
    char3 = "7"
    assert bst.a_number?(char1)
    refute bst.a_number?(char2)
    assert bst.a_number?(char3)
  end

  def test_build_tree_empty
    bst = BinarySearchTree.new
    numbers = []
    tree = bst.build_tree(numbers)
    assert_equal nil, tree.head
  end

  def test_build_tree_one_number
    bst = BinarySearchTree.new
    numbers = [87]
    tree = bst.build_tree(numbers)
    assert_equal 87, tree.head.data
  end

  def test_build_tree_two_numbers_leftlink
    bst = BinarySearchTree.new
    numbers = [87, 54]
    tree = bst.build_tree(numbers)
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
  end

  def test_build_tree_two_numbers_rightlink
    bst = BinarySearchTree.new
    numbers = [32, 54]
    tree = bst.build_tree(numbers)
    assert_equal 32, tree.head.data
    assert_equal 54, tree.head.rightlink.data
  end

  def test_build_tree_three_numbers
    bst = BinarySearchTree.new
    numbers = [87, 54, 99]
    tree = bst.build_tree(numbers)
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
  end

  def test_build_tree_four_numbers_left
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 21]
    tree = bst.build_tree(numbers)
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 21, tree.head.leftlink.leftlink.data
  end

  def test_include_head?
    bst = BinarySearchTree.new
    numbers = [87]
    bst.build_tree(numbers)
    assert bst.include?(87)
  end

  def test_include_children?
    bst = BinarySearchTree.new
    numbers = [87, 54, 99]
    bst.build_tree(numbers)
    assert bst.include?(87)
    assert bst.include?(54)
    assert bst.include?(99)
  end

  def test_include_children_of_children?
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    bst.build_tree(numbers)
    assert bst.include?(87)
    assert bst.include?(54)
    assert bst.include?(99)
    assert bst.include?(43)
    assert bst.include?(66)
    assert bst.include?(101)
    assert bst.include?(120)
  end

  def test_maximum_tree_one_number
    bst = BinarySearchTree.new
    numbers = [3]
    bst.build_tree(numbers)
    assert_equal 3, bst.maximum
  end

  def test_maximum_tree_two_numbers
    bst = BinarySearchTree.new
    numbers = [3, 6]
    bst.build_tree(numbers)
    assert_equal 6, bst.maximum
  end

  def test_maximum_tree_two_numbers_max_head
    bst = BinarySearchTree.new
    numbers = [7, 4]
    bst.build_tree(numbers)
    assert_equal 7, bst.maximum
  end

  def test_maximum_tree_three_numbers
    bst = BinarySearchTree.new
    numbers = [7, 4, 10]
    bst.build_tree(numbers)
    assert_equal 10, bst.maximum
  end

  def test_maximum_tree_three_numbers_max_head
    bst = BinarySearchTree.new
    numbers = [7, 4, 2]
    bst.build_tree(numbers)
    assert_equal 7, bst.maximum
  end

  def test_maximum_single_digits
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9]
    bst.build_tree(numbers)
    assert_equal 9, bst.maximum
  end

  def test_maximum_bigger_numbers
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    bst.build_tree(numbers)
    assert_equal 120, bst.maximum
  end

  def test_minimum_tree_one_number
    bst = BinarySearchTree.new
    numbers = [3]
    bst.build_tree(numbers)
    assert_equal 3, bst.minimum
  end

  def test_minimum_tree_two_numbers
    bst = BinarySearchTree.new
    numbers = [6, 3]
    bst.build_tree(numbers)
    assert_equal 3, bst.minimum
  end

  def test_minimum_tree_two_numbers_max_head
    bst = BinarySearchTree.new
    numbers = [4, 7]
    bst.build_tree(numbers)
    assert_equal 4, bst.minimum
  end

  def test_minimum_tree_three_numbers
    bst = BinarySearchTree.new
    numbers = [7, 4, 10]
    bst.build_tree(numbers)
    assert_equal 4, bst.minimum
  end

  def test_minimum_single_digits
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9]
    bst.build_tree(numbers)
    assert_equal 3, bst.minimum
  end

  def test_minimum_big_numbers
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    bst.build_tree(numbers)
    assert_equal 43, bst.minimum
  end

  def test_refute_depth_of_non_element
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9]
    bst.build_tree(numbers)
    refute bst.depth_of(7)
    refute bst.depth_of(30)
    refute bst.depth_of(99)
  end

  def test_depth_of_head_one_number
    bst = BinarySearchTree.new
    numbers = [3]
    bst.build_tree(numbers)
    assert_equal 0, bst.depth_of(3)
  end

  def test_depth_of_head_two_numbers
    bst = BinarySearchTree.new
    numbers = [3, 6]
    bst.build_tree(numbers)
    assert_equal 0, bst.depth_of(3)
  end

  def test_depth_of_head_three_numbers
    bst = BinarySearchTree.new
    numbers = [3, 6, 8]
    bst.build_tree(numbers)
    assert_equal 0, bst.depth_of(3)
  end

  def test_depth_of_head_small_tree
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9]
    bst.build_tree(numbers)
    assert_equal 0, bst.depth_of(3)
  end

  def test_depth_of_level_one_two_numbers_rightlink
    bst = BinarySearchTree.new
    numbers = [3, 6]
    bst.build_tree(numbers)
    assert_equal 1, bst.depth_of(6)
  end

  def test_depth_of_level_one_two_numbers_leftlink
    bst = BinarySearchTree.new
    numbers = [3, 1]
    bst.build_tree(numbers)
    assert_equal 1, bst.depth_of(1)
  end

  def test_depth_of_level_one_small_tree
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 1]
    bst.build_tree(numbers)
    assert_equal 1, bst.depth_of(6)
    assert_equal 1, bst.depth_of(1)
  end

  def test_depth_of_level_two_small_tree
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 1]
    bst.build_tree(numbers)
    assert_equal 2, bst.depth_of(4)
    assert_equal 2, bst.depth_of(8)
  end

  def test_depth_of_level_three_small_tree
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 1]
    bst.build_tree(numbers)
    assert_equal 3, bst.depth_of(5)
    assert_equal 3, bst.depth_of(9)
  end

  def test_depth_of_level_four
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 10]
    bst.build_tree(numbers)
    assert_equal 4, bst.depth_of(10)
  end

  def test_depth_of_level_five
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 10, 20]
    bst.build_tree(numbers)
    assert_equal 5, bst.depth_of(20)
  end

  def test_depth_of_level_six
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 10, 20, 9900]
    bst.build_tree(numbers)
    assert_equal 6, bst.depth_of(9900)
  end

  def test_depth_of_level_non_element
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9, 10, 20, 9900]
    bst.build_tree(numbers)
    assert_equal nil, bst.depth_of(88)
  end

  def test_sort_empty_tree
    bst = BinarySearchTree.new
    numbers = []
    bst.build_tree(numbers)
    assert_equal [], bst.sort
  end

  def test_sort_one_number
    bst = BinarySearchTree.new
    numbers = [23]
    bst.build_tree(numbers)
    assert_equal [23], bst.sort
  end

  def test_sort_two_numbers
    bst = BinarySearchTree.new
    numbers = [87, 23]
    bst.build_tree(numbers)
    assert_equal [23, 87], bst.sort
  end

  def test_sort_two_numbers_sorted
    bst = BinarySearchTree.new
    numbers = [1, 5]
    bst.build_tree(numbers)
    assert_equal [1, 5], bst.sort
  end

  def test_sort_three_numbers
    bst = BinarySearchTree.new
    numbers = [5, 6, 2]
    bst.build_tree(numbers)
    assert_equal [2, 5, 6], bst.sort
  end

  def test_sort_three_numbers_sorted
    bst = BinarySearchTree.new
    numbers = [1, 3, 5]
    bst.build_tree(numbers)
    assert_equal [1, 3, 5], bst.sort
  end

  def test_sort_three_numbers_reversed
    bst = BinarySearchTree.new
    numbers = [5, 3, 1]
    bst.build_tree(numbers)
    assert_equal [1, 3, 5], bst.sort
  end

  def test_sort_four_numbers
    bst = BinarySearchTree.new
    numbers = [5, 3, 6, 2]
    bst.build_tree(numbers)
    assert_equal [2, 3, 5, 6], bst.sort
  end

  def test_sort_four_numbers_sorted
    bst = BinarySearchTree.new
    numbers = [2, 3, 5, 6]
    bst.build_tree(numbers)
    assert_equal [2, 3, 5, 6], bst.sort
  end

  def test_sort_four_numbers_reversed
    bst = BinarySearchTree.new
    numbers = [6, 5, 3, 2]
    bst.build_tree(numbers)
    assert_equal [2, 3, 5, 6], bst.sort
  end

  def test_sort_shuffled
    bst = BinarySearchTree.new
    numbers = [3, 6, 4, 5, 8, 9].shuffle
    bst.build_tree(numbers)
    assert_equal [3, 4, 5, 6, 8, 9], bst.sort
  end

  def test_sort_balanced_tree_shuffled
    bst = BinarySearchTree.new
    numbers = [87, 54, 99, 43, 120, 66, 101].shuffle
    bst.build_tree(numbers)
    assert_equal [43, 54, 66, 87, 99, 101, 120], bst.sort
  end


end
