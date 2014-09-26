require_relative 'cell'

class Grid

  SIZE = 81

  attr_reader :cells

  def initialize
    @cells = cell_factory
    associate_all_neighbours
  end

  def update_cells

  end

  private

  def associate_all_neighbours
    cells.each_with_index { |cell, index| cell.neighbours += neighbours(index) }
  end

  def cell_factory
    Array.new(SIZE) { Cell.new } 
  end

  def neighbours(index)
    (row_neighbours(index) + col_neighbours(index) + box_neighbours(index)).uniq - [index]
  end

  def row_neighbours(index)
    (0...9).map{ |i| i + row(index) * 9 }
  end

  def col_neighbours(index)
    (0...9).map{ |i| col(index) + (i * 9) }
  end

  def box_neighbours(index)
   []
  end

  def row(index)
    (index / 9)
  end

  def col(index)
    (index % 9)
  end

  def box(index)
    1
  end

  def cell_values
    cells.map(&:value)
  end

end