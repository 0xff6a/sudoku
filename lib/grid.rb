require_relative 'cell'

class Grid

  WIDTH = 9
  SIZE  = WIDTH**2

  attr_reader :cells

  def initialize
    @cells = cell_factory
    associate_all_neighbours
  end

  def update_cells
    cells.each{ |cell| cell.candidates -= neighbour_values(cell) }
  end

  private

  def neighbour_values(cell)
    cell.neighbours.map{ |index| cells[index].value }
  end

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
    (0...base).map{ |i| i + row(index) * base }
  end

  def col_neighbours(index)
    (0...base).map{ |i| col(index) + (i * base) }
  end

  def box_neighbours(index)
    []
  end

  def row(index)
    (index / base)
  end

  # def adj_row(index)
  #   middle_of_box?(index) ? row(index) + 1 : row(index)
  # end

  def col(index)
    (index % base)
  end

  # def box(index)
  #   box = ( ( adj_row(index) * col(index) ) / base ) + 1
  # end

  # def middle_of_box?(index)
  #   row(index) % 3 == 2 && col(index) % 3 == 2
  # end

  def base
    WIDTH
  end

end