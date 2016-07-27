require File.expand_path('../../../test_helper', __FILE__)
require 'minitest/autorun'
require 'refactorings'

class ReplaceDelegationWithInheritanceTest < MiniTest::Test
  include Refactorings::ReplaceDelegationWithInheritance

  def setup
    @original_employee = Original::Employee.new('Simon')
    @refactored_employee = Refactored::Employee.new('Simon')
  end
end
