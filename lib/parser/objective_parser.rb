module MathOpt

  class ObjectiveParser

    LINE_RECOGNITION = %w(max min)

    def initialize
      @expression_parser = ExpressionParser.new
      @opt_direction = nil
    end

    def parse line

      @opt_direction = "max" if line.include? "max"
      @opt_direction = "min" if line.include? "min"

      @expression_parser.parse(line.gsub("min", "").gsub("max", "").strip)

    end

    def finalize
      Objective.new(@expression_parser.finalize, @opt_direction)
    end
  end

end
