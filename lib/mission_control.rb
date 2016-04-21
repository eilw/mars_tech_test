class MissionControl

  def initialize(mars, robot_klass)
    @mars = mars
    @robot_klass = robot_klass
  end

  def launch_robot(start_coordinate)
    @robot = @robot_klass.new(start_coordinate)
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
