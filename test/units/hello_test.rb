require File.expand_path('../../test_helper', __FILE__)
require 'minitest/autorun'

class HelloTest < MiniTest::Test
  def test_world
    assert_equal('world', 'world')
  end
end
