require 'planet'

describe Planet do
  let(:grid){ double('grid', has_scent?: false) }
  let(:grid_klass){ double('grid_klass', new: grid) }
  subject(:mars){described_class.new("5 3", grid_klass)}

  describe '#create_planet' do
    it 'consists of grids according to given coordinates' do
      expect(grid_klass).to receive(:new).exactly(15).times
      mars2 = Planet.new('5 3', grid_klass)
    end

    it 'grid is laid out according to coordinates' do
      expect(mars.territory.length).to eq(5)
      expect(mars.territory[0].length).to eq(3)
    end
  end

  describe '#has_scent?' do
    it 'calls the grid in question to see if it has a scent' do
      allow(mars.territory[4][3]).to receive(:has_scent?){true}
      expect(grid).to receive(:has_scent?).with('N')
      mars.has_scent?([5, 3, 'N'])
    end

    it 'returns false if no scent is given' do
      expect(mars.has_scent?([5, 3, 'N'])).to be(false)
    end
  end

end
