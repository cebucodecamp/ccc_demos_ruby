require File.expand_path('../../../test_helper', __FILE__)
require 'minitest/autorun'
require 'refactorings'

class PullUpMethodTest < MiniTest::Test
  include Refactorings::PullUpMethod

  def setup
    @original_engineer = Original::Engineer.new
    @original_tester = Original::Tester.new

    @refactored_engineer = Refactored::Engineer.new
    @refactored_tester = Refactored::Tester.new
  end

  def test_original_respond_to_name
    assert_respond_to(@original_engineer, :name)
    assert_respond_to(@original_tester, :name)
  end

  def test_refactored_respond_to_name
    assert_respond_to(@refactored_engineer, :name)
    assert_respond_to(@refactored_tester, :name)
  end
end
