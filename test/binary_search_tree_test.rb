# ruby ./test/file_reader_test.rb message.txt braille.txt

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
    assert bst.respond_to?(:sorted_data_for_output)
    assert bst.respond_to?(:sort_data_to_file)
    assert bst.respond_to?(:insert)
    assert bst.respond_to?(:depth_of)
    assert bst.respond_to?(:maximum)
    assert bst.respond_to?(:minimum)
  end
end
