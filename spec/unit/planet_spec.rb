require 'planet'

describe Planet do
  let(:grid){ double('grid', has_scent?: false, leave_scent:true) }
  let(:grid_klass){ double('grid_klass', new: grid) }
  let(:direction){ 'N' }
  subject(:mars){described_class.new("5 3", grid_klass)}

  describe 'initialised' do
    it 'consists of grids according to given coordinates' do
      expect(grid_klass).to receive(:new).exactly(24).times
      mars2 = Planet.new('5 3', grid_klass)
    end

    it 'grid is laid out according to coordinates' do
      expect(mars.get_territory.length).to eq(6)
      expect(mars.get_territory[0].length).to eq(4)
    end
  end

  describe '#has_scent?' do
    it 'calls the grid in question to see if it has a scent' do
      allow(mars.get_territory[5][3]).to receive(:has_scent?){true}
      expect(mars.has_scent?([5, 3], direction)).to be true
    end

    it 'returns false if no scent is given' do
      expect(mars.has_scent?([5, 3], direction)).to be(false)
    end
  end

  describe '#off?' do
    it 'reports if the grid is not part of the planet' do
      expect(mars.off?([5,4])).to be true
    end

    it 'reports if it is part of the planet' do
      expect(mars.off?([1,1])).to be false
    end
  end

  describe '#leave_scent' do
    it 'leaves scent at the specific grid' do
      expect(grid).to receive(:leave_scent)
      mars.leave_scent([5,3], direction)
    end
  end
end
