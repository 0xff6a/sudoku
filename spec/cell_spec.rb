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

end