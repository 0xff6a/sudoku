require 'grid'

describe Grid do
  
  let(:grid) { Grid.new }

  context 'initialisation' do

    it 'should hold a collection of 81 cells' do
      expect(grid.cells.count).to eq 81
    end

    it 'should associate cell with neighbour indices' do
      expect(grid.cells[10].neighbours).to eq [0, 1, 2, 9, 11, 12, 13, 14, 
          15, 16, 17, 18, 19, 20, 28, 37, 46, 55, 64, 73]
    end

  end

  context 'updating cells' do

    it 'can update cells with candidates based on neighbour values' do
      grid.cells[1].value = 9
      grid.cells[2].value = 8
      grid.cells[80].value = 7
      grid.update_cells
      expect(grid.cells[0].candidates).to eq (1..7).to_a
    end

  end

end