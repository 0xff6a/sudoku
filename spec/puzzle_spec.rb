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

  context 'solving the puzzle' do

    it 'should not be solved initially' do
      expect(puzzle).not_to be_solved
    end

    it 'can solve the puzzle' do
      puzzle.solve!
      expect(puzzle).to be_solved
    end

    it 'can return a solution string' do
      puzzle.solve!
      expect(puzzle.solution).to eq '615493872348127956279568431496832517521746389783915264952681743864379125137254698'
    end

  end

  context 'solving a hard puzzle' do

    let(:hard)        {'800000000003600000070090200050007000000045700000100030001000068008500010090000400'}
    let(:hard_puzzle) { Puzzle.new(hard) }

    it 'can solve the hard puzzle' do
      hard_puzzle.solve!
      expect(hard_puzzle).to be_solved
    end

    it 'can solve an empty sudoku' do
      blank = Puzzle.new('0' * 81)
      blank.solve!
      expect(blank).to be_solved
      puts blank.display
    end
    
  end
  
end