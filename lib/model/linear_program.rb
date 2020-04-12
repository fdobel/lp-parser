module MathOpt

  class LinearProgram

    def initialize(objective, constraints)
      @objective = objective
      @constraints = constraints
    end

    def to_s
      s = @objective.to_s
      s += "\n" + @constraints.join("\n")
      s
    end

    def vars
      s = Set[]
      s = s.union @objective.vars
      @constraints.each do |c|
        s = s.union c.vars
      end
      s
    end

  end
end
