require 'grid'

describe Grid do
  
  let(:grid) { Grid.new }

  context 'initialisation' do

    it 'should hold a collection of 81 cells' do
      expect(grid.cells.count).to eq 81
    end

    it 'should populate cell with neighbours' do
      expect(grid.cells[1].neighbours[0]).to eq grid.cells[0]
    end

    it 'should know neighbour indices of a cell' do
      expect(grid.send(:neighbours, 10).sort).to eq [0, 1, 2, 9, 11, 12, 13, 14, 
          15, 16, 17, 18, 19, 20, 28, 37, 46, 55, 64, 73]
      expect(grid.send(:neighbours, 80).sort).to eq [8, 17, 26, 35, 44, 53, 60, 61, 62, 69, 70,
        71, 72, 73, 74, 75, 76, 77, 78, 79]
    end

  end

  context 'managing cells' do

    let(:index) { 8 }

    it 'can try to solve all cells' do
      _fill_neighbour_cells(index)
      grid.try_solve_all_cells
      expect(grid.cells[index]).to be_solved
    end

    it 'can count how many cells are  unsolved' do
      _fill_neighbour_cells(index)
      grid.try_solve_all_cells
      expect(grid.unsolved_count).to eq 72
    end

    it 'knows the index of a cell' do
      expect(grid.index(grid.cells[index])).to eq index
    end

  end

  context 'cell content' do

    it 'can return contents as a string' do
      expect(grid.to_s).to eq '0' * 81
    end

    it 'can fill cells from puzzle string' do
      string = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
      grid.fill_with(string)
      expect(grid.to_s).to eq string
    end

  end

  def _fill_neighbour_cells(index)
    grid.cells[index].neighbours.each_with_index{ |cell, idx| cell.value = idx + 2}
  end

end