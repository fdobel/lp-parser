module MathOpt

  class LineParser
    def initialize
      @parser = nil
    end

    def parse line
      @parser = ConstraintParser.new if ConstraintParser::LINE_RECOGNITION.any? { |a| line.include? a }
      @parser = ObjectiveParser.new if ObjectiveParser::LINE_RECOGNITION.any? { |a| line.include? a }

      raise "Unrecognized line" if @parser.nil?

      @parser.parse line
    end

    def finalize
      @parser.finalize
    end
  end

end
