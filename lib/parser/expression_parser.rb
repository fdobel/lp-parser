module MathOpt

  class VariableExpressionParser

    def parse variable_string
      res = /\A\w+/.match variable_string.strip
      @name = res.to_s
    end

    def finalize
      Variable.new @name
    end

  end

  class SetExpressionParser

    def parse set
      res = /\A\[(\d+),(\d+)\]/.match set.strip
      @start = res[1]
      @end = res[2]
      self
    end

    def finalize
      SetExpression.new(@start, @end)
    end
  end

  class MulExpressionParser

    def parse mult
      res = /\A(\d*)(\*?(\w(.*)))?/.match mult.strip
      @number_string = res[1]
      @variable = Variable.new(res[2])
      self
    end

    def finalize
      MulExpression.new(@number_string, @variable)
    end
  end

  class ExpressionParser

    LINE_RECOGNITION = %w(<= >= =)

    def initialize
      @expression = nil
    end

    def parse line
      @summed_expressions = line.strip.split("+").map(&:strip)
    end

    def finalize
      Expression.new(@summed_expressions.map { |m| MulExpressionParser.new.parse(m).finalize })
    end
  end

end
