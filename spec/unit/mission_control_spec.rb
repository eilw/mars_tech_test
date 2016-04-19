require 'mission_control'

describe MissionControl do
  let(:mars){ double('mars') }
  let(:robot){ double('robot', move: true, report_status:'OK')}
  let(:robot_klass){ double('robot_klass', new: robot) }
  subject(:mission_control){described_class.new(mars, robot_klass)}

  describe '#launch_robot' do
    it 'a new robot is created and initalised with a coordinate' do
      expect(robot_klass).to receive(:new).with(instance_of(String))
      mission_control.launch_robot('1 1 E')
    end
  end

  describe '#send' do
    it 'robot receives instructions' do
      instructions = 'RR'
      mission_control.launch_robot('1 1 E')
      expect(robot).to receive(:move).exactly(instructions.length)
      mission_control.send(instructions)
    end
  end

  describe '#request_status' do
    it 'requests the current status of the robot' do
      expect(robot).to receive(:report_status)
      mission_control.request_status(robot)
    end

    it 'prints out the status of the robot' do
      expect(STDOUT).to receive(:puts).with('OK')
      mission_control.request_status(robot)
    end
  end
end
