require 'cell'
describe Cell do
  describe 'alive?' do
    it'defaults to dead' do
      cell = described_class.new
      expect(cell.alive?).to eq false
    end
  end
    describe 'setCurrent' do
    it 'can be set current to true' do
      cell = described_class.new
      cell.setFuture(true)
      cell.updateCurrent
      expect(cell.current).to eq true
    end

  end
end
