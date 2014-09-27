class Puzzle

  attr_reader :grid, :puzzle_string

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    grid_factory
  end

  def solved?
    grid.cells.all?(&:solved?)
  end

  def solve!
    previously_unsolved, looping = Grid::SIZE, false
    until solved? || looping
      grid.try_solve_all_cells
      unsolved = grid.unsolved_count
      looping = (previously_unsolved == unsolved)
      previously_unsolved = unsolved
    end
  end

  def solution
    grid.to_s if solved?
  end

  def display
    rows = grid.cells.map(&:value).each_slice(9) {|row| puts row.inspect + "\n" }
  end

  private

  def grid_factory
    @grid = Grid.new
    grid.fill_with(puzzle_string)
  end

end