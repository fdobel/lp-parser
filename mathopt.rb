
require_relative 'lib/parser'



p = MathOpt::Parser.new

File.open( "program.lp" ).each do |line|
  p.parse line
end

puts p.to_str

prog = p.finalize
puts prog
pp prog.vars.map { |v| v.name }
