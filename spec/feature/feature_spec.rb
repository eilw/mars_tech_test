require 'mission_control'
require 'planet'
require 'grid'
require 'robot'


describe 'feature tests' do

  let(:mars){Planet.new("5 3", Grid)}
  let(:mission_control){MissionControl.new(mars, Robot)}

  describe 'sample input' do

    it 'Mission 1: the robot goes in a circle' do
      robot = mission_control.launch_robot(mars,'1 1 E')
      mission_control.send('RFRFRFRF')
      expect(STDOUT).to receive(:puts).with('1 1 E')
      mission_control.request_status(robot)
    end

    it 'Mission 2: the robot reports that it is lost' do
      robot = mission_control.launch_robot(mars,'3 2 N')
      mission_control.send('FRRFLLFFRRFLL')
      expect(STDOUT).to receive(:puts).with("3 3 N LOST")
      mission_control.request_status(robot)
    end

    it 'Mission 3: the robot ignores commands if there is a scent' do
      robot = mission_control.launch_robot(mars,'0 3 W')
      mission_control.send('LLFFFLFLFL')
      expect(STDOUT).to receive(:puts).with("2 3 S")
      mission_control.request_status(robot)
    end
  end
end
