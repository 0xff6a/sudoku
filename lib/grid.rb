require_relative 'cell'

class Grid

  WIDTH = 9
  SIZE  = WIDTH**2

  attr_reader :cells

  def initialize
    @cells = cell_factory
    associate_all_neighbours
  end

  def try_solve_all_cells
    update_all_candidates
    cells.map(&:solve!)
  end

  def update_all_candidates
    cells.each{ |cell| cell.candidates -= neighbour_values(cell) }
  end

  def fill_with(puzzle_string)
    cells.each_with_index{ |cell, index| cell.value = puzzle_string[index].to_i }
  end

  def to_s
    cells.map(&:value).join('').to_s
  end

  private

  def cell_factory
    Array.new(SIZE) { Cell.new } 
  end

  def neighbour_values(cell)
    cell.neighbours.map{ |index| cells[index].value }
  end

  def neighbours(index)
    (row_neighbours(index) + col_neighbours(index) + box_neighbours(index)).uniq - [index]
  end

  def associate_all_neighbours
    cells.each_with_index { |cell, index| cell.neighbours += neighbours(index) }
  end

  def row_neighbours(index)
    (0...base).map{ |i| i + row(index) * base }
  end

  def col_neighbours(index)
    (0...base).map{ |i| col(index) + (i * base) }
  end

  def box_neighbours(index)
    first_box.map{ |i| i + nth_box_shift(index) }  
  end

  def nth_box_shift(index)
    (box_base * box_col(index)) + (box_base * box_row(index))
  end

  def row(index)
    (index / base)
  end

  def col(index)
    (index % base)
  end

  def box(index)
    (box_base * box_row(index)) + box_col(index)
  end

  def box_row(index)
    row(index) / box_base
  end

  def box_col(index)
    col(index) / box_base
  end

  def base
    WIDTH
  end

  def box_base
    Math.sqrt(WIDTH).to_i
  end

  def first_box
    (0...3).to_a + (9...12).to_a + (18...21).to_a
  end

end