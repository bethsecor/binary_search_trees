# ruby ./test/tree_test.rb

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tree'

class TreeTest < Minitest::Test

  def test_tree_methods_exist
    tree = Tree.new
    assert tree.respond_to?(:insert)
  end

  def test_tree_push_one_number
    tree = Tree.new
    tree.insert(5)
    assert_equal 5, tree.head.data
  end

  #####

  def test_build_tree_empty
    tree = Tree.new
    numbers = []
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal nil, tree.head
  end

  def test_build_tree_one_number
    tree = Tree.new
    numbers = [87]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
  end

  def test_build_tree_two_numbers_leftlink
    tree = Tree.new
    numbers = [87, 54]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
  end

  def test_build_tree_two_numbers_rightlink
    tree = Tree.new
    numbers = [32, 54]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 32, tree.head.data
    assert_equal 54, tree.head.rightlink.data
  end

  def test_build_tree_three_numbers
    tree = Tree.new
    numbers = [87, 54, 99]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
  end

  def test_build_tree_four_numbers_left
    tree = Tree.new
    numbers = [87, 54, 99, 21]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 21, tree.head.leftlink.leftlink.data
  end

  def test_build_tree_four_numbers_right
    tree = Tree.new
    numbers = [87, 54, 99, 120]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 120, tree.head.rightlink.rightlink.data
  end

  def test_build_tree_five_numbers_right
    tree = Tree.new
    numbers = [87, 54, 99, 120, 96]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 120, tree.head.rightlink.rightlink.data
    assert_equal 96, tree.head.rightlink.leftlink.data
  end

  def test_build_tree_five_numbers_left
    tree = Tree.new
    numbers = [87, 54, 99, 66, 44]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 66, tree.head.leftlink.rightlink.data
    assert_equal 44, tree.head.leftlink.leftlink.data
  end

  def test_build_tree_seven_numbers_balanced
    tree = Tree.new
    numbers = [87, 54, 99, 66, 44, 120, 96]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 66, tree.head.leftlink.rightlink.data
    assert_equal 44, tree.head.leftlink.leftlink.data
    assert_equal 120, tree.head.rightlink.rightlink.data
    assert_equal 96, tree.head.rightlink.leftlink.data
  end

  def test_build_tree_seven_numbers_chain_right
    tree = Tree.new
    numbers = [1, 2, 3, 4, 5, 6, 7]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 1, tree.head.data
    assert_equal 2, tree.head.rightlink.data
    assert_equal 3, tree.head.rightlink.rightlink.data
    assert_equal 4, tree.head.rightlink.rightlink.rightlink.data
    assert_equal 5, tree.head.rightlink.rightlink.rightlink.rightlink.data
    assert_equal 6, tree.head.rightlink.rightlink.rightlink.rightlink.rightlink.data
    assert_equal 7, tree.head.rightlink.rightlink.rightlink.rightlink.rightlink.rightlink.data
  end

  def test_build_tree_seven_numbers_chain_left
    tree = Tree.new
    numbers = [7, 6, 5, 4, 3, 2, 1]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 7, tree.head.data
    assert_equal 6, tree.head.leftlink.data
    assert_equal 5, tree.head.leftlink.leftlink.data
    assert_equal 4, tree.head.leftlink.leftlink.leftlink.data
    assert_equal 3, tree.head.leftlink.leftlink.leftlink.leftlink.data
    assert_equal 2, tree.head.leftlink.leftlink.leftlink.leftlink.leftlink.data
    assert_equal 1, tree.head.leftlink.leftlink.leftlink.leftlink.leftlink.leftlink.data
  end

  def test_build_tree_thirteen_numbers_balanced
    tree = Tree.new
    numbers = [87, 54, 99, 66, 44, 120, 96, 16, 48, 60, 70, 90, 98, 100, 130]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 87, tree.head.data
    assert_equal 54, tree.head.leftlink.data
    assert_equal 99, tree.head.rightlink.data
    assert_equal 66, tree.head.leftlink.rightlink.data
    assert_equal 44, tree.head.leftlink.leftlink.data
    assert_equal 120, tree.head.rightlink.rightlink.data
    assert_equal 96, tree.head.rightlink.leftlink.data
    assert_equal 16, tree.head.leftlink.leftlink.leftlink.data
    assert_equal 48, tree.head.leftlink.leftlink.rightlink.data
    assert_equal 60, tree.head.leftlink.rightlink.leftlink.data
    assert_equal 70, tree.head.leftlink.rightlink.rightlink.data
    assert_equal 90, tree.head.rightlink.leftlink.leftlink.data
    assert_equal 98, tree.head.rightlink.leftlink.rightlink.data
    assert_equal 100, tree.head.rightlink.rightlink.leftlink.data
    assert_equal 130, tree.head.rightlink.rightlink.rightlink.data
  end

  def test_include_head?
    tree = Tree.new
    numbers = [87]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert tree.include?(87)
  end

  def test_include_children?
    tree = Tree.new
    numbers = [87, 54, 99]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert tree.include?(87)
    assert tree.include?(54)
    assert tree.include?(99)
  end

  def test_include_children_of_children?
    tree = Tree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert tree.include?(87)
    assert tree.include?(54)
    assert tree.include?(99)
    assert tree.include?(43)
    assert tree.include?(66)
    assert tree.include?(101)
    assert tree.include?(120)
  end

  def test_maximum_tree_one_number
    tree = Tree.new
    numbers = [3]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 3, tree.maximum
  end

  def test_maximum_tree_two_numbers
    tree = Tree.new
    numbers = [3, 6]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 6, tree.maximum
  end

  def test_maximum_tree_two_numbers_max_head
    tree = Tree.new
    numbers = [7, 4]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 7, tree.maximum
  end

  def test_maximum_tree_three_numbers
    tree = Tree.new
    numbers = [7, 4, 10]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 10, tree.maximum
  end

  def test_maximum_tree_three_numbers_max_head
    tree = Tree.new
    numbers = [7, 4, 2]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 7, tree.maximum
  end

  def test_maximum_single_digits
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 9, tree.maximum
  end

  def test_maximum_bigger_numbers
    tree = Tree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 120, tree.maximum
  end

  def test_minimum_tree_one_number
    tree = Tree.new
    numbers = [3]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 3, tree.minimum
  end

  def test_minimum_tree_two_numbers
    tree = Tree.new
    numbers = [6, 3]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 3, tree.minimum
  end

  def test_minimum_tree_two_numbers_max_head
    tree = Tree.new
    numbers = [4, 7]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 4, tree.minimum
  end

  def test_minimum_tree_three_numbers
    tree = Tree.new
    numbers = [7, 4, 10]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 4, tree.minimum
  end

  def test_minimum_single_digits
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 3, tree.minimum
  end

  def test_minimum_big_numbers
    tree = Tree.new
    numbers = [87, 54, 99, 43, 120, 66, 101]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 43, tree.minimum
  end

  def test_refute_depth_of_non_element
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    refute tree.depth_of(7)
    refute tree.depth_of(30)
    refute tree.depth_of(99)
  end

  def test_depth_of_head_one_number
    tree = Tree.new
    numbers = [3]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 0, tree.depth_of(3)
  end

  def test_depth_of_head_two_numbers
    tree = Tree.new
    numbers = [3, 6]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 0, tree.depth_of(3)
  end

  def test_depth_of_head_three_numbers
    tree = Tree.new
    numbers = [3, 6, 8]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 0, tree.depth_of(3)
  end

  def test_depth_of_head_small_tree
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 0, tree.depth_of(3)
  end

  def test_depth_of_level_one_two_numbers_rightlink
    tree = Tree.new
    numbers = [3, 6]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 1, tree.depth_of(6)
  end

  def test_depth_of_level_one_two_numbers_leftlink
    tree = Tree.new
    numbers = [3, 1]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 1, tree.depth_of(1)
  end

  def test_depth_of_level_one_small_tree
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 1]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 1, tree.depth_of(6)
    assert_equal 1, tree.depth_of(1)
  end

  def test_depth_of_level_two_small_tree
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 1]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 2, tree.depth_of(4)
    assert_equal 2, tree.depth_of(8)
  end

  def test_depth_of_level_three_small_tree
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 1]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 3, tree.depth_of(5)
    assert_equal 3, tree.depth_of(9)
  end

  def test_depth_of_level_four
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 10]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 4, tree.depth_of(10)
  end

  def test_depth_of_level_five
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 10, 20]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 5, tree.depth_of(20)
  end

  def test_depth_of_level_six
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 10, 20, 9900]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal 6, tree.depth_of(9900)
  end

  def test_depth_of_level_non_element
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9, 10, 20, 9900]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal nil, tree.depth_of(88)
  end

  def test_sort_empty_tree
    tree = Tree.new
    numbers = []
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [], tree.sort
  end

  def test_sort_one_number
    tree = Tree.new
    numbers = [23]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [23], tree.sort
  end

  def test_sort_two_numbers
    tree = Tree.new
    numbers = [87, 23]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [23, 87], tree.sort
  end

  def test_sort_two_numbers_sorted
    tree = Tree.new
    numbers = [1, 5]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [1, 5], tree.sort
  end

  def test_sort_three_numbers
    tree = Tree.new
    numbers = [5, 6, 2]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [2, 5, 6], tree.sort
  end

  def test_sort_three_numbers_sorted
    tree = Tree.new
    numbers = [1, 3, 5]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [1, 3, 5], tree.sort
  end

  def test_sort_three_numbers_reversed
    tree = Tree.new
    numbers = [5, 3, 1]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [1, 3, 5], tree.sort
  end

  def test_sort_four_numbers
    tree = Tree.new
    numbers = [5, 3, 6, 2]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [2, 3, 5, 6], tree.sort
  end

  def test_sort_four_numbers_sorted
    tree = Tree.new
    numbers = [2, 3, 5, 6]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [2, 3, 5, 6], tree.sort
  end

  def test_sort_four_numbers_reversed
    tree = Tree.new
    numbers = [6, 5, 3, 2]
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [2, 3, 5, 6], tree.sort
  end

  def test_sort_shuffled
    tree = Tree.new
    numbers = [3, 6, 4, 5, 8, 9].shuffle
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [3, 4, 5, 6, 8, 9], tree.sort
  end

  def test_sort_balanced_tree_shuffled
    tree = Tree.new
    numbers = [87, 54, 99, 43, 120, 66, 101].shuffle
    numbers.each do |element|
      tree.insert(element.to_i)
    end
    assert_equal [43, 54, 66, 87, 99, 101, 120], tree.sort
  end
end
