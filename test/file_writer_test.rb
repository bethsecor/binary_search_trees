# ruby ./test/file_writer_test.rb write_test_file.txt write_test_file.txt

gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/file_writer'
require_relative '../lib/file_reader'

class FileWriterTest < Minitest::Test
  def test_file_writer_exists
    writer = FileWriter.new
    assert writer.respond_to?(:write)
  end

  def test_file_writer_writes
    writer = FileWriter.new
    text = "Bonjour!"
    writer.write(text)
    reader = FileReader.new
    assert "Bonjour!\n", reader.read
  end
end
