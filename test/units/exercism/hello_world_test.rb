require File.expand_path('../../../test_helper', __FILE__)
require 'minitest/autorun'
require 'exercism/hello_world'

class HelloWorldTest < MiniTest::Test
  def setup
    @sut = Exercism::HelloWorld.new
  end

  def test_no_name
    assert_equal 'Hello, World!', @sut.hello
  end

  def test_sample_name
    assert_equal 'Hello, Alice!', @sut.hello('Alice')
  end

  def test_other_sample_name
    assert_equal 'Hello, Bob!', @sut.hello('Bob')
  end
end
