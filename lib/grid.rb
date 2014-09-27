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
    cells.map(&:solve!)
  end

  def display_boxes
    puts 'HELLO'
    # puts (0...81).map{ |i| "row: #{row(i)} column: #{col(i)} box: #{box(i)}" }
    puts (0...81).map{ |i| box(i) }.inspect
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
    # (0...base).map{ |i| box(index) }
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

end