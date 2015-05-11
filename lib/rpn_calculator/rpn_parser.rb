module RpnCalculator
  class RPNParser
    def initialize(string)
      raise ArgumentError, 'only numbers and operators allowed as arguments' unless /^[0-9\+\-\*\/\s\.\(\)]+$/ === string
      @string = adjust_string(string)
    end
    def adjust_string(str)
      str.gsub!(/(?<=[0-9])(?=[\+\-\*\/])/,' ')
      str.gsub!(/(?<=[\+\-\*\/])(?=[0-9])/,' ')
      str.gsub(/\s+/,' ')
    end
      
    def self.parse(str) self.new(str).parse end
    def return_check()  @current == Float(@current) rescue(false) end
    def parse
      @current = mult_div
      return @current if self.return_check
      evaluated = @current.split(' ')
      numbers   = [evaluated.shift]
      operators = []
      while evaluated.count > 0
        operators << evaluated.shift
        numbers   << evaluated.shift
      end
      RPN.evaluate([numbers,operators])
    end
    def mult_div
      @current = exponent
      return @current if self.return_check
      left = @current.split(/(?<=[0-9\s])(?=[\*\/])/)
      return left.pop if left.count == 1
      right = left.pop.split(' ')
      left = left.join.split(' ')
      evaluated = "#{left.pop} #{right.shift} #{right.shift}"
      return evaluated if left.count + right.count == 0
      RPNParser.parse("#{left.join(' ')}#{RPNParser.parse(evaluated)}#{right.join(' ')}")
    end
    def exponent
      @current = parenthesis
      return @current if self.return_check
      left  = @current.split('**')
      return left.pop if left.count == 1
      right = left.pop
      left  = left.join('**').split(' ')
      exp   = "#{left.pop} ** #{right}"
      return exp if left.count == 0
      RPNParser.parse("#{left.join(' ')} #{RPNParser.parse(exp)}")
    end
    def parenthesis
      left   = @string.split('(')
      return left.pop if left.count == 1
      right  = left.pop.split(')')
      middle = right.shift
      parens = [left.join('('),middle,right.join(')')]
      RPNParser.parse("#{parens[0]} #{RPNParser.parse(parens[1])} #{parens[2]}")
    end
  end
end