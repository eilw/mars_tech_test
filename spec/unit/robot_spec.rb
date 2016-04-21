require 'robot'

describe Robot do
  let(:mars){ double('planet', has_scent?: false, off?: false, leave_scent: true)}
  let(:start_coordinate){'1 1 E'}
  subject(:robot){described_class.new(mars, start_coordinate)}

  describe '#report_status' do
    it 'returns its coordinates' do
      expect(robot.report_status).to eq([1,1,'E'])
    end
  end

  describe '#move' do

    context 'Normal movements' do
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

    context 'Moving across the edge of planet' do

      it 'checks if there is a scent' do
        expect(mars).to receive(:has_scent?)
        robot.move('F')
      end

      it 'does not move forward if there is a scent' do
        allow(mars).to receive(:has_scent?){true}
        robot.move('F')
        expect(robot.report_status).to eq([1, 1,'E'])
      end

      it 'reports back lost at is previous location if goes off the planet' do
        allow(mars).to receive(:off?){true}
        robot.move('F')
        expect(robot.report_status).to eq([1, 1,'E LOST'])
      end
    end

  end

end
