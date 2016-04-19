require 'mission_control'
require 'mars'
require 'grid'
require 'robot'


describe 'feature tests' do

  let(:mars){Mars.new("5 3", Grid)}
  let(:mission_control){MissionControl.new(mars, Robot)}

  describe 'sample input' do

    it 'Mission 1: the robot goes in a circle' do
      mission_control.launch_robot('1 1 E')
      mission_control.send_instructions('RFRFRFRF')
      expect(mission_control.output).to eq('1 1 E')
    end

    it 'Mission 2: the robot reports that it is lost' do
      mission_control.launch_robot('3 2 N')
      mission_control.send_instructions('FRRFLLFFRRFLL')
      expect(mission_control.output).to eq('3 3 N LOST')
    end

    it 'Mission 3: the robot moves around' do
      mission_control.launch_robot('0 3 W')
      mission_control.send_instructions('LLFFFLFLFL')
      expect(mission_control.output).to eq('2 3 S')
    end
  end
end
