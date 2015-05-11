require 'minitest/autorun'
require 'rpn_calculator'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RpnCalculator::RPNTest < MiniTest::Unit::TestCase

  def test_should_correctly_evaluate_two_arrays
    numbers   = [1,2,5,7,4,3]
    operators = ['+','*','-','/','**']
    assert_equal 8, RpnCalculator::RPN.evaluate([numbers,operators])
  end
  
  def test_should_raise_error_if_array_sizes_dont_match
    numbers   = [1,2,3]
    operators = ['-']
    assert_raises(ArgumentError) {RpnCalculator::RPN.evaluate([numbers,operators])}
    operators = ['-','+','+']
    assert_raises(ArgumentError) {RpnCalculator::RPN.evaluate([numbers,operators])}
  end
  
  def test_should_raise_argument_error_if_not_enough_numbers
    numbers   = [1]
    operators = []
    assert_raises(ArgumentError) {RpnCalculator::RPN.evaluate([numbers,operators])}
  end
  
  def test_should_raise_error_if_numbers_arent_numbers
    numbers   = [1,2,5,7,'a']
    operators = ['+','*','-','/']
    assert_raises(ArgumentError) {RpnCalculator::RPN.evaluate([numbers,operators])}
  end
  def test_should_raise_error_if_operators_arent_operators
    numbers   = [1,2,5,7,'8']
    operators = ['+','*','-','g']
    assert_raises(ArgumentError) {RpnCalculator::RPN.evaluate([numbers,operators])}
  end
  
  def test_should_calculate_string
    assert_equal 3.0, RpnCalculator::RPN.calculate('1+2')
  end

  def test_should_observe_order_of_operartions
    assert_equal 9.0,  RpnCalculator::RPN.calculate('1+2**3')
    assert_equal 7.0,  RpnCalculator::RPN.calculate('1+2*3')
    assert_equal 18.0, RpnCalculator::RPN.calculate('1+2*3+4/2+3**(1+1)')
  end
  def test_should_raise_argument_error
    assert_raises(ArgumentError) {RpnCalculator::RPN.calculate('1+one')}
  end
  
  def test_rpn_calculator_calculate_wrapper
    assert_equal 9.0,  RpnCalculator.calculate('1+2**3')
    assert_equal 7.0,  RpnCalculator.calculate('1+2*3')
    assert_equal 18.0, RpnCalculator.calculate('1+2*3+4/2+3**(1+1)')
  end
  def test_rpn_calculator_evaluate_wrapper
    numbers   = [1,2,5,7,4,3]
    operators = ['+','*','-','/','**']
    assert_equal 8, RpnCalculator.evaluate([numbers,operators])
  end
end