class Puzzle

  attr_reader   :puzzle_string, :grid

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    grid_factory
  end

  def solve!
    previously_unsolved, looping = Grid::SIZE, false
    
    until solved? || looping
      grid.try_solve_all_cells
      unsolved = grid.unsolved_count
      looping = (previously_unsolved == unsolved)
      previously_unsolved = unsolved
    end

    try_harder unless solved?
  end

  def try_harder
    cell = first_unsolved_cell
    cell.candidates.each do |candidate|
      
      simulation = simulate_puzzle_with(candidate, index(cell))
      simulation.solve!

      steal_solution_from(simulation) and return if simulation.solved?
    end
  end

  def solved?
    grid.cells.all?(&:solved?)
  end

  def solution
    grid.to_s if solved?
  end

  def display
    rows = grid.cells.map(&:value).each_slice(9) {|row| puts row.inspect + "\n" }
  end

  private

  def index(cell)
    grid.index(cell)
  end

  def grid_factory
    @grid = Grid.new
    grid.fill_with(puzzle_string)
  end

  def first_unsolved_cell
    grid.cells.find(&:unsolved?)
  end

  def simulate_puzzle_with(candidate, index)
    input_string = grid.to_s
    input_string[index] = candidate.to_s
    Puzzle.new(input_string)
  end

  def steal_solution_from(simulation)
    @grid = simulation.grid
  end

end