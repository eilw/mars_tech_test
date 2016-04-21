require 'grid'

describe Grid do
  subject(:grid){described_class.new()}

  describe '#has_scent?' do
    it 'does not have a scent initially' do
      expect(grid.has_scent?('N')).to be false
    end
  end

  describe '#leave_scent' do
    it 'matches the scent with the direction given' do
      grid.leave_scent('N')
      expect(grid.has_scent?('N')).to be true
    end
  end
end
