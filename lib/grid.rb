require_relative 'cell'

class Grid

  SIZE = 81

  attr_reader :cells

  def initialize
    cell_factory
    associate_all_neighbours
  end

  def update_cells

  end

  private

  def associate_all_neighbours
    cells.each_with_index { |cell, index| cell.neighbours += neighbours(index) }
  end

  def cell_factory
    @cells = Array.new(SIZE) { Cell.new } 
  end

  def neighbours(index)
    (row_neighbours(index) + col_neighbours(index) + box_neighbours(index)).uniq - [index]
  end

  def row_neighbours(index)
    ((index - index % 9)...9).to_a
  end

  def col_neighbours(index)
    []
  end

  def box_neighbours(index)
   []
  end

  def cell_values
    cells.map(&:value)
  end

end