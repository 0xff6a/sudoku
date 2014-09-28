require_relative 'lib/puzzle'

def print_usage_msg
  puts '[usage] ruby run.rb puzzle_string'
end

def puzzle_string
  ARGV.first
end

def valid?(puzzle_string)
  puzzle_string.length == 81
end

def puzzle_factory
  Puzzle.new(puzzle_string)
end

def print_solution
  puzzle = puzzle_factory
  puts "Processing.....\n\n"
  puzzle.solve!
  puzzle.display
end

def run
  raise 'Invalid puzzle string' unless valid?(puzzle_string)
  puzzle_string ? print_solution : print_usage_msg
end 

#----Run Method Call-----
run