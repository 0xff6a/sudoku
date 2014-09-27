require 'puzzle'

describe Puzzle do

  let(:string) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let(:puzzle) { Puzzle.new(string)}

  context 'initialisation' do

    it 'should have a grid' do
      expect(puzzle.grid).to be_an_instance_of(Grid)
    end

    it 'should have a puzzle string' do
      expect(puzzle.puzzle_string).to eq string
    end

    it 'should fill the grid with a puzzle string on initialisation' do
      expect(puzzle.grid.to_s).to eq string
    end

  end
  
end