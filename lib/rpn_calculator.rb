require "rpn_calculator/version"
require "rpn_calculator/rpn_parser"
require "rpn_calculator/rpn"
module RpnCalculator
  def self.calculate(args) RPN.calculate(args) end
  def self.evaluate(args)  RPN.evaluate(args)  end
end
