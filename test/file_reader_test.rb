# ruby ./test/file_reader_test.rb read_test_file.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/file_reader'

class FileReaderTest < Minitest::Test
  def test_file_reader_exists
    reader = FileReader.new
    assert reader.respond_to?(:read)
  end

  def test_file_reader_reads
    reader = FileReader.new
    assert_equal "Hello World!\n", reader.read
  end
end
