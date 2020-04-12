require 'set'

module MathOpt

  class SetExpression
    def initialize(int_start, int_end)
      @int_start = int_start
      @int_end = int_end
    end
    def to_s
      "[#{@int_start}, #{@int_end}]"
    end
  end

  class MulExpression

    attr_reader :variable

    def initialize number, variable
      @number = number
      @variable = variable
    end

    def number?
      @variable.nil?
    end

    def var?
      !@variable.nil?
    end

    def to_s
      return "#{@number}" if number?
      return "#{@variable}" if @number == "" or @number == 1 or @number.nil?
      "#{@number} * #{@variable.to_s}"
    end

  end

  class SumExpression

    def initialize summands
      @summands = summands
    end

  end

  class Expression < SumExpression
    def to_s
      @summands.map { |s| "<#{s}>" }.join " _+_ "
    end

    def vars
      st = []
      @summands.each do |s|
        st.push s.variable
      end
      st.to_set
    end

  end

end
