require 'robot'

describe Robot do
  let(:start_coordinate){'1 1 E'}
  subject(:robot){described_class.new(start_coordinate)}

  describe '#report_status' do
    it 'returns its coordinates' do
      expect(robot.report_status).to eq([1,1,'E'])
    end
  end

  describe '#move' do
    it 'when given a F it moves one block forward' do
      robot.move('F')
      expect(robot.report_status).to eq([2, 1,'E'])
    end

    it 'when given a R it changes direction 90 degrees clockwise' do
      robot.move('R')
      expect(robot.report_status).to eq([1, 1,'S'])
    end

    it 'when given a L it changes direction 90 degrees counter-clockwise' do
      robot.move('L')
      expect(robot.report_status).to eq([1, 1,'N'])
    end

  end

end
