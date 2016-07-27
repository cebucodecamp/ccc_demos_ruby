require File.expand_path('../../../test_helper', __FILE__)
require 'minitest/autorun'
require 'refactorings'

class DecomposeConditionalTest < MiniTest::Test
  include Refactorings::DecomposeConditional

  def setup
    @original_calculator = Original::CalculateCharge.new
    @refactored_calculator = Refactored::CalculateCharge.new
  end

  def test_calculate_summer_charge
    summer_date = Time.parse('2016-04-15').to_date

    charge = @original_calculator.calculate(summer_date, 10)
    assert_equal(69.9, charge)

    charge = @refactored_calculator.calculate(summer_date, 10)
    assert_equal(69.9, charge)
  end

  def test_calculate_winter_charge
    winter_date = Time.parse('2016-12-10').to_date

    charge = @original_calculator.calculate(winter_date, 15)
    assert_equal(152.35, charge)

    charge = @refactored_calculator.calculate(winter_date, 15)
    assert_equal(152.35, charge)
  end
end
