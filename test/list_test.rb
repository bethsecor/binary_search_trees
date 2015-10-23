gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/list'

class ListTest < Minitest::Test

  def test_list_methods_exist
    reader = List.new
    assert reader.respond_to?(:push)
  end

end
