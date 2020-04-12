module MathOpt

  class ConstraintParser

    LINE_RECOGNITION = %w(<= >= = ≥ ∈)

    def initialize
      @exp_parser = nil
      @right_side_parser = nil
      @type = nil
    end

    def parse line
      left_exp, right_exp = split_line(line)

      @exp_parser = ExpressionParser.new

      @right_side_parser = ExpressionParser.new
      if right_exp.include? "["
        @exp_parser = VariableExpressionParser.new
        @right_side_parser = SetExpressionParser.new
      end

      @exp_parser.parse left_exp
      @right_side_parser.parse right_exp


      @type = "=" if line.include? "="
      @type = "<=" if line.include? "<="
      @type = ">=" if line.include? ">=" or line.include? "≥"
      @type = "∈" if line.include? "∈"
    end

    def finalize
      klass = SmallerThan if @type == "<="
      klass = GreaterThan if @type == ">=" or @type == "≥"
      klass = Equals if @type == "="
      klass = ElementOf if @type == "∈"

      @constraint = klass.new(
          @exp_parser.finalize,
          @right_side_parser.finalize
      )
    end

    private

    def split_line line
      return line.split("<=") if line.include? "<="
      return line.split(">=") if line.include? ">="
      return line.split("≥") if line.include? "≥"
      return line.split("=") if line.include? "="
      return line.split("∈") if line.include? "∈"


      raise "Impossible line"
    end
  end

end
