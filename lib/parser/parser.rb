module MathOpt

  class Parser  # Builder

    def initialize
      @parsed = []
    end

    def parse(line)
      parser = LineParser.new
      if line.strip != ""
        parser.parse line.strip
        @parsed.push parser.finalize
      end
      # @lines.push line
    end

    def to_str
      p_ = @parsed.join "\n"

      "parsing... \n----\n#{p_}\n----"
    end

    def finalize
      LinearProgram.new(@parsed[0], @parsed[1..@parsed.length])
    end

  end

end
