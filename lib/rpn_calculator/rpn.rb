module RpnCalculator
  class RPN
    def initialize(numbers,operators)
      @numbers   = numbers
      @operators = operators
      raise ArgumentError, 'A minimum of two numbers is required' if numbers.count < 2
      raise ArgumentError, 'The number of operators must be exactly one less than number of numbers' unless (numbers.count - 1) == operators.count
      raise ArgumentError, 'Only valid numbers allowed' unless are_numbers?
      raise ArgumentError, 'Only valid numbers allowed' unless are_operators?
    end
    attr_accessor :numbers, :operators

    def self.evaluate(args) new(args[0],args[1]).evaluate end
    def self.calculate(str) RPNParser.parse(str) end
    def evaluate
      evaluated = numbers.shift
      while numbers.count > 0
        evaluated = Float(evaluated).send(operators.shift,Float(numbers.shift))
      end
      return evaluated
    end
  
    private
    def floats?(input)   !!Float(input) rescue(false) end
    def are_numbers?()   numbers.map{|n| floats?(n)}.inject(:&) end
    def are_operators?() operators.map{|op| operator?(op)}.inject(:&) end
    def operator?(input) ['+','-','/','*','**'].include?(input) end
  end
end