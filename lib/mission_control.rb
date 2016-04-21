class MissionControl

  def initialize(planet, robot_klass)
    @planet = planet
    @robot_klass = robot_klass
  end

  def launch_robot(planet, start_coordinate)
    @robot = @robot_klass.new(planet, start_coordinate)
  end

  def send(instructions)
    instructions.split('').each{|instruction| @robot.move(instruction)}
  end

  def request_status(robot)
    output = robot.report_status
    print_status(output)
  end

  private

  def print_status(output)
    puts output.join(' ')
  end
end
