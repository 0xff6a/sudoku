class Puzzle

  attr_reader :grid, :puzzle_string

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    grid_factory
  end

  private

  def grid_factory
    @grid = Grid.new
    grid.fill_with(puzzle_string)
  end

end