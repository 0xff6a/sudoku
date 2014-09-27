require 'cell'

describe Cell do
  
  let(:cell) { Cell.new }

  context 'initialisation' do

    it 'should have a value' do
      expect(cell.value).to eq 0
    end

    it 'should have a list of candidate values' do
      expect(cell.candidates).to eq (1..9).to_a
    end

    it 'should have no neighbours initially' do
      expect(cell.neighbours).to eq []
    end 

  end

  context 'solving a cell' do

    it 'should not be solved initially' do
      expect(cell).not_to be_solved
    end

    it 'can be solved' do
      cell.neighbours = (2..9).map{|val| Cell.new(val) }
      cell.solve!
      expect(cell).to be_solved
    end

    it 'updates candidates before solving' do
      expect(cell).to receive(:update_candidates)
      cell.solve!
    end

  end

end