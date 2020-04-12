module MathOpt


  class Constraint
    def to_s
      "#{@sum} #{self.class::SYMBOL} #{@b}"
    end

    def vars
      @sum.vars
    end
  end

  class SmallerThan < Constraint

    SYMBOL = "<="

    def initialize(sum_expression, b)
      @sum = sum_expression
      @b = b
    end
  end

  class GreaterThan < Constraint

    SYMBOL = ">="

    def initialize(sum_expression, b)
      @sum = sum_expression
      @b = b
    end
  end

  class Equals < Constraint

    SYMBOL = "=="

    def initialize(sum_expression, b)
      @sum = sum_expression
      @b = b
    end
  end

  class ElementOf < Constraint

    SYMBOL = "∈"

    attr_reader :variable

    def initialize(variable, set)
      @variable = variable
      @set = set
    end

    def vars
      [@variable].to_set
    end

    def to_s
      "#{@variable.to_s} ∈ #{@set.to_s}"
    end
  end

end
