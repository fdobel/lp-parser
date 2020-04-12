module MathOpt

  class Objective

    def initialize(expression, optimization_direction='max')
      @expression = expression
      @optimization_direction = optimization_direction
    end

    def to_s
      "Obj: #{@optimization_direction.to_s} #{@expression.to_s}"
    end

    def vars; @expression.vars; end

  end

end
